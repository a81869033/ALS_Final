# Backend V3 Current Progress And Outputs

更新時間：2026-06-14 22:10 +0800

這份文件目前以「現在真正還會用到的後端流程」為主。舊版 V1/V2、早期 V3B/V3B2 分析、以及已不建議作為主流程的內容，全部保留在後面的「舊版與歷史紀錄」區，避免查進度時被過期資訊干擾。

## 目前主線流程

目前正式後端搜尋主線是：

```text
student/new_seeds current + backend candidates
-> V3A CPU-only strengthened GA
-> V3B3 frontier-only post-pareto repair
-> optional V3B3 seed pool feedback short V3A
-> per-domain final merge
-> all-domain aggregate summary
```

目前不再把 CULS 當主流程；E-Syn 預設也關閉，只保留 optional seed generator。Deepsyn 不放進一般 V3A/V3B3 搜尋，等所有 class 跑完後，再針對仍大幅落後 reference 的 bad cases 做獨立 rescue。

## 目前輸入來源

後端正式輸入改吃 `student/new_seeds`，不要再直接吃舊 frontend campaign 的散落結果。

```text
student/new_seeds/bf16/ex200_ex219_current
student/new_seeds/bf16/ex200_ex219_backend_candidates_20260614_1324

student/new_seeds/fp16/ex220_ex239_current
student/new_seeds/fp16/ex220_ex239_backend_candidates_20260614_1324

student/new_seeds/float_fp8/ex240_ex254_current
student/new_seeds/float_fp8/ex240_ex254_backend_candidates_20260614_1324

student/new_seeds/integer/ex255_ex279_current
student/new_seeds/integer/ex255_ex279_backend_candidates_20260614_1324

student/new_seeds/unknown/ex280_ex299_current
student/new_seeds/unknown/ex280_ex299_backend_candidates_20260614_1324
```

每個 domain 的 `current` 是目前 frontend 最佳 seed；`backend_candidates_*` 是額外候選 seed，用來保留結構 diversity，避免後端只從單一 AIG 出發。

## 目前已知 run 狀態

### BF16

下午跑好的 BF16 V3A 可作為 V3B3 測試輸入：

```text
student/runs/bf16/newseeds_backend_full_20260614_1420_bf16_v3a/
```

目前建議用這個 run 測 V3B3：

```bash
python3 student/scripts/run_backend_postpareto.py \
  --domain bf16 \
  --input-run-id newseeds_backend_full_20260614_1420_bf16_v3a \
  --run-id newseeds_backend_full_20260614_1420_bf16_v3b3 \
  --cases ex200-ex219 \
  --jobs 20 \
  --task-jobs 4 \
  --postpareto-version v3b3 \
  --enable-cliff-repair \
  --max-parent-points 128 \
  --max-frontier-regions-per-case 16 \
  --max-gap-hybrids-per-region 12 \
  --max-cliff-repairs-per-region 8 \
  --max-structural-donor-plans-per-region 8
```

V3B3 summary 輸出：

```text
student/runs/bf16/newseeds_backend_full_20260614_1420_bf16_v3b3/results/postpareto_summary.csv
```

### float_fp8

原本跑到一半的 V3A run：

```text
student/runs/float_fp8/newseeds_float_fp8_v3a_20260614_1951/
student/work/newseeds_float_fp8_v3a_20260614_1951/
```

這個才是要 resume 的 run。後來忘記加 `--run-id` 自動產生的：

```text
newseeds_float_fp8_v3a_20260614_2143
```

目前視為誤開 run，不作正式結果來源。

Resume command：

```bash
python3 student/scripts/run_backend_portfolio.py \
  --portfolio-version v3-ga \
  --domain float_fp8 \
  --cases ex240-ex254 \
  --run-id newseeds_float_fp8_v3a_20260614_1951 \
  --current-bundle student/new_seeds/float_fp8/ex240_ex254_current \
  --backend-bundle-glob 'student/new_seeds/float_fp8/ex240_ex254_backend_candidates_*' \
  --jobs 24 \
  --case-jobs 6 \
  --task-jobs 4 \
  --skip-culs \
  --disable-esyn \
  --max-generations 8 \
  --population-size 32 \
  --offspring-per-generation 96 \
  --max-sequence-len 4 \
  --per-case-runtime-soft-limit 7200 \
  --abc-timeout 90 \
  --resume
```

### integer

原本跑到一半的 V3A run：

```text
student/runs/integer/newseeds_integer_v3a_20260614_1952/
student/work/newseeds_integer_v3a_20260614_1952/
```

Resume command：

```bash
python3 student/scripts/run_backend_portfolio.py \
  --portfolio-version v3-ga \
  --domain integer \
  --cases ex255-ex279 \
  --run-id newseeds_integer_v3a_20260614_1952 \
  --current-bundle student/new_seeds/integer/ex255_ex279_current \
  --backend-bundle-glob 'student/new_seeds/integer/ex255_ex279_backend_candidates_*' \
  --jobs 40 \
  --case-jobs 10 \
  --task-jobs 4 \
  --skip-culs \
  --disable-esyn \
  --max-generations 8 \
  --population-size 32 \
  --offspring-per-generation 96 \
  --max-sequence-len 4 \
  --per-case-runtime-soft-limit 7200 \
  --abc-timeout 90 \
  --resume
```

## V3A 目前有用到的方法

V3A 是目前主力後端搜尋器，入口仍是：

```text
student/scripts/run_backend_portfolio.py --portfolio-version v3-ga
```

### V3A 整體實作流程

V3A 不是固定 sequence portfolio，而是一個 per-case evolutionary backend search。每個 case 獨立維護自己的 population、Pareto archive、operator history 和 checkpoint。整體資料流：

```text
load seeds
-> evaluate / normalize seed rows
-> initialize active_pool / pareto_archive / near_pareto_archive
-> optional ttopt / optional esyn seed expansion
-> repeat generation loop
   -> select parents
   -> sample command sequences
   -> run each sequence step-by-step
   -> official CEC + ADP measure final AIG
   -> update rows / lineage / operator_steps
   -> update Pareto / near-Pareto / best / case_profile
   -> checkpoint
-> optional final deepsyn trial
-> save best AIG and merged result CSV
```

實作入口是 `run_v3_ga()`。它每一代做一次固定的 GA loop：先記下目前 Pareto hash，產生 offspring tasks，平行跑所有 child sequence，最後比較是否出現新 Pareto。如果該代沒有新 Pareto，就增加 stagnation counter；連續 stagnation 後，sequence 長度會從原本 `max_sequence_len` 放寬到最多 6，讓它嘗試較長的 backend command chain。

### V3A seed loading

每個 domain 目前從 `student/new_seeds` 讀兩類 seed：

```text
current bundle              -> family_id=current
backend_candidates bundle   -> family_id=alt01/alt02/...
```

V3A 會保留 seed 的 root family，不會只拿當前 ADP 最好的 seed。這是為了避免某個 sub-optimal seed 雖然一開始 ADP 比較差，但結構更適合後端優化，被過早淘汰。

如果啟用 `--enable-ttopt`，會額外用 truth table 建 seed：

```abc
read_truth -xf <case.truth>
&get
&ttopt -I <pi> -O <po>
&put
strash
write_aiger -s <output.aig>
```

這不限於 ex286/ex287，只是 unknown high-gap cases 特別適合先試。V3A 預設不啟用 E-Syn；若用 `--enable-esyn`，只在 seed expansion 階段產生新初始結構，不放進每代 mutation。

### V3A parent selection

每一代會從這些來源挑 parent：

```text
global best
current Pareto rows
near-Pareto diversity rows
每個 root_family_id 的 family-best
active_pool
archive_pool restart parent
```

`select_v3_parents()` 會去重 hash/candidate，依 ADP/area/delay 排序後取 `population_size`。`build_v3_offspring()` 會用 deterministic RNG 產生 tasks：

```text
seed = global_seed + case_id * 1009 + generation * 917
```

這樣同一個 run 可重現，但不同 case/generation 不會完全跑一樣的 command choices。

### V3A offspring 生成

V3A offspring 有三種主要來源：

1. mutation：從 parent 接 1 到 N 個 operator。
2. crossover：從兩條成功過的 command sequence 拼接出新 sequence。
3. restart：每 7 次 sampling 左右會從 archive pool 抽 stale Pareto/near-Pareto point 再展開。

每個 task 的去重 key 是：

```text
parent_hash + expanded_command_sequence
```

所以 resume 時已跑過的 parent/command sequence 不會重跑。

### V3A command sampling

V3A 的 command library 由 `student/backends/v3_ga_commands.py` 建立。每個 operator 都有：

```text
id
tool
family
template
expanded_command
priority
timeout_sec
timeout_class
node_min / node_max
node_bucket
risk_level
can_start_sequence
can_follow_timeout
source_note
enabled_by_default
```

每一步抽 operator 時，`v3_operator_pool()` 大致分三種模式：

```text
50% exploit:
  挑 case_profile / operator_steps 近期分數高的 operator

30% explore:
  挑 recent_window 裡沒跑過或很久沒跑的 stale operator

20% perturb:
  挑 gated / stochastic 高風險 operator
```

operator 分數由 `v3_operator_score()` 計算：

```text
ok step           -> 加分
timeout           -> 大扣分
failed/crash      -> 扣分
產生 new Pareto    -> 大加分
ADP 有改善         -> 小到中等加分
```

分數只看 recent window，並用 `decay_factor` 衰減，避免早期有效的 command 永久支配後續決策。

現在實際有用的 command family：

- ABC1 core：`rewrite`, `rewrite -z`, `refactor`, `refactor -z`, `balance`, `resub`, `resyn`, `resyn2`, `resyn3`, `compress`, `compress2`, `dch`, `dc2`
- ABC9 core：`&b`, `&dc2`, `&syn2`, `&syn3`, `&syn4`, `&resyn3`, `&resyn3rs`, `&compress3rs`, `&fraig`, `&dc3`, `&dc4`
- Senior-inspired high priority：`ifraig`, `dfraig`, `orchestrate`, `&transduction`, `collapse; sop; fx; strash`, `&eslim`
- Perturbation / exact：`&randsyn`, `&satsyn`, `&synch2`, `&rewire`, `&eslim`
- Mapping / remap：`&if -g`, `&jf`, AND/INV genlib remap, `amap`, `map`
- MockTurtle：`crw`, `wrw`, `rf`, `resub`, `resub2`, `sim_resub`, `flow`
- Cross-tool：ABC9 -> MockTurtle, MockTurtle -> ABC9, ABC9 -> MockTurtle -> ABC9 sandwich
- Special truth seed：`read_truth -xf; &get; &ttopt -I <pi> -O <po>`，主要保留給 unknown/high-gap cases

### V3A step-wise execution

V3A 不再把整條 sequence 用一個大 timeout 包住。`run_v3_sequence_task()` 會把 sequence 拆成 step：

```text
parent AIG
-> step_00 operator
-> step_01 operator
-> ...
-> final AIG
-> official CEC + area/delay/ADP
```

每個 step 都會獨立：

```text
input_aig
output_aig
operator_id
expanded_command
timeout_sec
runtime_sec
status
notes
```

ABC/ABC9 operator 直接跑 ABC command；MockTurtle operator 會把 flow 拆開，逐段呼叫 MockTurtle runner。某個 step timeout/crash 時，會寫進 `operator_steps.csv` 和 `timeout_failures.csv`。如果 operator 設定 `can_follow_timeout=true`，sequence 可以保留上一個 working AIG 繼續下一步；否則該 sequence 會停止。

sequence 結束後，只對最後 AIG 做正式驗證：

```text
official CEC against benchmark truth
measure area / delay / ADP
hash dedup
stable artifact path copy
```

non-equivalent 的 candidate 會記錄在 history，但不會進 Pareto/best。

### V3A archive / pool 更新

每一代完成後會更新：

```text
best_row
active_pool
pareto_archive
near_pareto_archive
archive_pool
seen_hashes
completed_tasks
case_profile
```

Pareto 規則以 `(area, delay)` dominance 為主：

- area/delay tradeoff 不同會保留。
- ADP 相同但 area/delay 不同會保留。
- area/delay 相同但 AIG hash 不同，可保留少量 diversity。
- near-Pareto pool 保留少量非 Pareto 但接近 frontier 的點，讓 GA 不會只剩單一區域。

每個 case 的 checkpoint 都獨立存在 `student/work/<run_id>/<case>/checkpoints/`。Crash 或手動中斷後，用同一個 `--run-id --resume` 可以跳過已完成 tasks，接著跑。

V3A 不用固定照抄學長 timeout/node limit，而是採用 adaptive bucket：

```text
tiny:   nodes <= 200
small:  nodes <= 500
mid:    nodes <= 2000
medium: nodes <= 5000
large:  nodes <= 10000
huge:   nodes > 10000
```

典型 timeout class：

```text
cheap:       45s
normal:      75s
medium:      120s
expensive:   180s
very_exp:    300s
final_only:  600s
```

## V3A 輸出檔案

每個 V3A run 的主要結果在：

```text
student/runs/<domain>/<run_id>/results/
```

每個 case 的 checkpoint 在：

```text
student/work/<run_id>/<case>/checkpoints/
```

主要 CSV：

- `history.csv`：所有 candidate 嘗試紀錄。包含 case、candidate id、parent、tool、command、area、delay、ADP、equivalence、runtime、phase/generation。
- `operator_steps.csv`：每條 command sequence 的 step-wise 紀錄。用來追最佳解到底經過哪些 operator。
- `best.csv`：每個 case 目前最低 ADP 且 equivalent 的 best row。
- `pareto.csv`：final Pareto frontier，按 `(area, delay)` dominance 保留 tradeoff。
- `near_pareto.csv`：少量 near-Pareto diversity points，避免只剩單一區域。
- `case_profile.csv`：每個 case / family / command 的近期表現，用於後續 command sampling。
- `command_stats.csv`：operator 嘗試次數、成功次數、timeout、new Pareto 次數、近期分數。
- `lineage.csv`：candidate 的 parent/sequence/source lineage。
- `timeout_failures.csv`：timeout 或 crash 的 operator/candidate。
- `summary.csv`：每 case 後端前後比較、reference 比較、best path。
- `command_library_manifest.csv`：本次 run 使用的 command library manifest。

## V3B3 目前有用到的方法

V3B3 是目前新的 post-pareto 方向，入口：

```text
student/scripts/run_backend_postpareto.py --postpareto-version v3b3
```

V3B3 只做 frontier repair，不做 deepsyn、不做 CULS、不做 E-Syn、不做全量盲目 cone substitution。

### V3B3 整體實作流程

V3B3 是 post-processor，不直接取代 V3A。它吃一個已完成的 V3A run：

```text
V3A results/pareto.csv
V3A results/near_pareto.csv
V3A results/best.csv
V3A results/history.csv
```

然後每個 case 獨立執行：

```text
select parent pool
-> force include frontier gap/cliff endpoints
-> convert parent AIGs to BLIF DAG
-> analyze frontier regions
-> build structural index / cone match diagnostics
-> run gap repair tasks
-> run cliff repair tasks
-> run same-family light cleanup
-> run structural remerge cleanup
-> optional post-refine only on successful gap/cliff hybrids
-> official CEC + ADP evaluate all attempts
-> write postpareto_summary / seed pool
```

實作入口是 `PostParetoCaseRunner.run()`。和舊 V3B/V3B2 最大差異是：V3B3 不再直接對 input best 做 blind post-refine，也不再大量 materialize internal cone substitution。它只針對 frontier 上被判定為 gap/cliff 的區域做修補。

### V3B3 parent pool

V3B3 先用 `select_parent_pool()` 從 V3A 的 Pareto、near-Pareto、best 裡挑 parent。保留來源包含：

```text
ADP-best
area-best
delay-best
Pareto edge points
near-Pareto diversity
root_family_id representatives
frontier gap/cliff endpoints
```

V3B3 會特別把 frontier region 的左右 endpoint 強制放進 parent pool，避免剛好被 max parent limit 篩掉。每個 parent 都保留：

```text
candidate_id
family_id
root_family_id
source
command_lineage
area / delay / adp
aig_path
```

### V3B3 BLIF DAG 與 structural index

V3B3 會把 parent AIG 轉成 BLIF：

```abc
read <parent.aig>
strash
write_blif <parent.blif>
```

然後用內建 BLIF parser 建 DAG。每個 node 會記錄：

```text
fanins
truth cube / names table
level
fanout
support set
reachable POs
local cone size
```

這些資料用在兩件事：

1. 產生 PO/group crossover 時，可以知道每個 PO cone 來自哪個 parent。
2. 產生 `structural_index.csv` / `cone_matches.csv`，用來診斷不同 AIG family 是否有可共享或相似的 cone。

V3B3 現階段 structural index 主要是輔助 frontier repair 和 debug，不再像 V3B2 那樣大量直接做 internal cone substitution。

### V3B3 frontier region detection

`analyze_frontier_v3b3()` 只看 equivalent Pareto rows，依 `(delay, area)` 排序後分析相鄰點。

Gap 判斷：

```text
delay_gap >= 3
或中間缺至少 2 個 delay level
```

Cliff 判斷：

```text
local slope > max(2 * median_slope, 1.25 * p75_slope)
或 area_drop >= max(64, 0.10 * left_area, 2 * median_area_drop)
```

每個 region 會記錄：

```text
region_id
region_type = gap / cliff
left_candidate_id / right_candidate_id
left_area / left_delay
right_area / right_delay
delay_gap
area_drop
slope
left_family_id / right_family_id
same_family
target_delay_min / target_delay_max
target_area_max
target_adp_bound
priority
```

priority 會提高不同 family endpoint 的 region，因為不同 family 通常代表不同結構空間，比較有機會透過混合產生新解。

### V3B3 gap repair

Gap repair 只對 `region_type=gap` 的 frontier pair 做。

如果左右 endpoint 來自不同 family，V3B3 會產生 PO/group crossover plans：

```text
low half outputs from right
high half outputs from right
alternating outputs
critical PO group
non-critical PO group
area-best / delay-best mix
critical single PO
```

每個 plan 都是把不同 parent 的 PO cone 組成一個 hybrid BLIF，再轉回 AIG。因為同一個 case 的每個 parent 都應該等價於同一 truth，所以理論上 PO-level cone replacement 是合理嘗試；但最後仍必須通過 official CEC 才能算。

hybrid 產生後會跑 cleanup：

```abc
strash; dc2; &get; &fraig; &dc2; &put; strash
```

目的不是單純拼接，而是讓 ABC 重新做 structural sharing，嘗試把來自不同 parent 的 cone 重新合併。

如果是 single-output case，PO crossover 沒有意義，會改走 critical-cone/cliff repair。

### V3B3 cliff repair

Cliff repair 用於 frontier 上 area/delay 變化很陡的 endpoint。

做法：

1. 從 BLIF DAG 計算每個 PO 的 level。
2. 選 top critical PO。
3. 抽出該 PO cone。
4. 對該 local cone 跑短 repair command。
5. 把 repair 後的 PO cone 塞回原 graph。
6. 全域 cleanup。
7. official CEC + ADP。

目前 repair command family：

```text
balance
abc9_dch_dc2
abc9_resyn3rs
map_if_g
transduction_t0
eslim_cleanup_dc2
```

這是針對「delay cliff」或「某些 PO cone 太深」的情況，而不是全圖盲目重跑大 portfolio。

### V3B3 same-family light cleanup

如果 gap/cliff 左右 endpoint 是同一個 root family，V3B3 不做 heavy crossover，因為兩邊結構可能太接近，混合價值較低。這種 region 只做 light cleanup，避免浪費大量時間。

### V3B3 structural remerge

V3B3 只對已經 equivalent 的 frontier hybrids 做 structural remerge。也就是：

```text
gap/cliff hybrid
-> equivalent
-> remerge cleanup
-> CEC + ADP
```

不會對所有 parent 或所有 internal cone 暴力展開。這是為了避免 V3B2 那種大量 substitution 但幾乎沒有分數改善的問題。

### V3B3 best selection

V3B3 的 best 來源只允許：

```text
input V3A best
gap_po_crossover
gap_group_crossover
structural_remerge
cliff_critical_repair
post_refine from gap/cliff hybrid
```

如果 `post_refine` 成為 best，它必須是從 gap/cliff hybrid 來的，不能是直接對 input best 做 blind refine。這點是為了確保 V3B3 真正在測 frontier repair，而不是又退回 V3B2 的 direct post-refine。

V3B3 repair 類型：

- `gap_po_crossover`
- `gap_group_crossover`
- `structural_remerge`
- `cliff_critical_repair`
- `post_refine`，但只能接在 gap/cliff hybrid 後面，不能直接變成主體

## V3B3 輸出檔案

V3B3 結果在：

```text
student/runs/<domain>/<v3b3_run_id>/results/
```

主要 CSV：

- `frontier_regions_v3b3.csv`：偵測到的 gap/cliff region，包含 endpoint、family pair、target area/delay/adp、priority。
- `family_regions.csv`：parent pool 中各 family/source/lineage 的 QoR 與 frontier role。
- `crossover_attempts.csv`：gap PO/group crossover 嘗試，包含 plan、parents、cleanup command、equivalence、QoR。
- `critical_cone_repairs.csv`：cliff critical PO/cone repair 嘗試，包含 selected PO/cone、repair command、before/after QoR。
- `postpareto_decision_summary.csv`：沒改善或沒 materialize 的原因統計，例如 no gap、same family、CEC failed、cleanup worsened。
- `v3b3_seed_pool.csv`：可回饋給 V3A short refine 的 V3B3 best/new Pareto/near-Pareto candidates。
- `postpareto_summary.csv`：每 case 的 V3A input best、V3B3 best、delta、reference ratio、best repair type。

`postpareto_summary.csv` 是先看 V3B3 有沒有用的主檔案。

## Full Flow 目前用法

總控腳本：

```text
student/scripts/run_backend_full_flow.py
```

目前 full flow 已支援 V3B3：

```bash
python3 student/scripts/run_backend_full_flow.py \
  --domains all \
  --jobs 128 \
  --v3a-case-jobs 8 \
  --v3a-task-jobs 16 \
  --postpareto-versions v3b3 \
  --postpareto-task-jobs 4 \
  --run-id-prefix newseeds_backend_full_<timestamp> \
  --keep-going
```

`--case-jobs` / `--task-jobs` 概念：

```text
case-jobs = 同時跑幾個 case
task-jobs = 每個 case 內同時跑幾個 backend child task
```

例如：

```text
--case-jobs 8
--task-jobs 16
```

約等於同時最多 `8 x 16 = 128` 個 backend task。若剩少數 tail cases，調高 `task-jobs` 比調高 `case-jobs` 更有用。

## CPU 負載判斷

快速看：

```bash
uptime
vmstat 1 5
```

這台機器是 128 logical CPU。判斷方式：

```text
load average < 80:   還很空
load average 80-128: 合理滿載
load average > 128:  開始排隊
load average > 180:  太滿，會明顯變慢
```

`vmstat` 看 `id` 欄：

```text
id > 40:  還很空
id 10-30: 接近滿載但可接受
id < 5:   CPU 幾乎吃滿
wa > 10:  可能卡 I/O，不是單純 CPU 問題
```

## 目前注意事項

- 不要把 `newseeds_float_fp8_v3a_20260614_2143` 當正式結果，這是忘記指定 run id 後自動開的 run。
- Resume 一律用原本想接續的固定 run id，並加 `--resume`。
- V3B3 是新的 frontier-only post-pareto 實作，主要用來驗證學長提到的 cliff/gap repair 思路。它不應只靠 direct post-refine 撿分。
- 若 V3B3 沒改善，優先看 `frontier_regions_v3b3.csv` 和 `postpareto_decision_summary.csv`，判斷是沒有有效 gap/cliff、hybrid CEC fail、cleanup worsened，還是 family diversity 不足。
- 最終正式成績應該用 per-case merge，不要整包只拿單一 stage。

---

# 舊版與歷史紀錄

以下內容是舊版進度、早期架構與歷史分析。它保留作為追溯用途，但目前主要操作請以上方「目前主線流程」為準。

# Backend V3A / V3B GA 進度與輸出報告

更新時間：2026-06-14 16:14 +0800

## 2026-06-14 目前最新狀態

目前後端已經從「單一 class 手動跑 V3A/V3B」推進到「可直接吃 `student/new_seeds` 並串完整 flow 的總控腳本」。最新正式方向是：

```text
new_seeds current + backend candidates
-> V3A strengthened GA
-> V3B1 focused post-pareto
-> V3B2 score-first/direct-refine post-pareto
-> V3B seed pool feedback short V3A
-> per-case final merge
-> all-domain aggregate summary
```

目前正在 tmux `backend_2-1` 裡跑全 class 後端：

```bash
python3 student/scripts/run_backend_full_flow.py \
  --domains all \
  --jobs 96 \
  --v3a-case-jobs 12 \
  --v3a-task-jobs 8 \
  --run-id-prefix newseeds_backend_full_20260614_1420 \
  --keep-going
```

目前 active root run id prefix：

```text
newseeds_backend_full_20260614_1420
```

截至 2026-06-14 16:14 左右，流程仍在第一個 domain 的第一階段：

```text
bf16 V3A: newseeds_backend_full_20260614_1420_bf16_v3a
```

tmux 已印出 completed rows：

```text
ex200-ex216: rows=773
ex218: rows=773
```

work checkpoint 內所有 `ex200-ex219` 都已有 `checkpoints/summary.csv`，但外層 V3A 還沒完成 top-level merge。`ex217` / `ex219` 仍有 active ABC child process 在 generation 7 跑 eSLIM / collapse / transduction 類 operator。這不是 crash；是 BF16 V3A tail cases 還在跑。

目前 CPU snapshot：

```text
load average: 約 21-30
CPU idle: 約 85%
```

代表現在 `12 x 8 = 96` 的 V3A 併發還沒有吃滿 128 logical CPU。後續若要重開 resume，可以考慮：

```bash
python3 student/scripts/run_backend_full_flow.py \
  --domains all \
  --jobs 128 \
  --v3a-case-jobs 8 \
  --v3a-task-jobs 16 \
  --run-id-prefix newseeds_backend_full_20260614_1420 \
  --keep-going
```

建議停在 stage 邊界重開，例如等 tmux 出現：

```text
run_id: newseeds_backend_full_20260614_1420_bf16_v3a
results: .../student/runs/bf16/newseeds_backend_full_20260614_1420_bf16_v3a/results
```

此時 BF16 V3A top-level merge 已完成，重開後會接著跑 BF16 V3B1 / V3B2 / feedback / merge。

## 最新新增腳本與 runner 修正

### `student/scripts/run_backend_full_flow.py`

新增總控腳本，負責把完整後端流程串起來。

預設 domain 順序：

```text
bf16       ex200-ex219
fp16       ex220-ex239
float_fp8  ex240-ex254
integer    ex255-ex279
unknown    ex280-ex299
```

每個 domain 使用 `DOMAIN_SPECS` 指到 `student/new_seeds`：

```text
current bundle:
  student/new_seeds/<domain>/<case_range>_current

backend candidate bundle:
  student/new_seeds/<domain>/<case_range>_backend_candidates_*
```

例如 BF16：

```text
student/new_seeds/bf16/ex200_ex219_current
student/new_seeds/bf16/ex200_ex219_backend_candidates_*
```

總控腳本每個 domain 會依序跑：

1. V3A GA：

```text
<root>_<domain>_v3a
```

2. V3B1 focused post-pareto：

```text
<root>_<domain>_v3b1
```

3. V3B2 score-first post-pareto：

```text
<root>_<domain>_v3b2
```

4. V3B seed pool feedback short V3A：

```text
<root>_<domain>_feedback_short
```

5. per-domain final merge：

```text
<root>_<domain>_final_merge
```

最後會輸出全域 aggregate：

```text
student/runs/all_backend/<root_run_id>/results/aggregate_final_backend_summary.csv
```

### `run_backend_portfolio.py` 併發修正

V3A runner 原本只有 `--jobs`，它同時影響：

1. 外層 case-level parallel。
2. 每個 case 內 generation task parallel。

這會導致若直接用 `--jobs 96`，最壞情況可能變成「很多 case 各自開很多 ABC process」，實際總 process 數遠超預期。

目前新增：

```text
--case-jobs
--task-jobs
```

意義：

```text
case-jobs = 同時跑幾個 case
task-jobs = 每個 case 內同時跑幾個 child sequence / backend task
```

例如：

```text
--case-jobs 12
--task-jobs 8
```

約等於同時最多：

```text
12 cases x 8 tasks/case = 96 backend tasks
```

如果進入 tail stage，只剩少數 case 時，`case-jobs` 幫助不大，可以改成：

```text
--case-jobs 8
--task-jobs 16
```

讓少數 case 內部有更高併發。

### `run_backend_portfolio.py` new_seeds 路徑支援

V3A runner 原本的 `--backend-bundle-glob` 只會在：

```text
student/seeds/<domain>/
```

下面找 bundle。現在已修正成：

- 若 `--backend-bundle-glob` 是單純名稱，例如 `ex200_ex219_backend_candidates_*`，維持舊行為。
- 若是顯式路徑，例如：

```text
/home/b10507053/ALS_Final_Project/student/new_seeds/bf16/ex200_ex219_backend_candidates_*
```

或：

```text
student/new_seeds/bf16/ex200_ex219_backend_candidates_*
```

則直接照該 glob 找 bundle。

這是 `run_backend_full_flow.py` 能直接吃 `student/new_seeds` 的必要修正。

## new_seeds 目前輸入狀態

`student/new_seeds` 目前已整理好五個 domain：

```text
student/new_seeds/bf16/ex200_ex219_current
student/new_seeds/bf16/ex200_ex219_backend_candidates_20260614_1324

student/new_seeds/fp16/ex220_ex239_current
student/new_seeds/fp16/ex220_ex239_backend_candidates_20260614_1324

student/new_seeds/float_fp8/ex240_ex254_current
student/new_seeds/float_fp8/ex240_ex254_backend_candidates_20260614_1324

student/new_seeds/integer/ex255_ex279_current
student/new_seeds/integer/ex255_ex279_backend_candidates_20260614_1324

student/new_seeds/unknown/ex280_ex299_current
student/new_seeds/unknown/ex280_ex299_backend_candidates_20260614_1324
```

已確認每個 domain 都存在：

```text
current/results/best.csv
backend_candidates/results/candidates.csv
```

因此 full-flow runner 可以直接作為正式全 case 後端入口。

## V3B2 最新實測結果：float_fp8

最新完整 V3B2 run：

```text
student/runs/float_fp8/float_fp8_v3_ga_adaptive_ex240-ex254_20260614_0729_v3b2_full_20260614_1102/
```

輸入 V3A run：

```text
student/runs/float_fp8/float_fp8_v3_ga_adaptive_ex240-ex254_20260614_0729/
```

V3B2 結果：

```text
cases: 15
V3A input total ADP: 141692
V3B2 total ADP:      136541
improvement:         -5151
reference total:     215304
beats reference:     8 / 15 cases
```

逐 case V3B2 對 V3B1：

```text
V3B2 wins vs V3B1: 8 cases
V3B1 wins vs V3B2: 2 cases
ties:              5 cases
```

V3B2 輸給 V3B1 的 cases：

```text
ex244: V3B1 5425, V3B2 5486
ex253: V3B1 2096, V3B2 2142
```

因此最後不應該整包只拿 V3B2，應該做 per-case merge。

若合併：

```text
V3B1 + V3B2 per-case merge total: 136434
V3B1 + V3B2 + feedback short + input merge total: 135823
```

merged all 的來源分布：

```text
v3b2:     6 cases
v3b1:     2 cases
feedback: 5 cases
input:    2 cases
```

這也是 `run_backend_full_flow.py` 目前最後一定做 per-case merge 的原因。

### V3B2 有效來源

V3B2 目前主要有效來源不是 cone substitution，而是 direct/refine path。

在 float_fp8 full run 中：

```text
best_hybrid_type:
direct_post_refine: 1 case
post_refine:        8 cases
none/input:         6 cases
```

主要有效 command：

```text
post_sopb_dc2
post_sweep_dc2
post_abc9_resyn3rs_dc2
```

統計觀察：

```text
internal_cone_substitution:       high equivalent rate, 0 direct input-best improvement
batch_internal_cone_substitution: high equivalent rate, 0 direct input-best improvement
cliff_repair:                     low equivalent rate, 0 direct input-best improvement
direct_post_refine/post_refine:    main score source
```

結論：

- V3B2 比 V3B1 整體更好。
- 但 V3B1 / feedback short 仍會在少數 case 贏。
- final result 必須 per-case merge。
- 下一輪要再強化 V3B，優先強化 post-refine command set，而不是單純加大 cone substitution 數量。

## 目前 full flow 輸出路徑

以正在跑的 run：

```text
root_run_id = newseeds_backend_full_20260614_1420
```

目前/後續會產生：

### BF16 V3A

```text
student/work/newseeds_backend_full_20260614_1420_bf16_v3a/
student/runs/bf16/newseeds_backend_full_20260614_1420_bf16_v3a/results/
```

目前 BF16 V3A top-level results 尚未 merge 完成；case-level checkpoints 已存在：

```text
student/work/newseeds_backend_full_20260614_1420_bf16_v3a/exNNN/checkpoints/
```

已可在每個 case checkpoint 看到：

```text
history.csv
best.csv
summary.csv
pareto.csv
near_pareto.csv
operator_steps.csv
command_stats.csv
lineage.csv
timeout_failures.csv
```

### 後續 BF16 stages

等 BF16 V3A 完成後，總控腳本會自動跑：

```text
student/runs/bf16/newseeds_backend_full_20260614_1420_bf16_v3b1/results/
student/runs/bf16/newseeds_backend_full_20260614_1420_bf16_v3b2/results/
student/runs/bf16/newseeds_backend_full_20260614_1420_bf16_feedback_short/results/
student/runs/bf16/newseeds_backend_full_20260614_1420_bf16_final_merge/results/
```

### 全域 aggregate

所有 domain 完成後：

```text
student/runs/all_backend/newseeds_backend_full_20260614_1420/results/aggregate_final_backend_summary.csv
```

## `run_backend_full_flow.py` final merge 欄位

`aggregate_final_backend_summary.csv` 與每個 domain 的 `final_backend_summary.csv` 欄位：

- `domain`：domain 名稱。
- `case`：case id。
- `best_source`：最佳 row 來源，可能是 `v3a`、`v3b1`、`v3b2`、`feedback`。
- `best_run_id`：該最佳 row 來自哪個 run id。
- `best_candidate_id`：最佳 candidate id。
- `best_aig_path`：最佳 AIG path。
- `best_area`：最佳 area。
- `best_delay`：最佳 delay。
- `best_adp`：最佳 ADP。
- `reference_adp`：reference ADP。
- `delta_vs_reference`：`best_adp - reference_adp`。
- `ratio_to_reference`：`best_adp / reference_adp`。
- `beats_reference`：`1` 表示贏 reference。
- `pre_backend_adp`：後端前 seed ADP。
- `v3a_adp`：V3A best ADP。
- `v3b1_adp`：V3B1 best ADP。
- `v3b2_adp`：V3B2 best ADP。
- `feedback_adp`：feedback short V3A best ADP。
- `notes`：best source 的 command sequence 或 hybrid type。

## 目前建議操作

1. 讓目前 `backend_2-1` 繼續跑到 BF16 V3A stage 完成。
2. 若要調高併發，等 BF16 V3A 完整 merge 後 `Ctrl-C`，再用同一個 prefix resume：

```bash
python3 student/scripts/run_backend_full_flow.py \
  --domains all \
  --jobs 128 \
  --v3a-case-jobs 8 \
  --v3a-task-jobs 16 \
  --run-id-prefix newseeds_backend_full_20260614_1420 \
  --keep-going
```

3. 不建議直接開 `16 x 16 = 256`，因為 eSLIM / rewire / transduction 可能同時拉起太多 ABC processes，造成 timeout 或 I/O 抖動。
4. 後續看進度可用：

```bash
tmux capture-pane -t backend_2-1 -p -S -80

find student/runs -path '*newseeds_backend_full_20260614_1420*results*summary.csv' -o \
  -path '*newseeds_backend_full_20260614_1420*results*postpareto_summary.csv'

tail -n 80 student/work/newseeds_backend_full_20260614_1420/logs/*.log
```

5. 若某一個 case crash，`--keep-going` 會讓後續 domain/case 盡量繼續；final aggregate 會另外記錄 failure。

---

更新時間：2026-06-14 06:25 +0800

## 2026-06-14 V3 修正版更新摘要

本輪已把「Senior-Inspired Adaptive GA + Focused Post-Pareto」接進目前 V3 架構，重點是吸收學長 command family 和 post-pareto 方法，但 timeout、node gate、parameter sweep 採我們自己的 adaptive 規則。

### V3A strengthened GA 已更新

- `student/backends/v3_ga_commands.py`
  - command library 現在有 203 個 operator。
  - 覆蓋主要 family：
    - `abc9_core`
    - `abc1_core`
    - `high_priority_senior`
    - `stochastic_or_exact`
    - `mapping_remap`
    - `mockturtle`
    - `cross_tool`
    - `deepsyn_primitives`
  - 已補上 adaptive metadata：
    - `timeout_class`
    - `node_bucket`
    - `source_note`
    - `enabled_by_default`
  - 加入本地 deterministic parameter sweep operator，例如：
    - `adapt_ifraig_conflict`
    - `adapt_dfraig_conflict`
    - `adapt_cfraig_choice`
    - `adapt_choice_only`
    - `adapt_resub_large_low`
    - `adapt_resub_f_aggressive`
    - `adapt_orchestrate_wide`
    - `adapt_orchestrate_highk`
    - `adapt_collapse_sop_fx_aggr`
    - `adapt_eslim_fast`
    - `adapt_eslim_deep_1k`
    - `adapt_rewire_medium`
    - `adapt_rewire_aggr`

- `student/scripts/run_backend_portfolio.py`
  - V3A scheduler 改成：
    - 50% exploit：用 recent case profile 分數高的 operator。
    - 30% explore：用 recent window 內沒跑過或 stale 的 operator。
    - 20% perturb：用 gated / stochastic 高風險 operator。
  - stagnation 連續 2 generation 後，sequence 長度從 `max_sequence_len` 放寬到最多 6。
  - deterministic RNG 改成：
    - `global_seed + case_id * 1009 + generation * 917`
  - run 建立時會輸出：
    - `results/command_library_manifest.csv`
  - manifest 欄位包含：
    - `operator_id`
    - `id`
    - `tool`
    - `template`
    - `family`
    - `priority`
    - `timeout_sec`
    - `timeout_class`
    - `node_min`
    - `node_max`
    - `node_bucket`
    - `case_filter`
    - `risk_level`
    - `can_start_sequence`
    - `can_follow_timeout`
    - `params_json`
    - `source_note`
    - `enabled_by_default`
    - `notes`

### V3B focused post-pareto 已更新

- `student/scripts/run_backend_postpareto.py`
  - V3B 預設不再重押 PO crossover。
  - `--max-po-hybrids-per-case` default 從 128 降成 32。
  - `--max-post-refine-sources-per-case` default 從 8 增成 16。
  - `--max-post-refine-per-case` default 從 24 增成 48。
  - 新增 `--max-seed-pool-per-case`，default 24。
  - PO crossover 即使開啟，也會在程式內再限制成 focused budget。
  - internal cone substitution 改成 sharing-aware scoring：
    - `local_area_gain`
    - `level_gain_weight`
    - `donor_duplication_penalty`
    - `shared_logic_loss_penalty`
    - `estimated_global_gain`
  - 只有 `estimated_global_gain > 0` 的 substitution 才 materialize。
  - post-refine command 增加：
    - `compress2rs; strash; &get; &dc2; &put; strash`
    - `strash; &get; &reduce; &dc2; &put; strash`
    - `strash; &get; &sweep; &dc2; &put; strash`
    - `strash; &get; &sopb; &dc2; &put; strash`

### V3B 新增輸出

- `postpareto_decision.csv`
  - 欄位：
    - `case`
    - `region_id`
    - `decision_type`
    - `parent_ids`
    - `score`
    - `selected`
    - `reason`
  - 用途：記錄 cone substitution / PO crossover 等 decision 為什麼選或不選。

- `v3b_seed_pool.csv`
  - 欄位：
    - `case`
    - `candidate_id`
    - `source_stage`
    - `aig_path`
    - `area`
    - `delay`
    - `adp`
    - `equivalent`
    - `reason`
  - 用途：V3B 產生的 best / near-best / post-refine success，可直接餵回 V3A：

```bash
python3 student/scripts/run_backend_portfolio.py \
  --portfolio-version v3-ga \
  --domain bf16 \
  --cases ex200-ex219 \
  --run-id <v3a_short_refine_run_id> \
  --extra-seed-csv student/runs/bf16/<v3b_run_id>/results/v3b_seed_pool.csv \
  --max-generations 2 \
  --offspring-per-generation 64 \
  --max-sequence-len 4 \
  --skip-culs
```

- `hybrid_attempts.csv` 新增欄位：
  - `estimated_global_gain`
  - `sharing_loss_penalty`
  - `selected_for_refine`

### 本輪驗證

- Static check：

```bash
python3 -m py_compile \
  student/backends/v3_ga_commands.py \
  student/scripts/run_backend_portfolio.py \
  student/scripts/run_backend_postpareto.py
```

- Command audit：
  - operator count：203。
  - required family missing：none。
  - gated / stochastic operator missing timeout/node metadata：0。

- V3B focused smoke：
  - run id：`ex217_backend_v3b_focused_smoke_20260614_0618`
  - input：`ex200_ex219_backend_v3_ga_commandfix_20260613_1404`
  - result：
    - `postpareto_summary.csv` 1 row。
    - `hybrid_attempts.csv` 14 rows。
    - `postpareto_decision.csv` 3091 rows。
    - `v3b_seed_pool.csv` 5 rows。
    - `ex217` 從 V3A input ADP 5280 改到 V3B post best ADP 5148。

- V3B -> V3A feedback seed smoke：
  - run id：`ex217_v3a_feedback_seed_smoke_20260614_0618`
  - command：把上面 V3B smoke 的 `v3b_seed_pool.csv` 餵回 V3A `--seed-only`。
  - result：
    - V3A 成功載入 `extra01..extra04`。
    - best 來自 `extra01`。
    - ADP 5148。

更新時間：2026-06-13 22:50 +0800

## 2026-06-13 晚上最新摘要

目前後端已分成兩條線：

1. **V3A CPU-only GA backend search**
   - 入口仍是 `student/scripts/run_backend_portfolio.py --portfolio-version v3-ga`。
   - 目的：用 ABC / ABC9 / MockTurtle / optional E-Syn / optional `&ttopt` 做 evolutionary backend search。
   - 已完成並實測 BF16 `ex200-ex219`。
   - 目前最重要的 BF16 V3A input run 是：
     - `student/runs/bf16/ex200_ex219_backend_v3_ga_commandfix_20260613_1404/`
   - 這個 run 是後續 V3B post-pareto 的 input。

2. **V3B Post-Pareto optimizer**
   - 新入口：`student/scripts/run_backend_postpareto.py`。
   - 目的：不要干擾 V3A 主流程，而是在 V3A 完成後讀取它的 `pareto.csv / near_pareto.csv / best.csv / history.csv / summary.csv`，再做：
     - Cross-AIG structural indexing。
     - PO-level crossover。
     - Exact internal cone substitution。
     - Post-pareto gap / cliff repair。
   - 不使用 CULS，不使用 GPU。
   - final claim 仍然以現有 official ABC CEC + ADP evaluate 為準。

## V3A 目前狀態

### 主要程式

- `student/scripts/run_backend_portfolio.py`
  - 已支援 `--portfolio-version v3-ga`。
- `student/backends/v3_ga_commands.py`
  - V3A command/operator library。
  - 管理 ABC、ABC9、MockTurtle、truth-table special flow 的 operator metadata。
- `student/backends/abc_step_flow.py`
  - Step-wise ABC execution。
  - 每個 operator 可以有獨立 timeout。
  - 包含 `&ttopt` truth seed flow。
- `student/backends/mockturtle_flow.py`
  - MockTurtle wrapper。
- `student/tools/mockturtle/mockturtle_aig_runner.cpp`
  - MockTurtle binary runner。
  - 已支援 `crw / wrw / rf / resub / resub2 / sim_resub / flow` 等 flow 名稱。

### V3A 核心行為

- CPU-only。
- CULS disabled。
- E-Syn 預設 disabled，可用 `--enable-esyn` 作 optional seed generator。
- seed 來源只使用 curated seed bundle：
  - `student/seeds/<domain>/*_current`
  - `student/seeds/<domain>/*backend_candidates*`
- 使用 GA-style search：
  - parent selection：global best + Pareto + near-Pareto + family diversity。
  - mutation：從 operator library 抽 1-4 個 operator。
  - crossover：拼接成功過的 command sequences。
  - restart：從 archive/stale Pareto point 重新接 low-frequency command。
- scheduler 使用 case-local profile：
  - exploit recent successful operators。
  - explore never-tried/stale operators。
  - random 保留多樣性。
- full `&deepsyn` 不放在一般 mutation 裡，避免拖慢主搜尋；可用 final-only trial。

### V3A 已完成的重要 run

#### `ex200_ex219_backend_v3_ga_20260613_0956`

- 這是早上第一輪 BF16 V3A run。
- 驗證 V3A 比舊的 fixed `ABC -> MockTurtle -> ABC -> CULS` portfolio 更有效。
- 這輪用於建立 V3B smoke 的 input。

#### `ex200_ex219_backend_v3_ga_commandfix_20260613_1404`

- 這是目前建議作為 V3B input 的 BF16 V3A run。
- 目的：
  - 使用修正後 command library。
  - command list 更貼近學長 `ref/ref_command.txt`。
  - 保留 V3A GA 的 output CSVs 給 V3B post-pareto 使用。
- 重要輸出：
  - `student/runs/bf16/ex200_ex219_backend_v3_ga_commandfix_20260613_1404/results/history.csv`
  - `student/runs/bf16/ex200_ex219_backend_v3_ga_commandfix_20260613_1404/results/pareto.csv`
  - `student/runs/bf16/ex200_ex219_backend_v3_ga_commandfix_20260613_1404/results/near_pareto.csv`
  - `student/runs/bf16/ex200_ex219_backend_v3_ga_commandfix_20260613_1404/results/best.csv`
  - `student/runs/bf16/ex200_ex219_backend_v3_ga_commandfix_20260613_1404/results/summary.csv`
  - `student/runs/bf16/ex200_ex219_backend_v3_ga_commandfix_20260613_1404/results/operator_steps.csv`
  - `student/runs/bf16/ex200_ex219_backend_v3_ga_commandfix_20260613_1404/results/command_stats.csv`
  - `student/runs/bf16/ex200_ex219_backend_v3_ga_commandfix_20260613_1404/results/case_profile.csv`

## V3B 目前狀態

### 新增程式

- `student/scripts/run_backend_postpareto.py`

V3B 是獨立 post-processor，不應該拿正在跑的 V3A run 做 resume；應該等 V3A run 完成後，指定 input run id 再跑。

基本執行方式：

```bash
python3 student/scripts/run_backend_postpareto.py \
  --domain bf16 \
  --input-run-id ex200_ex219_backend_v3_ga_commandfix_20260613_1404 \
  --run-id <new_v3b_run_id> \
  --cases ex200-ex219 \
  --jobs 8 \
  --resume \
  --enable-po-crossover \
  --enable-cone-substitution \
  --enable-cliff-repair
```

### V3B 已實作功能

#### BLIF graph extraction

每個 parent AIG 會先透過 ABC 轉成 BLIF：

```abc
read <aig>; strash; write_blif <tmp.blif>
```

Python 端會解析：

- `.inputs`
- `.outputs`
- `.names`

並建立 DAG metadata：

- fanins
- truth cubes
- level
- fanout
- support set
- reachable POs
- local cone size

#### Cross-AIG structural indexing

- BF16 / PI <= 16 時預設做 exact truth-table signature。
- signature 欄位包含：
  - `signature_kind`
  - `signature_hash`
  - `support_size`
  - `level`
  - `local_area`
  - `candidate_id`
  - `node_id`
- 輸出：
  - `structural_index.csv`
  - `cone_matches.csv`

注意：目前 exact signature 會很吃記憶體與 CPU，尤其 parent points 太多時會很慢。因此 V3B bounded run 會降低 parent count。

#### PO-level crossover

同一 case 的 equivalent AIG 在 function 上等價，因此理論上 PO cone 可以跨 AIG 混合。V3B 目前嘗試：

- single-PO replace
- high-bit / low-bit output split
- alternating PO replace
- area-best + delay-best mixed replace

每個 hybrid 都會：

1. 產生 mixed BLIF。
2. 轉回 AIG。
3. 跑 cleanup command。
4. 跑 official CEC。
5. CEC passed 才量測 ADP。

曾遇過的 bug：

- 一開始 PO crossover 產生 non-equivalent，是因為 BLIF internal node prefix 用 candidate id 前綴，長名字太像導致不同 parent internal node 撞名。
- 已修正成 `safe prefix + hash8`，smoke 後 `ex200` 5/5 PO crossover equivalent。

#### Internal exact cone substitution

只替換 exact signature 相同的 internal cones。

選 donor 條件：

- donor local area 較小，或
- donor level 較低。

嘗試條件：

- local area 差距 >= 10%，或
- level 差距 >= 1。

所有結果仍須 official CEC passed 才能進入 best/archive。

Smoke result：

- `ex212_backend_v3b_cone_smoke_20260613_1430`
- 8/8 internal cone substitutions official CEC equivalent。

#### Gap / Cliff repair

Frontier 依 delay 排序。

Gap 定義：

- 相鄰 Pareto points 的 delay gap >= 3。

Cliff 定義：

- area drop per delay 大於 median slope 2 倍，或
- area drop >= max(500, 15% parent_area)。

目前 repair 方法：

1. 從 gap/cliff endpoint 抽 single-PO cone。
2. 對 single-PO cone 跑短 ABC/ABC9 cleanup。
3. reinsert 回完整 multi-output BLIF。
4. 轉 AIG。
5. official CEC + ADP。

目前 repair commands：

- `balance`
- `abc9_dch_dc2`
- `abc9_resyn3rs`
- `map_if_g`
- `sopb_dc2`
- `hp_transduction_t0`
- `eslim_cleanup_dc2`

Smoke result：

- `ex216_backend_v3b_cliff_smoke_20260613_1430`
- 4 attempts，1 equivalent。
- non-equivalent rows 正常記錄，不中斷 case。

## V3B full run 問題與修正

### 超重 full run

Run id：

```text
student/runs/bf16/ex200_ex219_backend_v3b_postpareto_20260613_1706/
```

當時執行方式大致是：

```bash
python3 student/scripts/run_backend_postpareto.py \
  --domain bf16 \
  --input-run-id ex200_ex219_backend_v3_ga_commandfix_20260613_1404 \
  --run-id ex200_ex219_backend_v3b_postpareto_20260613_1706 \
  --cases ex200-ex219 \
  --jobs 16 \
  --enable-po-crossover \
  --enable-cone-substitution \
  --enable-cliff-repair
```

舊版 default limits：

```text
max_parent_points = 128
max_po_hybrids_per_case = 512
max_cone_substitutions_per_case = 256
max_po_repairs_per_case = 128
abc_timeout = 120
repair_timeout = 120
jobs = 16
```

觀察到的問題：

- 跑了 4 小時以上還沒有總 CSV。
- 原因不是 crash，而是舊版設計成全部 case 完成後才 merge/write final results。
- process 還在跑，曾觀察到：
  - PID `585475`
  - RSS 約 34GB 到 38.5GB。
  - 17 threads。
  - active ABC child 正在跑 `eslim_cleanup_dc2`。
- work 目錄產物有持續增加，表示不是完全卡死。
- 但風險很高：
  - 太多 parent points。
  - exact signature 太重。
  - cliff repair command 多。
  - 16 jobs 造成高記憶體壓力。
  - 中途看不到完整結果。

結論：

- 這一輪不建議繼續等。
- 建議停掉或保留 work 目錄作診斷，不拿它當正式結果。

### 已修正的 V3B runner 行為

`student/scripts/run_backend_postpareto.py` 已改成：

- 每個 case 完成後立即寫 fragment：
  - `results/fragments/<case>/frontier_analysis.csv`
  - `results/fragments/<case>/structural_index.csv`
  - `results/fragments/<case>/cone_matches.csv`
  - `results/fragments/<case>/hybrid_attempts.csv`
  - `results/fragments/<case>/postpareto_history.csv`
  - `results/fragments/<case>/postpareto_best.csv`
  - `results/fragments/<case>/postpareto_summary.csv`
- 每個 case stage 會更新：
  - `results/progress/<case>.csv`
  - `results/progress/<case>.json`
- top-level CSV 會隨著 completed case 增量 merge：
  - `results/postpareto_progress.csv`
  - `results/postpareto_summary.csv`
  - `results/postpareto_best.csv`
  - 其他 merged CSVs。
- 新增 `--resume`：
  - 同一 run-id 重跑時，已完成 case 會跳過。
- default limits 改成 bounded：

```text
max_parent_points = 48
max_po_hybrids_per_case = 128
max_cone_substitutions_per_case = 64
max_po_repairs_per_case = 32
abc_timeout = 90
repair_timeout = 60
```

目前建議手動再更保守一點跑 BF16：

```bash
python3 student/scripts/run_backend_postpareto.py \
  --domain bf16 \
  --input-run-id ex200_ex219_backend_v3_ga_commandfix_20260613_1404 \
  --run-id ex200_ex219_backend_v3b_bounded_$(date +%Y%m%d_%H%M) \
  --cases ex200-ex219 \
  --jobs 8 \
  --resume \
  --enable-po-crossover \
  --enable-cone-substitution \
  --enable-cliff-repair \
  --max-parent-points 32 \
  --max-po-hybrids-per-case 96 \
  --max-cone-substitutions-per-case 48 \
  --max-po-repairs-per-case 24 \
  --abc-timeout 90 \
  --repair-timeout 60
```

## V3B bounded run 目前 snapshot

Run id：

```text
student/runs/bf16/ex200_ex219_backend_v3b_bounded_20260613_2237/
```

這是使用新版 fragment/progress runner 的 BF16 bounded run。

截至 2026-06-13 22:50 左右：

- `postpareto_progress.csv` 已存在。
- `postpareto_summary.csv` 已存在。
- `postpareto_summary.csv` 目前已有 8 個 completed cases。
- `postpareto_progress.csv` 有 20 個 case 的狀態。
- merged output 行數 snapshot：

```text
cone_matches.csv          8490 lines
frontier_analysis.csv       37 lines
hybrid_attempts.csv        826 lines
postpareto_best.csv          9 lines
postpareto_history.csv     826 lines
postpareto_progress.csv     21 lines
postpareto_summary.csv       9 lines
structural_index.csv     88792 lines
```

目前 completed cases：

| case | best ADP | reference ADP | beats reference | hybrid attempts | equivalent hybrids |
| --- | ---: | ---: | ---: | ---: | ---: |
| ex209 | 7007 | 7320 | yes | 67 | 67 |
| ex211 | 2223 | 2136 | no | 168 | 148 |
| ex212 | 2340 | 2304 | no | 67 | 67 |
| ex213 | 3030 | 2900 | no | 72 | 52 |
| ex214 | 2538 | 2424 | no | 168 | 148 |
| ex215 | 3310 | 3150 | no | 67 | 67 |
| ex216 | 3177 | 3357 | yes | 48 | 48 |
| ex218 | 3740 | 3222 | no | 168 | 148 |

目前 running cases：

| case | stage | parents | blif done | notes |
| --- | --- | ---: | ---: | --- |
| ex200 | extracting_blif | 32 | 16 | still building parent BLIF / signatures |
| ex201 | built_structural_index | 32 | 32 | ready / running hybrid stages |
| ex202 | extracting_blif | 32 | 16 | still building parent BLIF / signatures |
| ex203 | extracting_blif | 32 | 16 | still building parent BLIF / signatures |
| ex204 | built_structural_index | 32 | 32 | ready / running hybrid stages |
| ex205 | extracting_blif | 32 | 16 | still building parent BLIF / signatures |
| ex206 | selected_parents | 32 | 0 | slow before or during BLIF extraction |
| ex207 | selected_parents | 32 | 0 | slow before or during BLIF extraction |
| ex208 | extracting_blif | 32 | 24 | still building parent BLIF / signatures |
| ex210 | extracting_blif | 32 | 24 | still building parent BLIF / signatures |
| ex217 | cone_substitution_done | 32 | 32 | still has later stage / merge pending |
| ex219 | po_crossover_done | 32 | 32 | still has later stage / merge pending |

Interpretation：

- 新版 bounded run 的 progress 機制正常。
- 已能在 run 還沒完成時看到 partial `postpareto_summary.csv`。
- 目前 completed cases 的 V3B post-pareto 尚未看到比 V3A input 更低的 ADP；`delta_vs_v3_input` 都是 `0`。
- 但 V3B 仍有價值：
  - 產生大量 equivalent hybrid attempts。
  - 建 structural index / cone matches。
  - 之後可用這些資料分析哪些 cone / PO mixing 有潛力。
- 若跑完後仍沒有改善，下一步要調整 V3B 的 parent selection 和 repair policy，而不是單純加大 budget。

## V3B 新增輸出檔案說明

### `postpareto_progress.csv`

用來即時查看 case 進度。這是新版 V3B 最重要的 monitoring 檔。

- `case`：case id。
- `status`：`running`、`completed`、`failed`。
- `stage`：目前或最後 stage，例如：
  - `start`
  - `selected_parents`
  - `extracting_blif`
  - `extracted_blif`
  - `built_structural_index`
  - `po_crossover_done`
  - `cone_substitution_done`
  - `cliff_repair_done`
  - `done`
  - `exception`
- `updated_at`：最後更新時間。
- `selected_parents`：此 case 選到的 parent points 數。
- `blif_done`：已轉 BLIF 並 parse 完的 parent 數。
- `frontier_regions`：偵測到的 gap/cliff frontier regions 數。
- `structural_nodes`：structural index rows 數。
- `cone_match_groups`：跨 AIG signature match groups 數。
- `hybrid_attempts`：目前/最終 hybrid attempts 數。
- `equivalent_hybrids`：目前/最終通過 official CEC 的 hybrids 數。
- `best_adp`：目前/最終 best ADP。
- `notes`：failure notes 或 exception summary。

### `results/fragments/<case>/...`

每個 case 完成後立即寫出。用途是避免單一 case 慢或 crash 導致整個 run 沒有結果。

包含：

- `frontier_analysis.csv`
- `structural_index.csv`
- `cone_matches.csv`
- `hybrid_attempts.csv`
- `postpareto_history.csv`
- `postpareto_best.csv`
- `postpareto_summary.csv`

top-level `results/*.csv` 會從 fragments merge 出來。

### `frontier_analysis.csv`

每個 gap/cliff region 一列。

- `case`：case id。
- `region_id`：region id。
- `region_type`：`gap` 或 `cliff`。
- `left_candidate_id` / `right_candidate_id`：frontier 上相鄰的兩個 endpoints。
- `left_area` / `left_delay`：left endpoint QoR。
- `right_area` / `right_delay`：right endpoint QoR。
- `delay_gap`：兩點 delay 差距。
- `area_drop`：兩點 area 差距。
- `slope`：area drop per delay。
- `priority`：目前用於排序 region 的 heuristic priority。

### `structural_index.csv`

每個 candidate internal node 一列。

- `case`：case id。
- `candidate_id`：來源 candidate。
- `node_id`：BLIF node id。
- `po_owner`：此 node 影響哪些 PO。
- `signature_kind`：`exact16` 或 `structural`。
- `signature_hash`：signature hash。
- `support_size`：support PI 數。
- `level`：node level。
- `local_area`：此 node cone 的 local node count。
- `fanout`：fanout count。
- `reachable_pos`：reachable POs。

### `cone_matches.csv`

跨 candidate 找到相同 signature 的 group。

- `case`：case id。
- `signature_hash`：signature hash。
- `signature_kind`：signature type。
- `candidate_count`：此 signature 出現於幾個 candidates。
- `node_count`：此 signature 總 node occurrences。
- `best_area_node`：local area 最小 node。
- `best_delay_node`：level 最低 node。
- `selected_donor_node`：目前選定 donor node。

### `hybrid_attempts.csv`

每個 V3B hybrid attempt 一列。

- `case`：case id。
- `candidate_id`：V3B generated candidate id。
- `hybrid_type`：
  - `po_single`
  - `po_high_low`
  - `po_alternating`
  - `po_area_delay_mix`
  - `internal_cone_substitution`
  - `cliff_repair`
- `parent_ids`：主要 parent ids。
- `donor_ids`：cone substitution donor ids。
- `substitution_plan`：JSON plan，記錄 PO source map 或 cone replacement detail。
- `aig_path`：生成 AIG path。
- `area` / `delay` / `adp`：official equivalent 後量測值。
- `equivalent`：official CEC passed。
- `region_id`：對應 gap/cliff region。
- `notes`：CEC failure、timeout 或 command note。

### `postpareto_history.csv`

沿用 V3A `history.csv` 欄位，但填入 V3B post-pareto metadata。

重要 V3B 欄位：

- `source = v3b_postpareto`
- `tool = postpareto`
- `phase = postpareto`
- `tier = v3b`
- `hybrid_source`
- `cone_substitution_source`
- `pareto_gap_tag`
- `post_pareto_stage`
- `frontier_region`

### `postpareto_best.csv`

每個 case post-pareto 後的 best equivalent row。欄位與 V3A history 相同。

注意：

- 若 V3B 沒有產生更好 hybrid，best 會仍是 V3A input best。

### `postpareto_summary.csv`

每個 completed case 一列。

- `case`：case id。
- `pre_backend_adp`：後端前最佳 seed ADP。
- `v3_input_best_adp`：V3A input run best ADP。
- `v3b_post_best_adp`：V3B post-pareto 後 best ADP。
- `reference_adp`：學長 baseline/reference ADP。
- `delta_vs_v3_input`：`v3b_post_best_adp - v3_input_best_adp`。
- `adp_ratio_to_v3_input`：`v3b_post_best_adp / v3_input_best_adp`。
- `delta_vs_reference`：`v3b_post_best_adp - reference_adp`。
- `adp_ratio_to_reference`：`v3b_post_best_adp / reference_adp`。
- `beats_reference`：是否贏過 reference。
- `input_best_candidate_id`：V3A input best candidate。
- `post_best_candidate_id`：V3B post best candidate。
- `post_best_aig_path`：V3B post best AIG path。
- `frontier_regions`：gap/cliff regions 數。
- `structural_nodes`：structural index nodes 數。
- `cone_match_groups`：signature match groups 數。
- `hybrid_attempts`：hybrid attempts 數。
- `equivalent_hybrids`：equivalent hybrids 數。
- `best_hybrid_type`：若 V3B hybrid 成為 best，記錄 hybrid type；否則空白。

## 下一步建議

短期：

1. 等 `ex200_ex219_backend_v3b_bounded_20260613_2237` 跑完。
2. 先看：

```bash
cat student/runs/bf16/ex200_ex219_backend_v3b_bounded_20260613_2237/results/postpareto_progress.csv
cat student/runs/bf16/ex200_ex219_backend_v3b_bounded_20260613_2237/results/postpareto_summary.csv
```

3. 如果 `delta_vs_v3_input` 仍全部是 0，先不要盲目加大 V3B budget。

中期：

- 根據 `hybrid_attempts.csv` 分析：
  - 哪些 hybrid_type 最常 equivalent。
  - 哪些 case 的 PO crossover 會降低 area 但拉高 delay。
  - 哪些 internal cone substitution 產生更低 local area 但 cleanup 後沒有保留。
- 根據 `cone_matches.csv` 找：
  - candidate_count 高的 signature。
  - local_area 差距大的 donor/recipient。
  - level 差距大的 donor/recipient。
- 調整 V3B：
  - parent selection 不只取 ADP/Pareto，也要取 area-best/delay-best + structurally diverse parents。
  - internal substitution 優先挑真正差距大的 cone。
  - cliff repair command 可以更偏 delay 或 area，不要所有 PO 都平均跑。

如果時間很緊：

- 對 BF16 可以先只針對差 reference 很小的 cases 跑 V3B。
- 對已經輸很多的 cases，V3B 不一定能救，應優先回前端或 V3A command search。

---

## 目前狀態

V3A 已經整合進 `student/scripts/run_backend_portfolio.py`，使用方式是指定：

```bash
--portfolio-version v3-ga
```

新增的後端輔助檔案：

- `student/backends/v3_ga_commands.py`：V3A 的 command/operator library，負責管理 ABC、ABC9、MockTurtle、特殊 truth-table flow 的 operator 定義、參數展開、節點數限制、風險等級與 timeout。
- `student/backends/abc_step_flow.py`：step-wise ABC execution helper，負責讓一條 sequence 裡的每個 operator 都能獨立 timeout、獨立記錄結果，也包含 `&ttopt` truth seed flow。

V3A 預設行為：

- CPU-only，不使用 GPU。
- CULS disabled。
- E-Syn 預設 disabled，但仍可透過 `--enable-esyn` 作為 optional seed generator。
- 初始輸入只使用 curated seeds：`student/seeds/<domain>/*_current` 加上最多四個 `backend_candidates`。
- 對 ABC / ABC9 / MockTurtle operators 做 GA-style mutation、crossover、restart。
- 保留 global best、Pareto archive、near-Pareto archive、lineage、command stats、operator step logs。
- 完整 `&deepsyn` 不放進一般 GA mutation，仍只透過 `--final-deepsyn-trial` 作為最後 trial。

本輪補強：

- MockTurtle binary 與 Python wrapper 已支援學長 command list 裡的 `crw`、`wrw`、`rf`、`resub2` 名稱。
- `resub2` 不再只是普通 `resub` 的 alias；目前會用較強的 resubstitution 設定並跑兩次 resubstitution。
- V3 command library 補上 `&dch; &dc2`、expanded `compress2rs` put/get、`balance -d`、`balance -x`、plain `dfraig`、`dch; &if -g`、以及 eSLIM cleanup + `&dc2` 的 2k/1k gated variants。
- 原本 standalone `&fx; &st` 會因為缺 mapping 失敗，已改成 `&if -a -K [3,6]; &fx; &st`。
- `compress2rs` 在 ABC 裡是 `abc.rc` alias，V3 不再直接依賴這個 alias，而是展開成完整 ABC command sequence。
- 目前 default operator library 數量為 190 個 operators。

## 學長指令與概念覆蓋狀態

V3A command library 已把學長截圖和 `ref/ref_command.txt` 中提到的主要 command 概念都納入。ABC macro 不依賴 `abc.rc`，而是展開成明確 command sequence，避免不同環境的 `abc.rc` 造成結果不一致。

目前最完整的參考來源是 `ref/ref_command.txt`。該檔案裡有從截圖貼上的行號前綴，所以做自動比對時要先 strip leading numeric column。

已覆蓋的 ABC / ABC1 macro 與 primitive：

- `resyn`, `resyn2`, `resyn2a`, `resyn3`
- `compress`, `compress2`, `resyn2rs`, `r2rs`, `compress2rs`, `c2rs`
- `rewrite`, `rewrite -z`, `refactor`, `refactor -z`, `refactor -N`
- `balance`, `balance -d -x`
- `resub -K/-N`, `resub -z`, `resub -F`, `resub -l`
- `dch`, `dch -f`, `dc2`
- `rwsat`, `drwsat`, `drwsat2`
- `share`, `share2`
- `src_rw`, `src_rs`, `src_rws`
- `dchoice`
- `iresyn`, `irw`
- `logic; mfs2`, `logic; mfs`
- `collapse; sop; fx; strash`
- `read_genlib scripts/and_inv.genlib; dch; amap/map; strash`
- `ifraig`, `dfraig`
- `orchestrate`

已覆蓋的 ABC9 / GIA commands：

- `&b`, `&dc2`, `&syn2`, `&syn3`, `&syn4`
- `&resyn3`, `&resyn3rs`, `&compress3rs`
- `&fraig`, `&cfraig`, `&choice`
- `&sweep`, `&reduce`
- `&dc3` expanded flow：`&b; &jf -K 6; &b; &jf -K 4; &b`
- `&dc4` expanded flow：`&b; &jf -K 7; &fx; &b; &jf -K 5; &fx; &b`
- `&transduction -T 0/1/2/3`，包含 `-S` 和 repeat variants
- `&sopb`, `&sopb -C`, `&dsdb -C`
- `&randsyn`, `&satsyn`, `&synch2`, `&rewire`
- `&eslim` bounded variants
- deepsyn primitives：`&dch`, `&if -a -K`, `&mfs`, `&fx`, `&st`

已覆蓋的 MockTurtle flows：

- single flows：`crw` / `cut_rewrite`, `wrw` / `window_rewrite`, `rf` / `refactor`, `resub`, `resub2`, `sim_resub`
- combo flows：`crw,resub`, `crw,resub2`, `crw,sim_resub`, `resub,crw`, `resub2,crw`, `sim_resub,crw`, `rf,resub`, `rf,resub2`, `crw,rf,resub2`, `crw,resub,sim_resub`, `wrw,resub,crw`, `flow`
- combo flow 會在同一個 V3 operator 裡依序呼叫多次 MockTurtle binary。

特殊 truth-table command：

```abc
read_truth -xf
&get
&ttopt -I <pi> -O <po>
&put
strash
```

- `&ttopt` 已做成 generic truth-table seed generator，不只限 `ex286` / `ex287`。
- 預設優先 cases 是 `ex286,ex287`。
- 可用 `--ttopt-all-cases` 或 `--ttopt-cases` 擴大到其他 cases。

目前有 gate 或排除的項目：

- `&transduction -T 3` 在大 AIG 上很慢，因此限制在小圖使用。
- `ref/ref_command.txt` 裡有 `&eslim -d`，但目前本機 ABC build 的 `&eslim -h` 不支援 `-d`；V3A 改放支援的 non-`-d` cleanup variants。
- Standalone `&fx; &st` 不可直接跑，因為 `&fx` 需要 mapping；V3A 改用 `&if -a -K [3,6]; &fx; &st`。
- `ref/ref_command.txt` 中完整 bounded `&deepsyn -I/-T` variants 已納入 gated、low-priority mutation operators；另外長時間 final trial 仍保留在 `--final-deepsyn-trial`。

## Timeout 與 Node Gate 設定

以下是從 `ref/ref_command.txt` 整理出的 node limit 與 timeout 概念，V3A 會在本機工具支援時盡量 mirror。

Node limits：

- `@nodes<=5000`：`refactor -N`、repeated `&transduction -T 0`、`collapse; sop; fx`、eSLIM cleanup short variants。
- `@nodes<=2000`：high-K `resub`、high-K `orchestrate`、`&synch2`、`&rewire -I [50,200] -T 10`、eSLIM cleanup medium variants。
- `@nodes<=1000`：eSLIM cleanup long variants with `-T [120,300]`。
- `@nodes<=500`：`resub -F 1`、`orchestrate -F 1`、`&transduction -T [0,1]`、aggressive `&rewire -I [100,500] -T 15`。
- `@nodes<=200`：`resub -F [1,2]`、`&transduction -T [0,3]` and repeated/shared variants。
- `@nodes<=10000`：AND/INV remap、MockTurtle `wrw`、MockTurtle `flow`、cross-tool `MT:flow` templates。

Command 內部 timeout 或 bounded parameters：

- `&satsyn -T [5,15]`
- `&rewire -T 10` for `@nodes<=2000`
- `&rewire -T 15` for `@nodes<=500`
- `&eslim -T [30,120]` for `@nodes<=5000`
- `&eslim -T [60,180]` for `@nodes<=2000`
- `&eslim -T [120,300]` for `@nodes<=1000`
- `&deepsyn -I 1 -T [8,15]`
- `&deepsyn -I [1,2] -T [10,20]`
- `&deepsyn -I 1 -T 15` in post-combo variants

V3A 外層 operator timeout：

- cheap ABC / ABC9 primitives：60 到 90 秒。
- medium / combined ABC / ABC9 operators：90 到 120 秒。
- slow / gated eSLIM / deepsyn operators：依內部 `-T` 設定，約 120 到 300 秒。
- MockTurtle single flows：120 秒。
- MockTurtle two-pass / three-pass combos：180 到 240 秒。
- MockTurtle `flow`：360 秒。
- cross-tool mixed operators：180 到 360 秒。
- final-only long deepsyn trial：V3A default 600 秒。

## 已做過的驗證

Static checks：

```bash
python3 -m py_compile student/scripts/run_backend_portfolio.py student/backends/v3_ga_commands.py student/backends/abc_step_flow.py
git diff --check
```

ABC help / smoke：

- `help`
- `&ttopt -h`
- `&transduction -h`
- `&eslim -h`
- `orchestrate -h`
- `ifraig -h`

代表性 command smoke：

- `share` expanded flow：passed
- `drwsat2` expanded flow：passed
- `&choice -C`：passed
- `&sopb -C`：passed
- `&dc3` expanded flow：passed
- `logic; mfs2`：passed
- AND/INV genlib remap：passed
- MockTurtle combo runner path：passed
- `&transduction -T 3`：在 `ex200` 規模上 timeout，符合預期，因此已 gate 到小 AIG。

之前 runner smoke：

- `unknown ex286` ttopt-only smoke：passed。
- `unknown ex286` GA one generation：passed，resume 後不會重跑完成過的 generation。
- `unknown ex286-ex287` small batch：passed，merged results 已排序。
- `bf16 ex200` small GA smoke：passed。

## Run 資料夾結構

對於 run id `<run_id>` 和 domain `<domain>`：

- work root：`student/work/<run_id>/`
- per-case work：`student/work/<run_id>/<case>/`
- final run root：`student/runs/<domain>/<run_id>/`
- final CSVs：`student/runs/<domain>/<run_id>/results/`

重要 work subdirectories：

- `<case>/seeds/`：複製並量測後的 seed AIG。
- `<case>/artifacts/`：穩定保存的 equivalent generated AIG。
- `<case>/v3_generation_<NNN>/`：每個 GA generation 的 offspring step outputs。
- `<case>/ttopt_seed/`：truth-table `&ttopt` 輸出。
- `<case>/logs/`：工具 log。
- `<case>/checkpoints/`：可 resume 的 per-case CSV / JSON state。

Checkpoint JSON files：

- `seen_hashes.json`：已經看過的 AIG hashes。
- `completed_tasks.json`：已完成的 parent/operator tasks，用於 resume 跳過重跑。
- `active_pool.json`：目前 active population 的 candidate ids。
- `archive_pool.json`：archive candidate ids。
- `pareto_archive.json`：目前 Pareto candidate ids。
- `near_pareto_archive.json`：near-Pareto candidate ids。
- `global_best.json`：目前最佳 candidate row。
- `case_profile.json`：序列化後的 profile rows。
- `run_state.json`：checkpoint metadata，包含 `global_round`。

## Result CSV 檔案

### `history.csv`

所有 seed rows 和所有 generated candidate attempts。`pareto.csv`、`best.csv`、`near_pareto.csv` 使用相同欄位。

- `case`：benchmark case id。
- `candidate_id`：唯一 candidate 名稱。
- `family_id`：直接 seed family，例如 `current`、`alt01`、`ttopt`。
- `root_family_id`：最原始的 root family；後續 mutation 不會改掉這個來源。
- `lineage`：文字化的 ancestry chain。
- `parent_id`：直接 parent candidate id。
- `parent_hash`：直接 parent AIG hash。
- `source`：來源類型，例如 `seed`、`v3_ga`、`abc`、`abc9`、`mockturtle`、`special_ttopt`、`esyn`。
- `tool`：此 row 使用的工具。
- `tool_chain`：標準化後的 tool chain id。
- `command`：短 command / operator name。
- `command_expanded`：實際執行的 expanded command 或 sequence。
- `params_json`：command 的結構化參數。
- `aig_path`：產生或複製出的 AIG 路徑。
- `aig_hash`：AIG 檔案的 SHA256 hash。
- `verilog_path`：seed row 對應的來源 Verilog 路徑。
- `seed_origin`：seed 來自哪個 CSV 或 bundle。
- `area`：ABC 量測出的 AND count。
- `delay`：ABC 量測出的 logic level。
- `adp`：`area * delay`。
- `parent_area`：parent area。
- `parent_delay`：parent delay。
- `parent_adp`：parent ADP。
- `delta_area`：child area minus parent area。
- `delta_delay`：child delay minus parent delay。
- `delta_adp`：child ADP minus parent ADP。
- `equivalent`：`1` 表示 official CEC against truth passed。
- `round`：global round / generation counter。
- `phase`：搜尋階段，例如 `seed`、`ttopt_seed`、`v3_ga`、`final_deepsyn`。
- `tier`：legacy tier 或 `ga`。
- `runtime_sec`：此 candidate attempt 的 runtime。
- `is_pareto`：`1` 表示保留在 Pareto frontier。
- `is_near_pareto`：`1` 表示作為 near-Pareto diversity 保留。
- `is_active`：`1` 表示被選進 active search pool。
- `is_new_pareto`：`1` 表示這個 row 在該 generation / round 產生新的 Pareto point。
- `duplicate_of`：如果 AIG hash 重複，這裡會記錄相同 hash 的 candidate id。
- `scheduler_score`：被 scheduler 選到時的 adaptive score。
- `selected_reason`：這個 command 被選到的原因。
- `preflight_status`：預留給未來 preflight checks。
- `esyn_output`：E-Syn 適用時的 output name。
- `esyn_rewrite_rank`：E-Syn 適用時的 rewrite rank。
- `generation`：V3 GA generation number。
- `sequence_id`：V3 GA offspring sequence id。
- `command_sequence`：逗號分隔的 V3 operator ids。
- `hybrid_source`：預留給未來 Cross-AIG hybridization。
- `cone_substitution_source`：預留給未來 equivalent cone substitution。
- `pareto_gap_tag`：預留給未來 post-Pareto gap / cliff repair。
- `post_pareto_stage`：預留給未來 post-Pareto optimization stage。
- `frontier_region`：預留的 frontier region label。
- `notes`：failure reason、註解或工具 notes。

### `pareto.csv`

最後或目前的 Pareto rows，以及保留下來的 archive rows。欄位與 `history.csv` 相同。

### `near_pareto.csv`

Near-Pareto diversity rows。欄位與 `history.csv` 相同。

### `best.csv`

每個 case 合併後的一筆最佳 equivalent row。欄位與 `history.csv` 相同。

### `summary.csv`

每個 case 一列，用來快速比較後端前後、V2、V3、reference。

- `case`：benchmark case id。
- `pre_backend_current_adp`：frontend current best seed 的 ADP。
- `pre_backend_best_candidate_adp`：後端優化前，curated seeds 裡的最低 ADP。
- `v2_best_adp`：如果有提供 `--v2-summary-csv`，這裡會記錄 V2 best ADP。
- `v3_best_adp`：V3 best ADP。
- `pre_backend_best_candidate_id`：最佳 seed candidate id。
- `pre_backend_best_aig_path`：最佳 seed AIG path。
- `pre_backend_area`：最佳 seed area。
- `pre_backend_delay`：最佳 seed delay。
- `pre_backend_adp`：最佳 seed ADP。
- `best_candidate_id`：最終最佳 candidate id。
- `best_aig_path`：最終最佳 AIG path。
- `best_area`：最終最佳 area。
- `best_delay`：最終最佳 delay。
- `best_adp`：最終最佳 ADP。
- `delta_adp_vs_pre_backend`：`best_adp - pre_backend_adp`。
- `adp_ratio_to_pre_backend`：`best_adp / pre_backend_adp`。
- `improves_pre_backend`：`1` 表示後端結果比後端前 seed 更好。
- `improvement_pct_vs_pre_backend`：相對後端前 seed 的 ADP 降幅百分比。
- `final_deepsyn_status`：`disabled`、`not_run`、`skipped`、`equivalent`、`improved`、`timeout` 或 `failed`。
- `final_deepsyn_candidate_id`：final deepsyn candidate id。
- `final_deepsyn_area`：final deepsyn area。
- `final_deepsyn_delay`：final deepsyn delay。
- `final_deepsyn_adp`：final deepsyn ADP。
- `final_deepsyn_improved`：`1` 表示 final deepsyn 有改善 parent。
- `final_deepsyn_notes`：final deepsyn notes 或 failure reason。
- `reference_area`：reference / baseline area。
- `reference_delay`：reference / baseline delay。
- `reference_adp`：reference / baseline ADP。
- `delta_vs_current`：`best_adp - pre_backend_current_adp`。
- `delta_vs_v2`：若有 V2 summary，表示 `best_adp - v2_best_adp`。
- `adp_ratio_to_reference`：`best_adp / reference_adp`。
- `ratio_to_reference`：為了相容舊欄位，內容同 `adp_ratio_to_reference`。
- `beats_reference`：`1` 表示 best ADP 贏過 reference ADP。
- `best_command_sequence`：產生 best row 的 V3 operator id sequence。
- `ttopt_used`：`1` 表示 best lineage / sequence 使用過 `ttopt`。
- `mockturtle_used`：`1` 表示 best lineage / sequence 使用過 MockTurtle。
- `esyn_used`：`1` 表示 best lineage / sequence 使用過 E-Syn。
- `pareto_points`：Pareto rows 數量。
- `near_pareto_points`：near-Pareto rows 數量。
- `history_rows`：此 case 總共嘗試過的 rows 數量。

### `operator_steps.csv`

V3 每一個 operator step 一列。這張表用來追蹤「某個 child 是由哪些 step 依序產生」。

- `case`：benchmark case id。
- `sequence_id`：V3 sequence id。
- `candidate_id`：該 sequence 最後產生的 child candidate id。
- `generation`：GA generation。
- `parent_id`：直接 parent candidate id。
- `step_index`：此 operator 在 sequence 裡的 index。
- `operator_id`：command library 裡的 operator id。
- `family`：operator family。
- `tool`：operator tool。
- `expanded_command`：實際 command 或 MockTurtle flow list。
- `input_aig`：此 step 的 input AIG。
- `output_aig`：此 step 產生的 output AIG。
- `status`：`ok`、`timeout` 或 `failed`。
- `timeout_sec`：此 operator 被分配到的 timeout。
- `runtime_sec`：此 operator step 的 runtime。
- `notes`：step-level failure 或 notes。

### `case_profile.csv`

Adaptive scheduler 的 per-case / family / tool / command profile。

- `case`：benchmark case id。
- `family_id`：受影響的 seed family。
- `tool`：工具名稱。
- `tool_chain`：標準化後的 chain id。
- `command`：command 名稱。
- `params_json`：command 參數。
- `attempts`：總嘗試次數。
- `equivalent_count`：通過 CEC 的嘗試次數。
- `new_pareto_count`：產生新 Pareto point 的次數。
- `timeout_count`：timeout 次數。
- `failure_count`：failed 或 non-equivalent 次數。
- `best_delta_adp`：此 command 看過的最佳 ADP delta。
- `best_delta_area`：此 command 看過的最佳 area delta。
- `best_delta_delay`：此 command 看過的最佳 delay delta。
- `recent_attempts`：recent window 內的嘗試次數。
- `recent_new_pareto_count`：recent window 內的新 Pareto 次數。
- `recent_success_rate`：recent new-Pareto rate。

### `command_stats.csv`

V3 operator-level 統計，用來回答「哪些 operator 真的有效」。

- `case`：benchmark case id。
- `operator_id`：V3 operator id。
- `family`：operator family。
- `attempts`：operator step 嘗試次數。
- `equivalent_count`：包含此 operator 且最終通過 CEC 的 candidate rows 數。
- `timeout_count`：operator step timeout 次數。
- `failed_count`：不含 timeout 的 operator step failure 次數。
- `new_pareto_count`：包含此 operator 且成為新 Pareto 的 final candidate rows 數。
- `best_delta_adp`：包含此 operator 的 rows 中最佳 ADP delta。
- `recent_success_score`：decayed recent scheduler score。

### `lineage.csv`

Generated candidates 的精簡 ancestry table。

- `case`：benchmark case id。
- `candidate_id`：candidate id。
- `parent_id`：直接 parent id。
- `parent_hash`：直接 parent AIG hash。
- `generation`：GA generation。
- `sequence_id`：sequence id。
- `command_sequence`：逗號分隔的 V3 operator ids。
- `source`：candidate source。
- `aig_hash`：candidate AIG hash。
- `area`：candidate area。
- `delay`：candidate delay。
- `adp`：candidate ADP。
- `hybrid_source`：預留的 future hybrid source。
- `cone_substitution_source`：預留的 future cone substitution source。
- `pareto_gap_tag`：預留的 future cliff / gap tag。
- `post_pareto_stage`：預留的 future post-Pareto stage。
- `frontier_region`：預留的 future frontier region。

### `timeout_failures.csv`

記錄不應該中斷整個 run 的 step / candidate failures。

- `case`：benchmark case id。
- `sequence_id`：sequence id。
- `candidate_id`：若已知，記錄 candidate id。
- `generation`：GA generation。
- `parent_id`：parent id。
- `operator_id`：失敗的 operator id 或 operator id sequence。
- `status`：failure status，例如 `timeout`、`failed`、`worker_failed`。
- `timeout_sec`：使用的 timeout。
- `runtime_sec`：failure 前的 runtime。
- `notes`：failure detail。

### `scheduler_decisions.csv`

Legacy / V1 / V2 scheduler table。V3 目前保留這份檔案主要是為了相容舊分析流程。

- `case`：benchmark case id。
- `round`：round number。
- `phase`：phase name。
- `cycle`：search cycle。
- `parent_id`：被選到的 parent id。
- `parent_hash`：被選到的 parent hash。
- `tool`：被選到的 tool。
- `tool_chain`：被選到的 tool chain。
- `command`：被選到的 command。
- `params_json`：被選到的 command parameters。
- `scheduler_score`：scheduler score。
- `selected_reason`：selection reason。

### `phase_summary.csv`

Legacy / V1 / V2 phase summary table。V3 目前保留這份檔案主要是為了相容舊分析流程。

- `case`：benchmark case id。
- `cycle`：search cycle。
- `phase`：phase name。
- `round_start`：此 phase 第一個 round。
- `round_end`：此 phase 最後一個 round。
- `attempts`：此 phase 的 attempts 數。
- `equivalent_count`：此 phase 的 equivalent candidates 數。
- `new_pareto_count`：此 phase 的 new Pareto points 數。
- `best_adp_before`：phase 前的 best ADP。
- `best_adp_after`：phase 後的 best ADP。
- `runtime_sec`：phase runtime。

### `case_failures.csv`

只有整個 case crash 時才會出現。

- `case`：benchmark case id。
- `error`：top-level exception summary。
- `traceback`：完整 traceback。
