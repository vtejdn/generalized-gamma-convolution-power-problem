# mathlib API 源码审计

返回：[形式化蓝图](README.md) · [外部 axiom 边界](axiom-boundary.md)。

## 1. 审计基线和证据等级

检索日期：2026-09-06。检索对象为从官方
[leanprover-community/mathlib4](https://github.com/leanprover-community/mathlib4)
取得的实际源码树：

- commit：`810b3888d0aa94294b18587c453466bc86c1f0fc`；
- commit 时间：`2026-09-05T15:48:37Z`；
- [lean-toolchain][toolchain]：`leanprover/lean4:v4.34.0-rc2`；
- 方法：`rg --files`、按主题全文检索、阅读 declaration 和相邻 namespace、
  阅读关键完整签名；不是只搜索在线文档标题。

下面的源码链接全部固定到该 commit，避免最新版网页和本地工具链错配。
这是一个实际核对的近期快照，不声称它永远是最新版本。
此处“已有”均指 **SOURCE-VERIFIED**，不是已通过本项目 imports 的编译测试。
尚未运行 `#check`、`#print axioms` 或 `lake build`；实施时由 M0 补做。

Lean `Init` / `Std` 与 mathlib 必须区分：以下测度论、概率论和高等分析 API
主要属于 mathlib，不是 Lean 编译器自带标准库。背景 SD 蓝图的旧版基线不能
作为本表的编译依据。

## 2. 已有的通用 API 和需要的适配

表中给出完整 namespace 或明确的同一 namespace 前缀；源码链接的行号对应
本次快照。模块路径写成 `Mathlib/...lean` 的形式；实际 import 用点分隔且省略后缀。

### 2.1 分布、弱收敛、紧性

| 需求 | 已核实的 declaration | 源码位置 | 对本项目的帮助 / 尚需处理 |
|---|---|---|---|
| 概率分布对象 | `MeasureTheory.ProbabilityMeasure` | [ProbabilityMeasure.lean:103][prob] | 可携带概率性并使用窄拓扑；非负性另建字段 |
| 弱收敛测试刻画 | `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` | [ProbabilityMeasure.lean:364][prob-weak] | 测试类型为 `Ω →ᵇ ℝ`，不是任意可积函数 |
| 测试积分连续性 | `MeasureTheory.ProbabilityMeasure.continuous_iff_forall_continuous_integral`、`continuous_integral_boundedContinuousFunction` | [ProbabilityMeasure.lean:391][prob-cont] | 固定有界连续测试已就绪；随参数变化的测试需 sup 范数或共同界适配 |
| 像测度 | `MeasureTheory.ProbabilityMeasure.map`、`map_apply_of_aemeasurable` | [ProbabilityMeasure.lean:626][prob-map] | 本快照 `map ν f` 不显式接可测性参数；使用其像测度语义仍须证明 `AEMeasurable f ν` |
| 连续映射保持弱收敛 | `MeasureTheory.ProbabilityMeasure.tendsto_map_of_tendsto_of_continuous`、`continuous_map` | [ProbabilityMeasure.lean:657][prob-map-cont] | 可直接承担最后的固定 q 幂映射；不能把全 ℝ 不连续的 log 直接传入 |
| Prokhorov | 根 namespace 的 `isCompact_closure_of_isTightMeasureSet` | [Prokhorov.lean:530][prok] | 紧测度族的闭包紧；M₂ 到紧性、时间方向抽取仍需本地证明 |
| 定量紧集条件 | 根 namespace 的 `isCompact_setOfPred_probabilityMeasure_mass_eq_compl_isCompact_le` | [Prokhorov.lean:505][prok-bound] | 以共同紧集 Kₙ 和趋零尾界 uₙ 表述；可接二阶矩尾界 |
| Portmanteau | `MeasureTheory.ProbabilityMeasure.limsup_measure_closed_le_of_tendsto`、`le_liminf_measure_open_of_tendsto` | [Portmanteau.lean:314][port] | 在实线检查开闭集极限；M₂ 下半连续可另以截断连续测试直接证明 |
| 有界 Lipschitz 测试 | `MeasureTheory.tendsto_iff_forall_lipschitz_integral_tendsto` | [Portmanteau.lean:688][port-lip] | 要求 countably generated filter；给拓扑刻画，不给具体 BL 距离的全套性质 |
| 窄拓扑度量化 | `MeasureTheory.LevyProkhorov.probabilityMeasureHomeomorph` | [LevyProkhorovMetric.lean:676][lp] | 接概率曲线的紧性；从二阶矩耦合到定量距离界需证明 |
| 曲线紧性 | `BoundedContinuousFunction.arzela_ascoli`、`arzela_ascoli₂` | [ArzelaAscoli.lean:90][aa] | 需要已构造连续插值、共同紧值域、等度连续；不直接接受离散网格 |
| 测度由测试积分确定 | `MeasureTheory.ext_of_forall_integral_eq_of_IsFiniteMeasure` | [HasOuterApproxClosed.lean:269][measure-ext] | 有界连续实测试版本；由紧支撑光滑测试扩张到此接口需稠密/截断引理 |

### 2.2 核、随机化和积分

| 需求 | 已核实的 declaration | 源码位置 | 对本项目的帮助 / 尚需处理 |
|---|---|---|---|
| 指数倾斜 | `MeasureTheory.Measure.tilted` | [Tilted.lean:42][tilted] | 权重是 exp(f)，本项目取 f(x)=−s x；`exp f` 不可积时其值可能为零测度 |
| 倾斜后为概率 | `MeasureTheory.isProbabilityMeasure_tilted` | [Tilted.lean:126][tilted-prob] | 需要 `[NeZero μ]` 及 `Integrable (fun x => exp (f x)) μ`，不是无条件实例 |
| 倾斜积分 | `MeasureTheory.integral_tilted`、`integrable_tilted_iff` | [Tilted.lean:230][tilted-int] | 已有密度/归一化代数；本项目仍须给正 Laplace 下界及局部参数支配 |
| 核复合 | `MeasureTheory.Measure.comp_assoc`、`map_comp` | [MeasureComp.lean:30][measure-comp] | 可递归产生 Euler 边缘分布；Markov、可测和参数条件需本地实例 |
| 带符号核 Fubini | `MeasureTheory.Measure.integrable_compProd_iff`、`integral_compProd` | [IntegralCompProd.lean:461][comp-int] | 前者含外层范数积分可积；只有逐样本积分存在不足以调用后者 |
| 有限路径核 | `ProbabilityTheory.Kernel.partialTraj` | [PartialTraj.lean:102][partial] | 可组织有限 Euler 链；具体前二阶矩和中心化交叉项仍是本地证明 |
| 可测随机化 | `ProbabilityTheory.Kernel.exists_measurable_map_eq_unitInterval` | [Representation.lean:111][randomize] | 标准 Borel 目标下给 uniform 随机化；不提供随分布变化的 a.s. 收敛耦合 |
| 单个分布的随机化 | `MeasureTheory.Measure.exists_measurable_map_eq` | [Representation.lean:126][randomize] | 同样没有 quantile 收敛保证 |
| 可数独立积 | `ProbabilityTheory.iIndepFun_infinitePi`、`iIndepFun.hasLaw_infinitePi` | [InfinitePi.lean:106][infinite] | 可支持共同 uniform 概率空间；stick-breaking 收敛、DP 语义需另外提供 |
| DCT | `MeasureTheory.tendsto_integral_of_dominated_convergence` | [DominatedConvergence.lean:57][dct] | 要求可测性、可积共同界、a.e. 收敛；适合 posterior 对数支配 |
| filter 版 DCT | `MeasureTheory.tendsto_integral_filter_of_dominated_convergence` | [DominatedConvergence.lean:69][dct] | 支持 countably generated filter；与序列拓扑转换要明确 |
| 通常 Fubini | `MeasureTheory.integral_prod` | [Integral/Prod.lean:440][fubini] | 接 s×t 和 DP 样本积分前先证明绝对可积 |
| 积分下求导 | 根 namespace 的 `hasDerivAt_integral_of_dominated_loc_of_deriv_le` | [ParametricIntegral.lean:288][param] | 假设一个共同参数邻域、函数点处可积、导数共同可积界；返回导数可积性与 HasDerivAt 的合取 |

### 2.3 特殊函数、相位和测试逼近

| 需求 | 已核实的 declaration | 源码位置 | 对本项目的帮助 / 尚需处理 |
|---|---|---|---|
| Gamma 分布 | `ProbabilityTheory.gammaMeasure`、`isProbabilityMeasure_gammaMeasure` | [Gamma.lean:128][gamma] | 参数为正 shape a、正 rate r；现成分布层接口未给本项目全部对数矩 |
| Beta 分布 | `ProbabilityTheory.betaMeasure`、`isProbabilityMeasureBeta` | [Beta.lean:132][beta] | 注意概率性定理的实际拼写；非负形状的退化分割不能直接套正参数 Beta/Gamma 密度 |
| digamma | `Complex.digamma`、`Complex.digamma_apply_add_one` | [Digamma.lean:48][digamma] | 此文件是复数版，不应虚构 `Real.digamma` 同名 API；需实轴适配 |
| Gamma 积分导数 | `Complex.hasDerivAt_GammaIntegral` | [Gamma/Deriv.lean:50][gamma-deriv] | 实际条件为 `0 < s.re`；已有含 log t 的积分公式，可降低实 Gamma 对数矩成本 |
| rpow 连续性 | `Real.continuous_rpow_const` | [Pow/Continuity.lean:226][rpow-cont] | 条件 q≥0，可用于全 ℝ 连续映射 |
| rpow 乘法 | `Real.rpow_mul` | [Pow/Real.lean:415][rpow-mul] | 条件 x≥0；输出 `x^(y*z)=(x^y)^z` |
| 代数 resolvent 变换 | `MeasureTheory.resolventTransform`、`hasDerivAt_resolventTransform`、`analyticOn_resolventTransform` | [ResolventTransform.lean:104][resolvent] | 不是 SSV 的完整 Stieltjes 类；其参数导数为正的 resolvent 平方积分，使用前必须核对变量、符号、谱外条件 |
| Banach–Alaoglu | `WeakDual.isCompact_closedBall`、`isSeqCompact_closedBall` | [WeakDual.lean:269][weakdual] | 原生闭球紧/序列紧；识别前对偶、可分性和相位 L∞ 表示并非自动完成 |
| 弱星紧集可度量化 | `WeakDual.metrizable_of_isCompact` | [WeakDual.lean:340][weakdual-seq] | 前对偶可分等假设需实例；不能把任意弱星紧性当作序列紧性 |
| Radon–Nikodym | `MeasureTheory.Measure.withDensity_rnDeriv_eq`、`rnDeriv_le_one_of_le` | [RadonNikodym.lean:60][rn]、[同文件:420][rn-le] | 支持相位测度 compactification 方案；测度支配弱闭和 L¹ 测试扩张需证明 |
| 光滑紧支撑函数 | 根 namespace 的 `exists_contDiff_tsupport_subset` | [BumpFunction/FiniteDimension.lean:45][bump] | 得到点附近的 bump；统一 cutoff 及缩放后导数界仍需搭建 |
| 光滑逼近 | `UniformContinuous.exists_contDiff_dist_le` | [SmoothApprox.lean:48][smooth] | 本身不保证逼近函数紧支撑；需结合 cutoff 并控制误差 |
| Bernstein 一致逼近 | 根 namespace 的 `bernsteinApproximation_uniform` | [Bernstein.lean:182][bernstein] | 逼近连续函数；本项目将其应用于 J′，再积分构造 C¹ 多项式逼近 |
| FTC | `intervalIntegral.integral_eq_sub_of_hasDerivAt` | [FundThmCalculus.lean:1148][ftc] | 需导数的区间可积性；适配时间积分和多项式原函数 |
| 分部积分 | `intervalIntegral.integral_mul_deriv_eq_deriv_mul_of_hasDerivAt` | [IntegrationByParts.lean:111][ibp] | 支持有限截断区间；奇点或无穷端点极限由本地绝对界处理 |

## 3. 检索未发现现成专用接口的部分

这是对上述快照和已列检索范围的结论，不是“所有 Lean 社区项目绝对没有”。
也没有将第三方未经审计的 GitHub 草稿当作 mathlib 标准 API。

| 缺口 | 检索结论 | 工程处理 |
|---|---|---|
| GGC / Thorin / HCM / complete Bernstein 类 | 在相关 analysis/probability/measure 文件中未找到本文所需类与定理 | 定义有语义的 Thorin / IsGGC；专著理论走外部 axiom 契约 |
| Dirichlet process / Markov–Krein / stick-breaking | 未找到可直接使用的 DP 定义及所需恒等式 | DP 有限分割语义、可测随机测度接口自建；James/Sethuraman 文献结论作 axiom |
| DP Palm posterior | 有 generic Bayesian `Kernel.Posterior`，但未发现本文的 DP conjugacy 公式 | 严格区分 generic posterior 与 DP 特定恒等式；详见公理登记 |
| 收敛兼容的 quantile / Skorohod 耦合 | 已有 CDF 与一般随机化，未找到本证明所需的收敛定理 | 实线广义逆 CDF 的单调性、a.e. 连续点、共同 uniform 耦合本地实现 |
| SSV 规范相位 | 未找到 bounded analytic Stieltjes phase 及联合可测代表元 | 文献存在/唯一性 + 本地 limsup 代表元与尺度适配 |
| L¹–L∞ 满对偶表示 | 找到 Holder 的自然配对和 WeakDual 紧性，未核实整套所需的满射识别 | 先试紧区间相位测度/RN 方案；否则单独评估对偶表示工程 |
| Gamma/Beta 参数统一 log-moment | 找到 Gamma 积分导数、分布密度，未找到全部目标矩接口 | 连接实/复 Gamma、密度积分和局部共同支配，不能只拿公式忽略可积性 |
| 本文 nonlinear Euler 存在定理 | 未找到即插即用定理；也不应假设它 | 正核、矩估计、紧性、一致性及非线性极限全部自证 |
| `x log x` 动态输运识别 | 未找到直接覆盖本证明的 API | 用显式后向测试和时间分割自建，避免引入一般 PDE 唯一性理论 |
| C¹ 指数多项式生成元范数稠密 | Bernstein 给 C⁰，不直接给目标 | 逼近导数再积分，接 `sup abs(x log x) exp(−x)<∞` |

另外，“概率测度空间的评价可测结构 = 窄拓扑 Borel”及所需 StandardBorel 实例链
仍是 **接口待验证**，不是已经判定无库支持。M0/M1 应专门测试，不要根据
对象上同时存在 TopologicalSpace 和 MeasurableSpace 就假设两者兼容。

## 4. 容易误认的库名

- `StieltjesFunction` 是 CDF/右连续单调函数对象，不是解析 Stieltjes 函数类。
- `Analysis/SpecialFunctions/Bernstein.lean` 处理 Bernstein 多项式，不是 complete
  Bernstein functions 的表示理论。
- `ResolventTransform` 提供某种谱 resolvent 的积分；不自动给出 bounded phase。
- `Kernel.Representation` 的可测随机化不等于 Skorohod 收敛耦合。
- `LevyConvergence` / `LevyProkhorovMetric` 不应当作 Lévy–Khintchine API。
- `Complex.digamma` 不等于已包装好的实 Gamma 概率对数矩接口。

## 5. 检索复现和后续编译闸门

在固定 commit 的 mathlib 源码根目录，核心主题检索为：

```powershell
git rev-parse HEAD
Get-Content lean-toolchain
rg -n -i 'dirichlet process|dirichletprocess|thorin|generalized gamma convolution|gamma convolution|complete bernstein|stieltjes function|quantile|skorohod|skorokhod|stick.break|markov.krein|cifarelli' Mathlib/Probability Mathlib/MeasureTheory Mathlib/Analysis
rg --files Mathlib | rg 'Prokhorov|Portmanteau|Tilted|Representation|WeakDual|Gamma|Beta|Bernstein'
rg -n 'hasDerivAt_integral_of_dominated|tendsto_integral_of_dominated_convergence' Mathlib
```

进一步读取候选 declaration 的完整签名和 namespace；不能仅从 `rg` 中调用点的
名字断定定理归属。实施时固定 lake manifest，写独立 `Tests/API.lean`：

1. 导入本表实际需要的模块，逐条 `#check` 关键 declaration。
2. 编译三个实例化例子：正实 q 的像测度弱收敛；s>0 的概率倾斜；
   实线概率二阶矩尾界到紧性。
3. 单独检查随机概率测度参数可测、核复合的 coercions，以及实/复 Gamma 适配。
4. 把 source-verified 状态逐项升级为 elaboration-verified，而不是整表一键宣称完成。

[toolchain]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/lean-toolchain
[prob]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean#L103
[prob-weak]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean#L364
[prob-cont]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean#L391
[prob-map]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean#L626
[prob-map-cont]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean#L657
[prok]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Prokhorov.lean#L530
[prok-bound]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Prokhorov.lean#L505
[port]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Portmanteau.lean#L314
[port-lip]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Portmanteau.lean#L688
[lp]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/LevyProkhorovMetric.lean#L676
[aa]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Topology/ContinuousMap/Bounded/ArzelaAscoli.lean#L90
[measure-ext]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/HasOuterApproxClosed.lean#L269
[tilted]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Tilted.lean#L42
[tilted-prob]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Tilted.lean#L126
[tilted-int]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Tilted.lean#L230
[measure-comp]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Probability/Kernel/Composition/MeasureComp.lean#L30
[comp-int]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Probability/Kernel/Composition/IntegralCompProd.lean#L461
[partial]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Probability/Kernel/IonescuTulcea/PartialTraj.lean#L102
[randomize]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Probability/Kernel/Representation.lean#L111
[infinite]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Probability/Independence/InfinitePi.lean#L106
[dct]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Integral/DominatedConvergence.lean#L57
[fubini]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Integral/Prod.lean#L440
[param]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/Calculus/ParametricIntegral.lean#L288
[gamma]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Probability/Distributions/Gamma.lean#L128
[beta]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Probability/Distributions/Beta.lean#L132
[digamma]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean#L48
[gamma-deriv]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/SpecialFunctions/Gamma/Deriv.lean#L50
[rpow-cont]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/SpecialFunctions/Pow/Continuity.lean#L226
[rpow-mul]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/SpecialFunctions/Pow/Real.lean#L415
[resolvent]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/ResolventTransform.lean#L104
[weakdual]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/Normed/Module/WeakDual.lean#L269
[weakdual-seq]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/Normed/Module/WeakDual.lean#L340
[rn]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean#L60
[rn-le]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean#L420
[bump]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/Calculus/BumpFunction/FiniteDimension.lean#L45
[smooth]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/Calculus/BumpFunction/SmoothApprox.lean#L48
[bernstein]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/Analysis/SpecialFunctions/Bernstein.lean#L182
[ftc]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean#L1148
[ibp]: https://github.com/leanprover-community/mathlib4/blob/810b3888d0aa94294b18587c453466bc86c1f0fc/Mathlib/MeasureTheory/Integral/IntervalIntegral/IntegrationByParts.lean#L111
