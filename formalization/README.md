# GGC power theorem：Lean 形式化蓝图

日期：2026-09-06。对象是当前 [TeX 手稿](../manuscript/ggc-power-closure.tex)，
尤其是其对数 Thorin 演化证明，不是背景项目中的 α-Cauchy SD 证明。

**本目录目前只有蓝图、源码 API 审计和外部公理边界，没有 Lean 实现或机器验证。**
手稿已完成本轮源文件整理；按此前要求未编译。本文的模块名和本地定理名均为
建议命名，不能当作已经存在的 Lean declarations。

阅读顺序：本文 → [mathlib API 审计](mathlib-api-audit.md) →
[外部 axiom 契约](axiom-boundary.md)。数学状态见
[ResearchStatus](../ResearchStatus.md)，逐条证明见 [WIP](../WIP.md) 和
[ledger 19–25](../ledger/README.md)。

## 1. 目标与可信边界

最终公开定理必须保持原量词：对任意非负 GGC 概率分布 μ 和任意实数 q ≥ 1，
映射 x ↦ x^q 下的像测度仍属于 GGC。不得在最终接口残留有限 Thorin 质量、
无漂移、有限二阶矩、有限 rate 支撑或形状参数上界。

按照本次用户要求，已核实的外部论文、专著定理一般声明为 `axiom`；
这使工程目标成为“相对于明确列出的文献公理，机器检查本文的新推导”。
它不是无外部数学公理的从零形式化。已有 mathlib 定理直接复用，不重复公理化。
本文的生成元连续性、Euler 存在性、动态识别和 power closure 本身不能
因为难写而进入外部公理白名单。

选定源码基线：mathlib commit
`810b3888d0aa94294b18587c453466bc86c1f0fc`，配套
`leanprover/lean4:v4.34.0-rc2`。本次核对的是实际源码，不是仅凭记忆罗列 API；
**没有执行该版本的 `#check` 或 `lake build`**。当前本机已有的 v4.32.x
不能证明这些新版本接口可编译。实施第一步必须固定版本并做最小 smoke tests。

## 2. 从手稿到工程的依赖结构

```text
非负分布、实数幂、Thorin 表示、测试函数
    ├─ 文献接口：Bondesson / James / SSV / Sethuraman
    ├─ Gamma–Beta 对数矩、指数倾斜和参数微分
    └─ 显式 K 核、跳跃基准测度、绝对可积估计
            ↓
    Palm 化的 log-rate 生成元及直接 resolvent 恒等式
            ↓
    DP 参数耦合 + 相位弱星极限 → 生成元联合连续性
            ↓
    正 Euler 核 → 二阶矩与时间模 → 紧性 → 非线性弱方程
            ↓
    无界测试扩张 → Laplace 演化 → log-value 输运唯一性
            ↓
    有限 gamma 卷积任意 q → 弱逼近 → 全体 GGC
```

| 手稿 | 本地工程责任 | 不允许被公理化的新结论 |
|---|---|---|
| §2 Foundations（01-foundations.tex） | 分布、Thorin、DP、文献接口及可测代表元适配 | 联合可测相位选择、文献公式的本地参数转换 |
| §3 Power tangent（02-power-tangent.tex） | 倾斜分布、q 与 s 微分、Gamma 对数矩 | 精确幂方向切向量 |
| §4 Log generator（03-log-generator.tex） | K 核、Palm 漂移、全尺寸补偿、绝对积分 | 正生成元和 resolvent 直接消去恒等式 |
| §5 Evolution（04-evolution.tex） | 共同耦合、相位紧性、正 Euler、弱极限 | 联合连续性及有限时间正解存在性 |
| §6 Identification（05-identification.tex） | 对数矩、截断、参数积分、测试稠密、输运 | 所构造的曲线就是实际幂流 |
| §7 Completion（06-completion.tex） | q=1、T=log q、连续映射、弱闭包 | 保留全量词的最终组装 |

建议第一版只形式化这条依赖链。无需同时形式化七条历史路线、HCM 理论、
Lévy–Khintchine 公式、连续时间跳跃 SDE、一般 McKean–Vlasov 理论或
Wasserstein 对偶性。它们都不是当前证明的必要前置工程。

## 3. 核心对象的建议编码

### 3.1 概率分布、正 rate 和实数幂

采用 `MeasureTheory.ProbabilityMeasure ℝ` 加非负性字段：
`∀ᵐ x ∂μ, 0 ≤ x`。这样直接接上 mathlib 中定义在 ℝ 上的 Gamma、Beta、
tilted measure 和 Bochner integral。

`powerLaw μ q` 使用 `ProbabilityMeasure.map μ (fun x : ℝ => x ^ q)`。
已核实 `Real.continuous_rpow_const` 对 q ≥ 0 给出全 ℝ 的连续性；因此本目标
无需为负半轴另定义扩张。不过幂乘法等语义等式仍必须带 x ≥ 0，不能从 Lean
在负数上的总化定义推断概率论结论。证明像测度非负并单独处理 q=1。

rate 建议用 `PosReal := {b : ℝ // 0 < b}`，或明确要求测度几乎处处集中于
`Ioi 0`。**不要要求拓扑支撑包含于 `(0,∞)`**：rate 可以积聚到 0，即便它
在 0 处没有质量。`F : ProbabilityMeasure ℝ` 是 log-rate 分布，
`U = B • exp_*F`，B 必须严格为正；跳跃生成元定义不要求 F 有二阶矩。

`log_*μ` 则是 log-value 分布，不是 F。二者使用不同类型别名或命名空间。
由于 `Real.log` 在全 ℝ 上不连续，不能直接调用全空间连续映射定理；
应将严格正的 μ 提升到 `PosReal`，再映射 log，或证明相应的连续性集版本。
此处还要用已证明的统一对数矩控制，防止靠近零时丢失紧性。

### 3.2 GGC 的定义不能把结论藏进去

建议定义 `ThorinData`：漂移 a ≥ 0、`Measure PosReal` U、经典 Thorin
可积性，以及对每个 s>0 的有限实积分

\[
\Psi(s)=as+\int\log(1+s/b)\,U(db).
\]

`IsGGC μ` 表示存在这样的数据使 μ 的 Laplace 变换等于 exp(−Ψ)。
U 允许无限总质量。可以先存经典分段可积性，再证明它等价于
`Integrable (fun b => log (1 + 1/b)) U`，并推出所有 s>0 的可积性。
**不能只存一个 Bochner 积分等式而不存可积性**：Lean 中不可积函数的积分
有默认值，可能让定义错误地接受非法 Thorin 数据。

“每份合法 Thorin 数据实现一个概率分布”是外部存在定理；它与上述定义分开。
`finiteGammaLaw` 应由真正的有限乘积 Gamma 测度经求和映射构造，不能只是一个
未解释的谓词。零项卷积可定义为 δ0；主演化先处理非空正形状和 B>0。

### 3.3 DP 与相位

DP 必须有明确语义：随机概率测度的有限分割分布是 Dirichlet，允许原子基底
和零质量分割格。可从独立 Gamma 的归一化有限维分布定义该性质，再以
stick-breaking 构造实现它。另一种可行方式是直接定义 stick-breaking law，
将它满足 DP 有限分割性质声明为 Sethuraman 外部定理。

不要先假设概率测度空间自动具备所需的所有标准 Borel 实例。M1 应验证测度评价
σ-代数与窄拓扑 Borel 的接口、随机测度可测性及参数积分可测性；本次尚未核实
完整的现成实例链。共同概率空间可优先显式使用可数个独立 uniform 坐标，
减少对“随机测度空间也是 Polish”这一整套理论的依赖。

SSV 外部输入首先提供每个 M 的相位存在性及 a.e. 唯一性。随后本地固定
`limsup_n (−arg M(−t+i/(n+1)) / π)` 的有界截断代表元，并证明联合 Borel
可测、与外部相位 a.e. 相等、尺度变化兼容。负号在 limsup **内部**。
不能仅用 `Classical.choose` 选择相位就宣称它随 P 联合可测。

### 3.4 测试函数与弱解

`CompactTest2` 包装函数 φ:ℝ→ℝ、`ContDiff ℝ 2 φ` 和 `HasCompactSupport φ`。
另建线性增长且一、二阶导数有界的扩展测试类。函数值、导数及积分的 coercion
尽早统一，避免后期所有证明都陷于包装类型转换。

`WeakLogRateSolution B₀ F₀ T` 应明确记录：

- T ≥ 0、B(t)=B₀ exp(−t)、F(0)=F₀、F 的窄连续性；
- 存在有限 C，对 t∈[0,T] 都有 `Integrable (fun y => y^2) (F t)` 和二阶矩 ≤ C；
- 对每个 `CompactTest2`，弱方程的时间可积性及积分等式。

这些字段是需要由 Euler 构造证明的输出。不能把 `WeakLogRateSolution` 的
存在性作为外部 axiom，也不能把二阶矩有限只写成一个缺少 `Integrable` 的实积分上界。

## 4. 需要自行搭建的基础设施

### A. 解析与积分适配（中等工程量）

1. `LaplaceTilt`：s>0 下权重有界、严格正归一化、倾斜期望的积分公式；
   q 微分在 q=1 邻域的共同支配函数及 s 微分。对 0<x≤1 和 x≥1 分开估计。
2. `GammaLogMoments`：实 digamma 适配、Gamma 的 log / x log x 矩、
   Beta(1,B) 的 −log Z 矩及 B 在紧正区间的共同界。Gamma 积分导数已有
   复数版底层；分布层矩公式及参数一致性仍需组装。
3. `CompensatedKernel`：K 在 1 的可去奇点、L¹ 界、两段积分，
   ν₀ 的截断质量/一阶绝对矩和有限二阶矩。这里只需要 m₂<∞，
   不必额外形式化 Basel 和式的闭式值。
4. `TaylorBounds`：全尺寸补偿余项 O(v²)，截断漂移移位的二阶误差；
   所有带符号 Fubini 必须先证明范数可积。

### B. DP 参数连续性（高工程量）

1. 用广义逆 CDF 构造共同 uniform 耦合：Fₙ⇒F 时，位置变量逐坐标 a.s. 收敛。
   本次未找到可直接调用的 quantile / Skorohod convergence API；现有
   `Kernel.exists_measurable_map_eq_unitInterval` 只给随机化表示，不保证这种收敛。
2. Beta 权重可显式取 V=1−T^(1/B)。证明权重连续、尾余量趋零和可数共同满测集。
3. posterior 用 P=(1−Z)Q+Zδ_b；证明当 Bₙ、Fₙ、yₙ 同时变化时的弱收敛。
4. 核函数 `e^y/(s e^y+e^z)` 的 y 导数界给出移动尺度下的 resolvent 收敛。
   从固定 P 收敛到随机 posterior 积分，必须证明共同的 Beta 对数支配。

Sethuraman 只许可其分布恒等式作为外部输入；上述移动参数耦合和一致可积论证
仍是本地工程。若以后采用一条独立文献中的 Skorohod 定理作 axiom，必须先
增加精确来源和契约，不能把一般随机化 API 冒充这一结果。

### C. 相位弱星紧性（高工程量；两个实现选择）

手稿用 L∞ 单位区间的弱星紧性。mathlib 已有 Banach–Alaoglu 和可分前对偶下
弱星紧集的可度量化，但本次没有核实可直接复用的 `(L¹)* ≃ L∞` 满射表示整套
接口。不要将“存在 `WeakDual`”记为“相位极限已经做完”。

优先尝试一个等价的工程实现，**目前只是待实现方案，不是已验证 API**：

\[
w=\frac{u}{1+u},\quad
\sigma_n(dw)=\eta_n\!\left(\frac{w}{1-w}\right)dw,\quad 0\le\sigma_n\le dw
\quad(0\le w\le1).
\]

在紧区间上抽取有限测度弱极限，证明极限仍 ≤ Lebesgue；Radon–Nikodym
给出密度 0≤η≤1，且端点没有原子。对任意 f∈L¹(du)，换元后的测试为
`f(w/(1−w))/(1−w)^2`，属于 L¹(dw)。先对连续测试取极限，再利用
共同支配 σₙ≤dw 和 L¹ 稠密性扩张到这个测试类；最后用锚点 1 的相位唯一性
识别极限。需要自行证明支配关系弱闭、换元和稠密适配。

这一路径复用 Prokhorov/Radon–Nikodym，可能比先开发完整 Lp 对偶表示更短。
两条实现都只能输出对 L¹ 核的弱星收敛，**不是逐点边界相位收敛**。

### D. 正 Euler 与非线性弱极限（最大工程块）

固定有限 T；h=T/N、ε=√h。在 N 足够大时显式定义

\[
\Pi_h(y,dz)=p\delta_{y+h a_\varepsilon/p}(dz)
 +h\int_{|v|>\varepsilon}\delta_{y+v}(dz)k(y,v)\nu_0(dv),
\quad p=1-h\lambda_\varepsilon\ge\tfrac12.
\]

1. 证明它是可测的 Markov kernel，非负且质量恰为 1。
2. 逐步递归 `F_{j+1}=F_j Π_h(B_j,F_j)`；该核每一步依赖当前确定的边缘分布，
   不是只依赖 y 的固定线性半群。
3. 精确计算 EΔ=ha 和 EΔ²；离散 Gronwall 给出统一二阶矩。
4. 建有限路径测度以耦合不同时刻；中心化增量交叉项为零可用核积分逐次消去
   证明，不必先实现一般鞅 L² 理论。得到时间增量二阶矩估计。
5. **线性插值概率分布**，不是插值样本路径后假设边缘相同。
   用 Prokhorov 和时间等度连续抽取曲线极限。
6. 可复用 Lévy–Prokhorov 度量化窄拓扑：从耦合与 Markov 尾界证明
   `d_LP(μ,ν) ≤ (E|Y−Z|²)^(1/3)`（零值另处理），已足以得到时间模。
   这个桥接不等式仍需本地证明；不要将库里的拓扑等价当作定量耦合界。
7. 证明累计一致性误差趋零，量级为 `√h+h(log h)^2`；随后用 Hφ(B,F)
   的联合连续性通过非线性极限。仅证明 frozen-F 连续不够。

Arzelà–Ascoli 的库定理不能直接吃离散网格。需要先有连续插值、共同紧值域和
等度连续性；若估计只给渐近等度连续，先对有限个早期网格单独处理，或采用
有理时刻对角抽取再延拓。最终弱方程需对所有测试同时成立，而非每个 φ 各选
不同子列。

### E. 动态识别（高工程量）

1. 从 F 的统一二阶矩得到合法 Uₜ 及 μₜ 的统一 `E|log X|`；无须有限 EX。
2. 截断扩张测试域，证明 cutoff 一、二阶导数误差和尾项趋零。
3. 利用直接 resolvent 恒等式及 B′=−B 得到 gₜ′=hₜ。别漏掉质量衰减项。
4. 从 δ≤s 的等式积分后令 δ↓0；用严格正 Laplace 下界及 `E|log X|`
   控制 s×t 的绝对积分。不能擅自加强成 `E|X log X|<∞`。
5. Bernstein 逼近 J′，积分得到 C¹ 多项式逼近；转回 Hₙ(x)=pₙ(e^(−x))
   后同时控制函数范数和 `x log x H′` 的生成元范数。只有 C⁰ 稠密性不够。
6. 对 log-value 的线性输运弱方程，形式化后向测试
   ζᵤ(z)=ζ(e^(t−u)z) 的时间分割证明。Laplace 静态唯一性不能替代这一步。
7. 证明紧支撑光滑测试决定有限实线测度，再识别 μₜ=law(X₀^(e^t))。

### F. 全量词组装（较小但高重要性）

先证任意非空有限 Gamma 卷积、任意 q>1 的结论，只取 T=log q。
再用 Bondesson 的零漂移有限原子逼近、实数幂连续映射及 GGC 弱闭包。
不同初始逼近分布的二阶矩常数和 Euler 网格阈值可以不同，不需要跨逼近族一致。
漂移、无限 Thorin 质量和 δ0 在最终闭包步骤纳入；单列端点测试防止偷偷丢失。

## 5. 建议目录与实施顺序

以下是计划，尚未创建这些 Lean 文件：

```text
formalization/
  README.md                 # 本蓝图
  mathlib-api-audit.md       # 固定版本的源码证据
  axiom-boundary.md          # 文献契约和最终信任白名单
  [实施时新增]
  lean-toolchain
  lakefile.toml
  lake-manifest.json
  GGC/
    Basic/{Law,Power,Thorin,Tests}.lean
    External/{Bondesson,James,SSV,Sethuraman}.lean
    Probability/{GammaLogMoments,Dirichlet,QuantileCoupling}.lean
    Analysis/{Tilt,Tangent,Kernel,PhaseCompactness}.lean
    LogRate/{Generator,Resolvent,Continuity}.lean
    Evolution/{EulerKernel,Moments,Compactness,WeakLimit}.lean
    Identification/{LogMoments,Cutoff,Laplace,Transport}.lean
    Main.lean
  Tests/{API,Endpoints,AxiomAudit}.lean
```

| 里程碑 | 输入 → 验收输出 | 风险 |
|---|---|---|
| M0 版本与 smoke tests | 锁定 commit/toolchain；编译最小的 ProbabilityMeasure、Tilted、Kernel、Prokhorov 接口 | 低；版本漂移可控 |
| M1 定义与外部契约 | 有语义的 IsGGC/DP/Test/WeakSolution；外部 axiom 来源逐条对应 | 高；定义错误会污染整条证明 |
| M2 显式解析核 | K 的消去与绝对积分、ν₀ 二阶矩、Taylor 界全部无 sorry | 中 |
| M3 精确切向与生成元 | Gamma 对数矩、Palm、直接 resolvent 恒等式；签名无漏项 | 中高 |
| M4 参数连续性 | quantile 耦合、phase compactness、联合 Hφ 连续 | 高；首个主要技术闸门 |
| M5 正 Euler | Markov kernel、归纳质量、M₂ 和时间模 | 高 |
| M6 非线性存在性 | 任意有限 T 的 WeakLogRateSolution；不假定其存在 | 高；最大集成闸门 |
| M7 实际幂流识别 | 截断、零端点、C¹ 逼近、动态输运唯一性 | 高 |
| M8 主定理与审计 | 任意 GGC 与实 q≥1；端点检查；`#print axioms` 白名单 | 中；量词和信任检查关键 |

推荐顺序 M0 → M1 → M2 → M3 → M4 → M5 → M6 → M7 → M8。
M1 后可先写“假设有限 Gamma 情形已证，则全 GGC 成立”的闭包胶合定理，
用来尽早检查公开签名；但它只能标为条件性组装，不能算 M8 完成。

首先做小型原型的三个接口：

- `ProbabilityMeasure` 的可测结构与 DP 样本参数积分；
- 受 Lebesgue 控制的相位测度的弱极限；
- 正 Euler 核的质量和前二阶增量恒等式。

它们最能验证选型。单纯把 §7 写成十行胶合代码并不能反映主工程难度。
当前只给风险分级，不虚构完成概率、精确工期或已验证的 Lean 行数。

## 6. 完成标准

每个本地模块应链接到 TeX label / WIP ID；每个外部声明应链接到准确文献页码。
最后必须：

1. 固定工具链下全量 `lake build` 通过，公开主定理可独立导入。
2. `#print axioms` 不含 `sorryAx`，只含基础逻辑公理及明确登记的外部数学公理。
3. 白名单中不含本项目待证明的存在性、连续性、识别或目标本身的同义改写。
4. 完整的 IsGGC 定义和所有 Integrable、正性、可测性条件均随代码接受审阅。
5. 检查 q=1、δ0、任意固定 q>1、含漂移与无限 Thorin 质量的最终签名。
6. 分别报告“源文献审计”“手稿数学审计”“Lean 相对公理验证”的状态；
   三者不能相互替代。

本次交付停在工程蓝图和源码 API 核对，不会把计划中的模块记作已经实现。
