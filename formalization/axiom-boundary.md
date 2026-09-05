# 外部数学 axioms：契约、来源和禁止越界

日期：2026-09-06。返回 [蓝图](README.md) · [API 审计](mathlib-api-audit.md)。

本文件遵循用户的工程政策：引用外部论文、专著的结果一般声明为 `axiom`。
目前只登记计划中的契约，**没有新增任何 `.lean` axiom，也没有机器验证声明**。
来源依据 [primary-interface audit](../notes/log-rate-power-proof-primary-interfaces.md)
及 [手稿参考文献](../manuscript/references.bib)。

## 1. 基本政策

允许外部公理的目的是隔离未形式化的文献理论，而不是把本文困难的引理重新
命名成外部事实。每条声明必须具备：稳定 ID、精确来源和版本、数学对象定义、
完整假设、结论、使用模块、与原文的适配说明。

以下区分必须落实在代码和文档中：

- **外部定理**：精确可追溯到指定论文/专著；进入 `GGC.External`。
- **外部定理的本地专化**：由外部定理加变量代换、倾斜、归一化等推出；
  默认写成 theorem，避免在 axiom 中偷偷增添更强结论。
- **本项目新推导**：必须完成 Lean proof，不能列入外部白名单。
- **工程占位**：若开发时使用 `sorry` 或临时前提，明确标为未完成；
  即使目标文件能编译，也不能称形式化完成。

如果为减少外部理论对象的定义成本，最终选择对一条已核实的文献推论直接声明
专化 axiom，必须在登记中写出从原文到该版本的全部数学适配，标为
“source-derived interface”，由人复核它确实是该文献的推论。
不能只引用一个来源名字，就许可任意强的接口。

## 2. Bondesson：GGC 结构与最终闭包

来源：Lennart Bondesson, *Generalized Gamma Convolutions and Related Classes
of Distributions and Densities*, Lecture Notes in Statistics 76, Springer,
1992，[DOI 10.1007/978-1-4612-2948-3](https://doi.org/10.1007/978-1-4612-2948-3)。
本地 [Bondesson.pdf](../literature/Bondesson.pdf)：printed p.29、pp.34–35，
对应已审计 PDF pp.38、43–44。Thorin 表示及可积性在 §3.1；
闭包使用 Theorem 3.1.5，有限原子逼近使用 p.35 末段。

### E-B1：Thorin 表示的实现 / 识别

输入：a≥0、(0,∞) 上的正测度 U，满足经典 Thorin 可积性；明确保证
对所有 s>0，`log(1+s/b)` 可积。输出：存在非负概率分布 μ，使

\[
L_\mu(s)=\exp\{-as-\int\log(1+s/b)U(db)\},\qquad s>0.
\]

若 `IsGGC` 直接定义为存在这种表示，识别方向就是定义展开，不必再设重复
axiom；非空实现仍是真正的外部存在性输入。U 可有无限质量；不得把“有限正
测度”误写入最终 GGC 定义。唯一性可由本地 Laplace 测试稠密证明处理，
无需额外再假设一个专用唯一性 axiom。

### E-B2：非亏损概率极限的弱闭包

输入：μₙ 是 GGC 概率，μₙ⇒μ，且 μ 已是一个非负概率分布。
输出：`IsGGC μ`。不允许在只知道一组 Laplace 函数逐点极限时，跳过它是否
代表概率的问题。Thm 3.1.5 的其他规范测度方向若有额外假设，不随这条契约导入。

### E-B3：全体 GGC 的零漂移有限 Gamma 逼近

输入：任意 GGC 概率 μ。输出：一列实际的零漂移有限 Gamma 卷积分布 μₙ，
其参数为有限个正形状、正 rate，并且 μₙ⇒μ。

这是包含漂移、无限 Thorin 质量及退化极限的最终桥梁。输出不要求形状总和、
rate 数量、log-rate 二阶矩或逼近速度随 n 一致。若 API 允许空卷积，
另证它是 δ0；若要求每项非空，可用正形状 Gamma 的退化逼近处理零极限。

**本地必须证明**：固定 q≥1 的幂映射保持弱收敛；有限 Gamma 情形已证后
应用 E-B2；得到公开主定理而不残留逼近参数限制。

## 3. James：Gamma–Dirichlet 与一次观测 posterior

来源：Lancelot F. James, *Functionals of Dirichlet Processes, the
Cifarelli–Regazzini Identity and Beta-Gamma Processes*, Annals of Statistics
33(2) (2005), 647–660，
[DOI 10.1214/009053604000001237](https://doi.org/10.1214/009053604000001237)。
固定版本 [arXiv:math/0505606v1](https://arxiv.org/pdf/math/0505606v1)，
reprint p.2 的 (1)–(3)、pp.4–5 的 posterior 讨论及 (8)。

### E-J1：DP 的 Markov–Krein 恒等式

输入：有限正基底 U，质量 B∈(0,∞)；P~DP(U)；g≥0 可测并满足
`∫ log(1+g(b)) U(db)<∞`。契约必须明确保证相应随机均值 a.s. 有限，或
使用先以扩展非负积分定义的版本后再导出有限性。输出：

\[
\mathbb E\bigl(1+\!\int g\,dP\bigr)^{-B}
=\exp\{-\!\int\log(1+g)\,dU\}.
\]

采用正 Gamma G_B 与 P 的乘积概率空间来表达独立性，而不是省略独立假设。
结合 Gamma 的 Laplace 积分和变换唯一性，本地推出：若 U 满足有限 Thorin
可积性，则 G_B∫b⁻¹P(db) 是相应零漂移 GGC。

对 g(b)=t/(s+b) 的恒等式还可本地推出倾斜分布
`X_s =d G_B ∫(s+b)⁻¹P(db)`。这一步包括参数化和归一化，不额外假设
原分布有正阶矩；s>0 后均值核有界。

### E-J2：一次抽样的 Palm / posterior 分解

令 F=U/B。对非负可测 Φ，首先登记非负积分版本：

\[
\mathbb E_{DP(U)}\int\Phi(b,P)P(db)
=\int F(db)\,\mathbb E_{DP(U+\delta_b)}\Phi(b,P).
\]

它适用于原子、非原子及混合基底。不能错误导入论文某个分割因子分解段落
中的 nonatomic 限制。随机测度评价及 Φ 的联合可测性必须在类型接口中明确。

**带符号版本本地推出**：先将上述恒等式用于 |Φ| 证明绝对可积，再对正负部
或 Bochner kernel Fubini 使用；不能把不带可积假设的实积分交换声明成 axiom。

### E-J3：posterior 的凸组合实现

对每个 b>0，令 Q~DP(U)、Z~Beta(1,B) 独立，则

\[
(1-Z)Q+Z\delta_b\ \sim\ DP(U+\delta_b).
\]

这是一阶 posterior 的经典实现；可登记为已核实的一次观测公式的接口，或由
DP 的有限分割 Dirichlet–Gamma 代数本地证明。若选择接口 axiom，应注明它是
原文 posterior 加 Gamma 归一化的 source-derived 版本，不能误称原文逐字声明。

本地负责证明 `Z/2 ≤ b M_P(b) ≤ 1`、其对数支配以及联合参数连续性。
原幂切向量中的常数仍是 ψ(B+1)；posterior 的总质量变为 B+1 不会许可
把它换成 ψ(B+2)。

## 4. SSV：有界相位表示

来源：René L. Schilling, Renming Song and Zoran Vondraček,
*Bernstein Functions: Theory and Applications*, **2010 第一版**，
de Gruyter Studies in Mathematics 37，ISBN 978-3-11-021530-4。
Theorem 6.10，printed pp.58–59；Theorem 7.3，p.63。
本地 [SSV.pdf](../literature/SSV.pdf) 对应 PDF pp.71–73、76。
必须同时记录作者的
[2022-12-01 第一版勘误](https://www.motapa.de/bernstein_functions/misprints-ssv.pdf)。

### E-S1：非零 Stieltjes 函数的 reciprocal CBF 表示

Thm 7.3 连接非零 Stieltjes 函数与 reciprocal complete Bernstein function；
Thm 6.10 提供其带 0≤ξ≤1 相位密度的指数表示和 a.e. 唯一性。
可选择声明这两条原理论定理并建立所需函数类，或声明审计后的 resolvent-mean
专化接口，避免形式化整本 CBF 理论。后一种选择必须公开以下适配：

对 (0,∞) 上任意概率 P，

\[
M_P(s)=\int\frac{P(db)}{s+b}>0,
\]

是非零 Stieltjes 函数；对 1/M_P 应用 Thm 7.3 和 6.10，取对数，并相减
s 与 1 的表示，得到一个可测相位 ξ_P∈[0,1]，满足

\[
\log M_P(s)-\log M_P(1)
=\int_0^\infty\xi_P(t)
 \left(\frac1{s+t}-\frac1{1+t}\right)dt,\qquad s>0.
\]

契约应含相位的 a.e. 唯一性；如本地边界恢复证明要使用复域表示，应同时保留
原定理在割平面上的表示，而不只保存上面实轴上的等式。该表示的归一化常数由
M_P(1) 固定。差核绝对可积，可以本地直接估计。

明确不加入：M_P(0+)<∞、P 无原子、相位对 P 逐点连续或相位处处边界极限存在。
本证明锚在 1，不使用需要额外端点条件的零锚公式。

### 本地适配义务，不是 SSV 自动提供的 API

1. 用边界的 limsup 固定代表元，并证明 (P,t) 的联合可测性。
2. 从复表示得到 Poisson 边界恢复，在 Lebesgue 点证明该代表元与 ξ_P a.e.
   相等。一般 Poisson/Lebesgue 微分接口仍需实施时检索和适配；若最终改以
   另一项外部经典定理作 axiom，须新增精确来源，不得无来源扩张 E-S1。
3. 参数尺度变换和锚点 1 的一致处理；相位弱星极限的唯一识别。
4. 对 K 和 Taylor 核的 L¹ 配对收敛，再经 posterior 期望得到生成元连续性。

这些参数化结论不是简单的“对每个 P 存在 ξ”所蕴含的可测选择定理。

### 勘误约束

- printed p.59 的 Herglotz 中间测度应在 [0,∞) 上且总质量有限；
  不采用旧版误印的仅尾部有限条件。
- p.60 Remark 6.11 的某个类等式已改为单向包含；不能使用错误的反向包含。
- 这两项更正不改变当前锚点 1 的有界相位接口。登记引用必须注明第一版
  加上述勘误，而非混用第二版页码。

## 5. Sethuraman：stick-breaking 的 DP 语义

来源：Jayaram Sethuraman, *A Constructive Definition of Dirichlet Priors*,
Statistica Sinica 4(2) (1994), 639–650，
[期刊原始页面](https://www3.stat.sinica.edu.tw/statistica/j4n2/j4n216/j4n216.htm)。
§2，printed pp.642–643 的 (2.1) 构造；Thm 3.4，p.645 的 Dirichlet 性质。

### E-T1：独立权重位置的随机离散测度具有 DP 分布

输入：B>0、F 是概率，V_j 独立且同分布 Beta(1,B)，Y_j 独立且同分布 F，
两列相互独立。令

\[
W_j=V_j\prod_{i<j}(1-V_i),\qquad Q=\sum_jW_j\delta_{Y_j}.
\]

输出：Q 是 DP(BF) 的实现，允许 F 原子或混合。随机测度的定义及 a.s. 质量
为 1 必须明确：可本地由剩余质量期望 `(B/(B+1))^m` 证明，也可随精确构造
定理一起登记；不能将概率性藏在一个没有依据的构造字段内。

**不包含在 E-T1 中**：Bₙ→B、Fₙ⇒F、yₙ→y 时，共同坐标下的样本弱收敛；
尾权重控制；posterior log 的共同可积界；相位极限。它们仍属于本文连续性证明。

## 6. 不可进入外部 axiom 白名单的核心

| 本项目责任 | 手稿定位 | 需要证明的关键内容 |
|---|---|---|
| `power_tangent` | §3 | q 导数与 s 导数的支配和正确参数 |
| `posterior_absolute_drift_bound` | §4，`eq:absolute-posterior-drift` | 先绝对值后 posterior 期望的可积界 |
| `generator_resolvent_action` | §4，直接消去证明；WIP-6.22 | `(h+g)/B` 的符号、系数和绝对 Fubini |
| `generator_joint_continuity` | §5，`lem:continuity` | B、F、y 同时变化及 Hφ 连续 |
| `positive_euler_exists` | §5，`thm:evolution` | 真正概率核、M₂、紧性、一致性、非线性极限 |
| `identify_power_flow` | §6，`thm:identification` | s=0 归一化、生成元范数稠密、动态输运唯一性 |
| `ggc_rpow` | 主定理与 §7 | 原始全量词，不加隐含矩或支撑条件 |

把以上任意一条包装进 `ExternalFacts`、`PowerAdmissible`、`EvolutionExists` 等
结构，然后将结构实例假定存在，仍等价于没有形式化核心，不得作为最终交付。

## 7. 信任审计与状态报告

实施后，每条外部 axiom 旁边应写：登记 ID、完整 bibliographic key、
theorem/page、原文版本、当前声明是直接原定理还是 source-derived interface。
最终审计 `#print axioms GGC.ggc_rpow`：

- 允许 Lean 的基础逻辑公理，如 `propext`、`Classical.choice`、`Quot.sound`
  （以实际输出为准）。
- 允许此文件登记且经核实的外部数学声明。
- 不允许 `sorryAx`，不允许无来源的数学 axiom，不允许本项目核心的同义占位。
- 同时检查依赖声明的定义内容，防止错误总化积分或循环定义使结论变得空洞。

最终可准确报告：“在已登记的 Bondesson、James、SSV、Sethuraman 等外部
文献公理之上，Lean 验证了本文的推导。”不能报告“Lean 已从基础公理证明所有
引用文献”，也不能把本文件的设计本身报告为已经完成的形式化。
