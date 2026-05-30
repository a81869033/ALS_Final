# 利用 AI 與邏輯綜合工具優化 AIG

面向 IWLS 2026 benchmark 的方法介紹

---

## 1. 什麼是 AIG

AIG 是 And-Inverter Graph。

它只使用兩類基本結構：

- AND 節點
- 邊上的取反標記

一個組合邏輯電路可以被表示成 AIG。優化 AIG 的目標通常有兩個：

- 降低邏輯層數，也就是 delay
- 減少 AND 節點數，也就是 area

這兩個目標經常互相衝突，所以我們通常保留一組 Pareto 解，而不是只保留一個電路。

---

## 2. 這次任務的優化目標

我們面對的是 100 個 combinational truth-table benchmark，編號為 `ex200` 到 `ex299`。

每個 benchmark 給出完整 truth table。我們的目標是：

1. 生成和 truth table 等價的 AIG。
2. 盡可能降低 level。
3. 盡可能減少 AND 節點數。
4. 在 level 和 area 之間保留多個 tradeoff。

最終比較指標：

| 指標 | 含義 | 越小越好 |
| --- | --- | --- |
| Level | AIG 的最長邏輯路徑層數 | Yes |
| Area | AIG 中 AND 節點數量 | Yes |

---

## 3. 總體思路

我們的優化不是單一工具完成的，而是一個組合流程。

核心思想：

1. 用 AI 輔助理解 truth table 背後的函數結構。
2. 把可識別的函數寫成更高層次的 Verilog。
3. 用 Yosys 把 Verilog 綜合成初始 AIG。
4. 用 ABC、ABC9、MockTurtle、CULS 繼續優化 AIG。
5. 保留所有 non-dominated Pareto 點。
6. 對每個候選結果做等價性驗證。

可以理解成兩層優化：

- 前端：盡量生成“結構更好”的電路描述。
- 後端：對已有 AIG 做局部重寫和全局搜索。

---

## 4. 為什麼需要 AI

如果直接從 truth table 生成 AIG，電路通常非常大。

AI 在這裡主要用於 reverse engineering：

- 觀察 truth table 的輸入輸出規律。
- 猜測 benchmark 對應的數學函數。
- 生成可讀的 Verilog 實現。
- 提出不同的分解方式。
- 針對失敗 case 繼續嘗試新結構。

AI 不直接替代驗證。所有 AI 生成的 RTL 和 AIG 都必須經過 exhaustive simulation 或 CEC 檢查。

---

## 5. AI 能發現什麼

對這些 benchmark，AI 輔助發現了幾類結構：

| Case 範圍 | 識別出的結構 |
| --- | --- |
| `ex200-ex219` | BF16 unary functions |
| `ex220-ex239` | FP16 unary functions |
| `ex240-ex254` | float conversion 和 fp8 add |
| `ex255-ex279` | 整數乘法、除法、平方、平方根 |
| `ex280-ex299` | 未命名函數，但有 class、rotation、split 等結構 |

一旦從“隨機 truth table”變成“有語義的函數”，優化空間會大很多。

---

## 6. 方法一：從 truth table 直接生成 AIG

這是最基礎的 baseline 方法。

做法：

1. 讀取 truth table。
2. 直接構造等價邏輯。
3. 得到初始 AIG。
4. 再用綜合工具優化。

優點：

- 一定可以得到等價電路。
- 自動化程度高。

缺點：

- 難以利用函數本身的結構。
- 面積經常很大。
- 對 16-bit 輸入、16-bit 輸出的複雜函數尤其不友好。

---

## 7. 方法二：AI reverse engineering + Verilog

更有效的方法是先理解函數，再寫結構化 Verilog。

例子：

- 如果發現是 `sqrt(x)`，就不要用完整 truth table。
- 可以寫成 exponent 處理 + mantissa lookup table。
- 如果發現是整數乘法，就直接寫乘法結構。
- 如果發現輸出有對稱性，就只實現一半邏輯。

這種方法的本質是：

> 用更高層級的語義，替代低層級的 truth table 展開。

---

## 8. 浮點函數優化

很多 benchmark 是浮點函數，包括：

- `exp`
- `log`
- `sin`
- `tan`
- `sqrt`
- reciprocal
- cube root
- sigmoid

我們使用的浮點假設：

- DAZ：denormal input 視為 zero
- FTZ：denormal output flush to zero
- RNE：round to nearest even
- canonical NaN

關鍵優化手段：

- 分離 sign、exponent、mantissa。
- 對 mantissa 使用小規模 lookup table。
- 對 exponent 使用整數加減、移位、比較。
- 對奇函數使用 odd symmetry。
- 對飽和區間直接輸出 constant。
- 對 passthrough 區間避免複雜計算。

---

## 9. BF16 的特點

BF16 的 mantissa 只有 7 bit。

這意味著很多函數只需要 128-entry lookup table 就可以精確表示 mantissa 變換。

典型結構：

1. 拆出 sign、exponent、mantissa。
2. 對 exponent 做區間判斷。
3. 對 mantissa 查表。
4. 做 rounding。
5. 重新組裝 BF16 輸出。

這種結構比直接 truth table 小很多。

---

## 10. FP16 的特點

FP16 的 mantissa 是 10 bit。

直接查表需要 1024 entries，比 BF16 大，但仍然比完整 truth table 好很多。

有效方法：

- 按 sign 和 exponent 分組。
- 很多 exponent 區間是 constant、zero、inf 或 passthrough。
- 只有少數區間需要 mantissa table。
- 對每個區間單獨生成更簡單的 case 結構。

這類結構再交給 Yosys 和 ABC 後端，通常可以得到穩定的改進。

---

## 11. 整數算術函數優化

部分 benchmark 對應整數算術：

- unsigned multiplication
- signed multiplication
- unsigned division
- square
- integer square root

這類函數適合直接寫成算法 RTL。

例如：

- 乘法用乘法表達式。
- 除法加入 divide-by-zero saturation。
- 平方用共享輸入乘法。
- 整數平方根用 restoring sqrt。

綜合器可以識別這些結構，並生成遠小於 truth table 的 AIG。

---

## 12. 未知函數的處理

`ex280-ex299` 這組函數沒有完全命名。

對這類 case，我們使用結構搜索：

- 按輸入高位或低位分組。
- 嘗試 class-based factoring。
- 嘗試 rotation canonical form。
- 從 truth table 自動生成 split RTL。
- 用 decision graph 學習可分解結構。

這類方法不一定能解釋函數語義，但能找到更適合綜合的表示。

---

## 13. Yosys 的角色

Yosys 是 RTL 到門級/AIG 的前端綜合工具。

在我們的流程中，Yosys 負責：

1. 讀取 Verilog。
2. 做過程塊展開、表達式優化、常量傳播。
3. 對 case、比較器、算術結構做綜合。
4. 生成初始 AIG。

Yosys 很重要，因為 AI 生成的是 Verilog，而最終提交需要的是 AIG。

一個好的 Verilog 結構，經過 Yosys 後往往能得到比 truth table baseline 小很多的初始 AIG。

---

## 14. ABC 的角色

ABC 是主要的 AIG 優化後端。

常用操作包括：

- rewriting
- refactoring
- balancing
- resubstitution
- strashing
- mapping-aware optimization
- deep synthesis

ABC 的作用：

- 降低 level。
- 減少 AND 節點。
- 在已有 AIG 上做大量局部等價變換。
- 通過隨機命令序列探索不同優化路線。

---

## 15. ABC9 的角色

ABC9 是 ABC 中更現代的優化和 mapping 相關流程。

它對某些 case 的低 level 優化特別有幫助。

我們把 ABC9 當作 portfolio 的一部分：

- 有些 case ABC 普通流程更好。
- 有些 case ABC9 更好。
- 兩者都跑，然後保留 Pareto 最優點。

這也是整個項目的基本策略：不要依賴單一工具，而是讓多個工具競爭。

---

## 16. MockTurtle 的角色

MockTurtle 提供了另一套邏輯網絡優化算法。

常用 pass：

- cut rewriting
- window rewriting
- refactoring
- resubstitution
- simulation-guided resubstitution

MockTurtle 的價值在於：

- 搜索空間和 ABC 不完全相同。
- 某些 AIG 在 ABC 中停滯後，MockTurtle 還能找到新結構。
- 和 ABC 交替使用時，經常能產生新的 Pareto 點。

---

## 17. CULS 的角色

CULS 是 GPU 加速邏輯綜合工具。

常用操作：

- rewriting
- refactoring
- resubstitution
- balancing
- strashing

CULS 的主要價值：

- 利用 GPU 加速大規模局部搜索。
- 對大 AIG 可以快速嘗試更多變換。
- 作為 ABC 和 MockTurtle 之外的第三種後端。

在 portfolio 中，CULS 不一定每個 case 都贏，但它能擴展搜索空間。

---

## 18. Portfolio 優化思想

我們最終採用 portfolio，而不是單一路線。

每個 case 同時嘗試：

- truth-table baseline
- AI-generated word-level RTL
- Yosys synthesis
- ABC optimization
- ABC9 optimization
- MockTurtle optimization
- CULS optimization
- decision-graph decomposition

每條路線都可能產生不同 tradeoff。

最後統一做：

1. 等價性驗證。
2. level/area 統計。
3. Pareto pruning。
4. 保留 non-dominated points。

---

## 19. Pareto front 是什麼

如果一個 AIG 的 level 和 area 都不比另一個 AIG 好，那麼它就是 dominated，可以刪除。

例如：

| AIG | Level | Area |
| --- | ---: | ---: |
| A | 10 | 1000 |
| B | 12 | 900 |
| C | 12 | 1100 |

這裡 C 被 A 和 B 支配：

- A 的 level 更低，area 也更低。
- B 的 level 相同，area 更低。

所以 C 沒有保留價值。

---

## 20. 等價性驗證

優化電路時，最重要的是不能改變功能。

我們使用兩類驗證：

1. RTL exhaustive simulation
對 AI 生成的 Verilog，逐個輸入枚舉，檢查輸出是否等於 truth table。
2. AIG CEC
對最終 AIG，和 truth table 構造出的參考電路做 combinational equivalence checking。

只有驗證通過的結果才會進入最終統計。

---

## 21. 一個典型優化流程

以一個浮點函數 case 為例：

1. 先從 truth table 生成 baseline AIG。
2. 用 AI 分析輸入輸出模式，猜測它是某個 BF16/FP16 函數。
3. 寫出結構化 Verilog。
4. exhaustive simulation 驗證 Verilog。
5. 用 Yosys 綜合成 AIG。
6. 用 ABC、ABC9、MockTurtle、CULS 做後端優化。
7. 對所有 AIG 做 CEC。
8. 保留 Pareto front。

這個過程可以反覆迭代：後端卡住時，回到前端重新設計 Verilog 結構。

---

## 22. 關鍵經驗

一些對結果影響很大的細節：

- truth table indexing 和 Verilog 輸入順序必須嚴格對應。
- RNE rounding 的 carry 必須傳播到 exponent。
- 浮點 NaN、inf、zero、subnormal 的 corner case 必須單獨處理。
- BF16 適合小 mantissa LUT。
- FP16 適合按 exponent 分組後局部查表。
- 奇函數可以使用 sign symmetry。
- 未知函數不一定要完全命名，能找到可綜合分解也有價值。
- 後端工具之間要交替使用，單一工具很容易到局部最優。

---

## 23. 當前總體結果

當前 100 個 benchmark 全部已有優化結果。

相對 baseline：

| Group | Cases | Avg area improvement | Avg level improvement | Area wins | Level wins |
| --- | ---: | ---: | ---: | ---: | ---: |
| `ex200-ex219` | 20 | 14.79x | 2.79x | 20/20 | 20/20 |
| `ex220-ex239` | 20 | 12.13x | 2.94x | 20/20 | 20/20 |
| `ex240-ex254` | 15 | 84.38x | 2.74x | 15/15 | 15/15 |
| `ex255-ex279` | 25 | 50.37x | 2.64x | 25/25 | 25/25 |
| `ex280-ex299` | 20 | 35.44x | 2.57x | 20/20 | 20/20 |
| **All** | **100** | **37.72x** | **2.73x** | **100/100** | **100/100** |

---

## 24. 分組結果解讀

結果最明顯的幾類：

- Float conversion：平均面積改進 84.38x。
- Basic arithmetic：平均面積改進 50.37x。
- Unknown-function group：平均面積改進 35.44x。

這說明：

- 只要能從 truth table 中恢復結構，面積可以大幅下降。
- 算術和轉換類函數尤其適合 word-level reconstruction。
- 對未知函數，decision graph 和 split/canonical 方法也能帶來明顯收益。

---

## 25. 代表性 case

| Case | Baseline L/A | Best level L/A | Best area L/A | Area gain |
| --- | ---: | ---: | ---: | ---: |
| `ex209` | 31/3310 | 11/732 | 43/385 | 8.60x |
| `ex216` | 26/2835 | 9/373 | 23/295 | 9.61x |
| `ex230` | 52/44104 | 16/6770 | 22/6367 | 6.93x |
| `ex232` | 30/4902 | 12/1221 | 39/457 | 10.73x |
| `ex252` | 49/76443 | 14/703 | 29/120 | 637.02x |
| `ex253` | 35/13901 | 14/133 | 22/108 | 128.71x |
| `ex259` | 69/120875 | 18/17157 | 34/391 | 309.14x |
| `ex264` | 65/88987 | 17/15667 | 34/398 | 223.59x |
| `ex274` | 111/168031 | 18/37100 | 68/807 | 208.22x |
| `ex289` | 33/46977 | 12/3740 | 20/821 | 57.22x |
| `ex297` | 53/113640 | 16/30583 | 83/6039 | 18.82x |
| `ex299` | 71/472167 | 19/122582 | 187/19652 | 24.03x |

---

## 26. 總結

這次 AIG 優化的核心經驗是：

> AIG 後端優化很重要，但更大的提升往往來自前端結構發現。

AI 的作用是幫助我們從 truth table 中恢復語義和結構；Yosys 把這些結構轉成可優化的 AIG；ABC、ABC9、MockTurtle 和 CULS 負責在 AIG 層面繼續壓縮。

最終形成的有效路線：

1. AI 輔助 reverse engineering。
2. 結構化 Verilog 生成。
3. Yosys 前端綜合。
4. ABC / ABC9 / MockTurtle / CULS portfolio 優化。
5. CEC 驗證。
6. Pareto front 保留。

在當前結果中，100 個 case 的 best-area 和 best-level 都優於 baseline，平均面積改進 37.72x，平均 level 改進 2.73x。
