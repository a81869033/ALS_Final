# ex280-ex299 Unknown Frontend Notes

這個資料夾用來追蹤 unknown group 的 frontend reverse engineering 嘗試，避免後續重複走已經驗證過但效果不好的方向。

目前共用資料來源：
- `student/results/unknown_candidates_current.csv`
- `student/results/unknown_candidates_current_best.csv`
- `student/results/unknown_candidates_current_summary.csv`
- `student/results/target_ex280_bdd_eval*.csv`
- `student/results/target_ex280_structure*.csv`
- `student/work/reverse_unknown_20260603_1812/`
- `student/work/reverse_unknown_algebraic_20260603_2305_algebraic_safe/`
- `student/work/target_ex280_bdd_eval/`
- `student/work/target_ex280_structure/`

已系統性嘗試過的 frontend 方向：
- Full value case: 直接 truth table case mapping。
- Default plus exceptions: 找 default output，再列 exception。
- High/low split default: 依輸入高位或低位切 group，group 內用 default plus exceptions。
- Rotation canonical split: 先 rotate input，再做 high/low split default。
- Greedy decision tree: 用 decision graph/decision tree 形式分解 truth table。
- Shared BDD: 針對 ex280 做過多種 variable order 的 shared BDD seed。
- Algebraic/ANF/Davio: 對 ex280-ex299 產過 ANF/shared term/Davio/support-LUT 類候選，目前沒有成為整理後 current best。
- ex280 targeted structure: 做過 BDD/Davio 特定 pair order、ECA、GF/power-map 類假設搜尋。ECA/GF 類沒有找到 exact semantic hit。

目前觀察：
- ex290, ex291, ex293, ex296, ex298 的 current frontend ADP 已經比較接近 reference，但仍不是語義化結構。
- ex280-ex289 多數差距很大，後端優化 ex280 只從 `20118` 降到 `17220`，證明主要瓶頸仍是 frontend Verilog 結構。
- ex295-ex299 中 ex297/ex299 特別差，單靠 split/table/tree 類方法不夠。

