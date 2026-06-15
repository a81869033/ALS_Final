# AI-Based AIG Optimization 報告草稿

## 1. 專案目標與重現環境

本專案的目標是針對 `benchmarks/ex200.truth` 到 `ex299.truth` 共 100 個 Boolean function，產生功能等價且 ADP 較低的 AIG。品質指標採用 `ADP = area * delay`，其中 area 是 AIG 內部 two-input AND node 數量，delay 是 AIG level。所有候選 AIG 都必須通過官方等價檢查；未等價的結果不會被放入最終 best set。

本地工具以專案內的 `student/` 為主，不依賴系統全域安裝。主要元件如下：

- `student/abc`：用於 `read_truth -xf`、CEC、area/delay 量測與大部分 ABC/ABC9 後端流程。
- `student/tools/conda-env/`：本地工具環境，包含 Yosys、Icarus Verilog、Rust/Cargo、Python 套件等。
- `student/frontends/`：truth-table 解析、simulation/equivalence、Yosys frontend synthesis。
- `student/generators/`：針對不同 benchmark family 產生 Verilog/RTL seed。
- `student/backends/`：ABC、ABC9、MockTurtle、CULS、E-Syn 與 hybrid backend wrapper。
- `student/scripts/`：搜尋、驗證、整理 current best、更新 `output/` 的主要入口。

重現時先在專案根目錄設定工具路徑：

```bash
cd ALS_Final_Project
export PATH=$PWD/student/tools/conda-env/bin:$PATH
```

若只要重建目前提交用的 `output/exNNN.aig`，可直接從目前 best index 複製並驗證：

```bash
python3 student/scripts/update_current_best_by_case.py
python3 student/scripts/update_output_best.py
python3 evaluate.py
```

`update_current_best_by_case.py` 會掃描已驗證結果並選出每個 case 最低 ADP 的 AIG；`update_output_best.py` 會複製到 `output/`，並在 `student/results/output_current_best_index.csv` 記錄來源、area、delay、ADP 與 hash。若要重新跑某個 domain 的後端搜尋，可使用 `run_backend_portfolio.py --portfolio-version v3-ga`，例如：

```bash
python3 student/scripts/run_backend_portfolio.py \
  --portfolio-version v3-ga --domain integer --cases ex255-ex279 \
  --run-id newseeds_integer_v3a_20260614_1952 \
  --current-bundle student/new_seeds/integer/ex255_ex279_current \
  --backend-bundle-glob 'student/new_seeds/integer/ex255_ex279_backend_candidates_*' \
  --jobs 40 --case-jobs 10 --task-jobs 4 \
  --skip-culs --disable-esyn \
  --max-generations 8 --population-size 32 \
  --offspring-per-generation 96 --max-sequence-len 4 \
  --per-case-runtime-soft-limit 7200 --abc-timeout 90 --resume
```

其他 domain 使用同一套指令結構，只需替換 `--domain`、`--cases`、`--run-id` 與 seed bundle 路徑。最後一律用 `python3 evaluate.py` 作為正式 correctness 與 QoR 檢查。

## 2. 方法架構

整體流程分成 frontend seed generation、seed curation、backend optimization、result aggregation 四層：

```text
truth table
-> frontend semantic / structural reconstruction
-> Yosys or ABC synthesis to verified AIG seeds
-> curated current + backend-candidate seed bundles
-> V3A evolutionary backend search
-> targeted rescue for near-reference / high-gap cases
-> current_best_by_case.csv
-> output/exNNN.aig + evaluate.py
```

Frontend seed generation 不只使用 `read_truth -xf; st` baseline，而是針對 benchmark family 產生較接近語意結構的 Verilog seed。`student/generators/` 包含 BF16/FP16 unary functions、FP8 conversion/add、integer arithmetic，以及 unknown functions 的 BDD、ANF、cofactor、decision graph、parity/key transform 等方法。所有 seed 都經過 Yosys/ABC synthesis，再用 `evaluate.py`/ABC CEC 確認等價。

Seed curation 使用 `student/new_seeds/` 保存可重現的 frontend-only seed set：每個 case 有一個 `*_current` seed，並保留多個 `*_backend_candidates_*` 作為後端起點。最低 ADP 的 frontend seed 不一定最適合後端，因此後端搜尋需要保留不同 family 的結構 diversity。`student/new_seeds/final_report.md` 記錄了 100 個 current AIG 與 607 個 backend candidate AIG；current bundle 有 100/100 official `evaluate.py` 等價紀錄。

Backend optimization 的主流程是 `student/scripts/run_backend_portfolio.py --portfolio-version v3-ga`。V3A 不是固定 ABC command list，而是 per-case evolutionary backend search。每個 case 維護 population、Pareto archive、near-Pareto pool、operator history 與 checkpoint；每代從 current best、Pareto/near-Pareto rows、各 root family best 與 archive restart parent 中選 parent，產生 mutation、crossover、restart 三類 offspring。每個 offspring 是一串 ABC/ABC9/MockTurtle 或 cross-tool command sequence，最後 AIG 必須通過 CEC 才能進入 best。

V3A 的 operator pool 包含 ABC rewrite/refactor/resub/balance/dc2、ABC9 `&syn*`/`&dc*`/`&fraig`/`&transduction`、MockTurtle resub/balance，以及少量 truth seed 或 final-only heavy command。operator selection 約分成 exploit、explore、perturb 三種模式；近期有效的 operator 權重較高，長時間未嘗試的 operator 仍會被探索，高風險 operator 只在特定情況下使用。每個 step 都有獨立 timeout、log 與 status。

最後是 targeted rescue 與輸出整理。接近 reference 但仍略高的 case 會跑低風險 near-reference polish；ratio 大於 1.5 的 case 則用更長 GA、deepsyn 類 flow 或更多 seed diversity。每次有新 best 後，再更新 `current_best_by_case.csv` 與 `output/`。

## 3. AI/LLM 在流程中的使用

AI/LLM 在本專案中主要扮演「實驗設計、假設生成、程式實作與結果分析」的角色，而不是直接產生未驗證的最終 AIG。實際 correctness 仍完全由 ABC CEC 與 `evaluate.py` 決定。

第一，LLM 協助做 benchmark family classification 與 high-level function hypothesis。根據 truth-table pattern、case notes、學長投影片/錄音整理與既有 run summary，LLM 將 cases 分成 BF16、FP16、FP8/integer、unknown 等類別，並提出可能語意結構。例如 BF16/FP16 以 sign/exponent/mantissa、special case、rounding/saturation、selected output bit shell 為主；integer 以 multiplication/division/square/isqrt 結構為主；unknown 則嘗試 BDD cofactor、ANF/Davio、prefix/key transform、one-hot class mux、route/image descriptor 等描述。

第二，LLM 用來產生與修改搜尋程式。`student/generators/`、`student/scripts/`、`student/frontends/`、`student/backends/` 中的許多 helper 都是在多輪 prompt 下逐步建立或調整，例如 frontend campaign index、new seed bundle builder、V3A backend portfolio、targeted rescue wrapper、current best/output update scripts。LLM 也協助把 run 輸出規範化成 `student/work/<run_id>/`、`student/runs/<domain>/<run_id>/results/*.csv` 與 manifest，避免結果散落後無法重現。

第三，LLM 被用來做 closed-loop experiment planning。`prompt_log.md` 保留了多輪 prompt，例如要求針對 `ADP/ref < 1.1` 的 cases 做 near-reference polish、針對 `ADP/ref > 1.5` 的 cases 平行做 heavy/deepsyn rescue、或分派 subagent 專攻 `ex286/ex287` 的 structural decomposition。每輪結束後，LLM 依 `best.csv`、`summary.csv`、`current_best_by_case.csv` 判斷哪些 case 已低於 reference、哪些只適合 backend polish、哪些必須回到 frontend 重做 seed。

第四，LLM 協助維護 prompt template 與失敗假設記錄。frontend campaign 的 `attempted_methods.csv`、`method_judgments.csv`、`hypothesis_bank.csv`、`case_index/exNNN.md` 用來避免重複已知低價值方法。這形成了一個 lightweight knowledge base：新的搜尋會先讀取先前失敗原因，再選擇不同 decomposition、shared structure 或 synthesis flow。

代表性的 prompt 類型如下：

| 類型 | 目的 | 產物 |
|---|---|---|
| Case diagnosis prompt | 分析特定 truth table 或 case gap，提出 semantic/structural hypotheses | `student/cases/` notes、frontend generator |
| Frontend campaign prompt | 要求 agent 在限定 case/output path 內搜尋 Verilog seed | `student/work/` artifacts、`student/runs/` CSV |
| Backend rescue prompt | 依 ratio 分組，對 near/high-gap cases 跑不同強度後端 | V3A/targeted rescue run |
| Result audit prompt | 檢查 current best、CPU/process、output 是否已更新 | `current_best_by_case.csv`、`output_current_best_index.csv` |

## 4. 實驗結果與觀察

以下數字暫以 `student/results/current_best_by_case.csv` 目前 snapshot 為準；因部分 rescue run 尚未完全結束，最終提交前需要重新執行：

```bash
python3 student/scripts/update_current_best_by_case.py
python3 student/scripts/update_output_best.py
python3 evaluate.py
```

目前 100 個 case 皆有 current best AIG，並已可複製到 `output/`。截至目前 snapshot，總 best ADP 為 7,488,213，reference 總 ADP 為 6,696,028，總和 ratio 約 1.118。100 個 case 中，41 個已優於 reference，68 個低於 1.1x reference，96 個低於 1.5x reference。平均 ratio 約 1.091，median ratio 約 1.032。

| Domain | Cases | Avg ratio | Median ratio | Beat ref | >1.5x ref |
|---|---:|---:|---:|---:|---:|
| BF16 | 20 | 1.035 | 1.004 | 10 | 0 |
| FP16 | 20 | 1.068 | 1.012 | 9 | 1 |
| FP8/float | 15 | 0.848 | 0.934 | 10 | 0 |
| Integer | 25 | 1.086 | 1.108 | 7 | 0 |
| Unknown | 20 | 1.358 | 1.079 | 5 | 3 |

改善最明顯的 cases 多出現在 FP8/float 與部分 unknown：例如 `ex251` ratio 0.187、`ex254` ratio 0.414、`ex243` ratio 0.469、`ex287` ratio 0.488。這些 case 的共同點是 frontend 找到比 reference 更貼近原始語意或更適合後端優化的 seed，後端再透過 V3A 將 area/delay 壓低。

主要瓶頸集中在少數 high-gap cases：`ex286` ratio 約 5.947、`ex297` 約 1.764、`ex225` 約 1.685、`ex299` 約 1.618，`ex223` 也接近 1.5。這些 case 可能已被 backend polish 到局部極限，但 high-level structure 仍不夠好；單純加長 ABC sequence 或 deepsyn 不一定能解決，可能需要回到 frontend 重找 decomposition 或 shared predicate。

【最終結果更新區塊】

最終提交前請在所有 rescue run 結束後更新本段：

- `python3 evaluate.py` 結果：`__ / 100` equivalent。
- 最終總 ADP：`________`；reference 總 ADP：`________`；總和 ratio：`________`。
- 最終 beat reference cases：`________ / 100`。
- 仍高於 1.5x reference 的 cases：`________`。
- 補上最終 `student/results/current_best_by_case.csv` 的時間與 commit/run id。

## 5. 困難、限制與改進方向

第一個困難是搜尋空間很大。即使只有 ABC/ABC9 command sequence，不同 seed、command ordering、timeout 與 area-delay tradeoff 都會造成結果差異。本專案用 Pareto/near-Pareto archive、operator scoring、resume checkpoint 與 per-case runtime limit 控制成本，但仍不能保證找到 global optimum。

第二個困難是 frontend seed 品質常比 backend flow 更重要。有些 case 用 V3A 可以把 ratio 從高於 1.5 拉回 1.1 附近；但也有 case 後端反覆 polish 仍停在同一區域，代表 AIG 結構本身不夠好。這類 case 需要更好的 semantic reconstruction，例如 unknown family 的 image/route descriptor、cofactor key、class one-hot mux，或 FP16 selected-bit/exception shell。

第三個限制是部分工具受環境影響。CULS 需要 GPU runtime，sandbox 中可能無法穩定使用；E-Syn 目前只保守用在 expression-level 或 per-output rewrite，避免 whole-vector replacement 爆炸；deepsyn 類 flow 很耗時，因此只適合 high-gap final rescue，而不適合放入每個 case 的一般搜尋。

未來可以改進的方向包括：建立 learned operator policy，讓 V3A 不只依 recent score 選 command，而能利用 case feature 預測有效操作；對 unknown functions 建立更系統化的 truth-table feature extractor；把 prompt_log、method_judgments 與 run outcomes 整合成可查詢的 experiment database；最後，針對 high-gap cases 做更深入的 frontend decomposition，而不是只增加後端時間。

整體而言，本專案的核心做法是用 LLM 加速人類原本需要手動完成的 hypothesis/search/debug loop，再用嚴格的 ABC CEC 與 ADP 量測把所有 AI 產生的想法過濾成可提交的 AIG。這種流程不把 LLM 當成 correctness oracle，而是把它當成可快速產生、組織與修正實驗策略的工程工具。
