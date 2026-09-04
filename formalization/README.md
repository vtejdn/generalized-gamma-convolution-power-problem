# Lean 形式化路线图：\(\alpha\)-Cauchy 的非自分解性

> 状态：工程设计稿；尚未创建 Lake 工程，也尚未开始 Lean 实现。  
> 数学底稿：[`../version-1/SD2.tex`](../version-1/SD2.tex)。  
> API 审计基线：Lean `4.32.2`，mathlib revision
> `905b95818eb32af7874a58b427f50c1711a5e96c`（2026-09-04 在本机完整源码上核查）。

本文档中的“标准库”分成两层：Lean 4 自带的 `Init`/`Std`，以及数学形式化实际依赖的
`mathlib`。概率测度、积分、特征函数、Gamma/Beta 函数和复分析都来自 mathlib，不应误写成
Lean core 已有功能。

## 1. 目标与首期范围

最终目标是形式化

\[
  1<\alpha<2 \quad\Longrightarrow\quad
  \mathcal C_\alpha\notin SD,
\]

并在后续阶段补齐 \(\alpha=2\)、\(\alpha>2\) 以及稳定过程首次击中时间的推论。首个试点取
\(\alpha=3/2\)，但模块和 lemma 从一开始尽量按一般参数 \(1<\alpha<2\) 设计。

首期不把以下问题纳入主定理的依赖链：

- \(|\mathcal C_\alpha|\) 或 \(|\mathcal C_\alpha|^{-p}\) 的 SD 问题；
- HCM、GGC、Thorin 测度和 beta-prime 的完整形式化；
- 一般 Lévy 过程的路径空间或随机积分；
- Wang 关于 \(\alpha>2\) 非无限可分性的完整形式化。

最重要的工程原则是把“新的解析障碍”与“两条经典概率论桥梁”分开。第一项应先成为一个
不含 `sorry`、不依赖 SD 定义的纯解析定理：

\[
  J_\alpha\in L^1(\mathbb R),\qquad
  \int_{\mathbb R}J_\alpha(t)\,dt<0
  \quad\Longrightarrow\quad
  J_\alpha\text{ 不是任何概率测度的特征函数}.
\]

然后再分别接入：

1. `alphaCauchy_charFun_laplace`：真实 \(\alpha\)-Cauchy 密度的特征函数等于 Wang 的
   Laplace 表示；
2. `selfDecomposable_implies_J_charFun`：SD/BDLP/Lévy–Khintchine 桥梁。

## 2. 数学证明的依赖链

令

\[
\begin{aligned}
 c_\alpha&=\cos(\pi\alpha/2),\\
 D_\alpha(y)&=y^{2\alpha}+2c_\alpha y^\alpha+1,\\
 H_\alpha(y)&=D_\alpha(y)^{-1},\\
 \phi_\alpha(z)&=k_\alpha\int_0^\infty
   e^{-|z|y}y^\alpha H_\alpha(y)\,dy,\\
 \Psi_\alpha(z)&=-\log\phi_\alpha(z),\\
 q_\alpha(z)&=z\Psi_\alpha'(z),\\
 J_\alpha(z)&=1-\frac{q_\alpha(z)}{1+\alpha}.
\end{aligned}
\]

对 \(z>0\)，缩放后再定义

\[
  F_\alpha(z)
  =\frac{z^{1+\alpha}\phi_\alpha(z)}
         {k_\alpha\Gamma(1+\alpha)}
  =\mathbb E\!\left[H_\alpha
      \left(\frac{\Gamma_{1+\alpha}}z\right)\right].
\]

建议按下列 theorem chain 实现：

| 编号 | 形式化结论 | 主要依赖 |
|---|---|---|
| T0 | \(D_\alpha>0\)，并建立 \(H_\alpha\)、\(y^\alpha H_\alpha(y)\)、\(\log D_\alpha(y)/y^2\) 的端点界与可积性 | `Real.rpow`、三角恒等式、比较判别 |
| T1 | \(\phi_\alpha>0\)、连续，在 \(z>0\) 可微；导数可移入积分；建立 \(F_\alpha\) 的 Gamma 表示 | 参数积分、DCT、Gamma 密度 |
| T2 | \(q_\alpha(z)\to0\)（\(z\downarrow0\)），\(q_\alpha(z)\to1+\alpha\) 且 \(J_\alpha(z)=O(z^{-\alpha})\)（\(z\to\infty\)） | 直接估计，不使用 Watson/Hardy–Littlewood 黑箱 |
| T3 | \(q_\alpha\) 有界，偶延拓的 \(J_\alpha\in L^1(\mathbb R)\)；\(\log F_\alpha\in L^1(0,\infty)\)，两端边界项为零 | T1–T2、连续函数在紧区间有界 |
| T4 | 精确抵消 \(K_\alpha:=\int_0^\infty\log D_\alpha(y)y^{-2}dy=0\) | 分部积分、幂换元、complex beta-ray lemma |
| T5 | Gamma 缩放恒等式，把 \(\int\mathbb E[-\log H_\alpha(\Gamma/z)]dz\) 化为 \((1+\alpha)K_\alpha=0\) | 绝对可积性、Fubini、Gamma 一阶矩 |
| T6 | 对每个 \(z>0\) 的严格 log-Jensen 不等式 | `log x < x - 1`、Gamma 密度正性、非退化性 |
| T7 | \(\int_0^\infty J_\alpha<0\)，进而 \(\int_\mathbb R J_\alpha<0\) | T3、T5–T6、有限区间分部积分后取极限 |
| T8 | 可积特征函数的总积分实部非负；因此 \(J_\alpha\) 不是特征函数 | Gaussian regularization、Fubini、DCT |
| T9 | 若 \(\mathcal C_\alpha\) 是 SD，则 \(J_\alpha\) 是某个对称概率测度的特征函数 | SD、BDLP、对称 Lévy–Khintchine；原点补原子修正 |
| T10 | \(\alpha\)-Cauchy 密度归一化、对称，且其特征函数满足 T1 的 Laplace 表示 | Fourier/Laplace/复分析；Wang, Lemma 2.7 |

依赖关系如下；解析核心不反向依赖 SD 层：

```text
Kernel ──> LaplaceRepresentation ──> LaplaceBounds ─────────────┐
   │                 │                         │                │
   │                 └──> GammaScaling ──> StrictLogJensen ────┤
   └──> ComplexBetaRay ──> LogCancellation ────────────────────┤
                                                                 v
                                              integral_J_neg + J_integrable
                                                                 │
IntegrableCharFun ────────────────────────────────────────────────┤
                                                                 v
                                                       J_not_charFun
                                                                 │
AlphaCauchy identification ──┐                                   │
SelfDecomposable/BDLP ───────┴───────────────────────────────────┘
                                                                 │
                                                                 v
                                                alphaCauchy_not_SD
```

## 3. mathlib 已有、且本项目需要的 API

下面只列已经在上述固定 revision 中核实过的名称。创建工程后仍应让 CI 锁定同一 revision，
避免 API 漂移。

### 3.1 特征函数与概率测度

Import：`Mathlib.MeasureTheory.Measure.CharacteristicFunction.Basic`

- `MeasureTheory.charFun`；实线上展开可用 `charFun_apply_real`；
- `charFun_zero`、`charFun_neg`、`norm_charFun_le_one`；
- `stronglyMeasurable_charFun`、`measurable_charFun`、`intervalIntegrable_charFun`；
- `charFun_map_smul`、`charFun_map_mul`、`charFun_dirac`；
- `charFun_conv`；
- `Measure.ext_of_charFun`；
- `charFun_eq_fourierIntegral`、`charFun_eq_fourierIntegral'`。

Import：`Mathlib.MeasureTheory.Measure.CharacteristicFunction.TaylorExpansion`

- `continuous_charFun`；
- `contDiff_charFun`、`iteratedFDeriv_charFun`、`iteratedDeriv_charFun`。这些高阶结果要求相应
  `MemLp` 矩条件，不能用于 \(\alpha\in(1,2)\) 时在原点不存在的一阶矩。

Import：`Mathlib.MeasureTheory.Measure.IntegralCharFun`

- `integral_charFun_Icc`；
- `measureReal_abs_gt_le_integral_charFun` 及其内积空间版本。

Import：`Mathlib.MeasureTheory.Measure.LevyConvergence`

- `isTightMeasureSet_of_tendsto_charFun`；
- `ProbabilityMeasure.tendsto_of_tendsto_charFun`；
- `ProbabilityMeasure.tendsto_iff_tendsto_charFun`。

注意：mathlib 的 `charFun` 使用 \(e^{itx}\)，Fourier API 使用带 \(-2\pi i\) 的约定；凡在两者
之间切换，必须显式记录缩放和符号。

### 3.2 Gamma 分布与 Gamma/Beta 积分

Import：`Mathlib.Probability.Distributions.Gamma`，namespace `ProbabilityTheory`

- `gammaPDFReal`、`gammaPDF`、`gammaMeasure`；
- `gammaPDF_of_neg`、`gammaPDF_of_nonneg`；
- `measurable_gammaPDFReal`、`stronglyMeasurable_gammaPDFReal`；
- `gammaPDFReal_pos`、`gammaPDFReal_nonneg`；
- `lintegral_gammaPDF_eq_one`；
- `isProbabilityMeasure_gammaMeasure`。

`gammaMeasure a r` 的参数是 shape 和 rate；本项目的 \(\Gamma_p\) 应表示成
`gammaMeasure p 1`。

Import：`Mathlib.Analysis.SpecialFunctions.Gamma.Basic`

- `Real.Gamma_eq_integral`、`Real.Gamma_add_one`、`Real.Gamma_pos_of_pos`；
- `Real.integral_rpow_mul_exp_neg_mul_Ioi`；
- 对应的 `Complex.Gamma_eq_integral` 和
  `Complex.integral_cpow_mul_exp_neg_mul_Ioi`。

Import：`Mathlib.Analysis.SpecialFunctions.Gamma.Beta`

- `Complex.betaIntegral`、`betaIntegral_convergent`、`betaIntegral_scaled`；
- `Complex.Gamma_mul_Gamma_eq_betaIntegral`；
- `Complex.betaIntegral_eq_Gamma_mul_div`；
- `Complex.Gamma_mul_Gamma_one_sub` 及 `Real.Gamma_mul_Gamma_one_sub`。

Gamma 分布文件目前没有封装 moments、Laplace transform、scaling 或 full-support theorem；这些
属于本项目的薄基础设施，见第 4 节。

### 3.3 积分、换元、极限与参数求导

Import：`Mathlib.MeasureTheory.Integral.Prod`

- `Integrable.integral_prod_left`、`Integrable.integral_prod_right`；
- `integral_prod`、`integral_integral`、`integral_integral_swap`。

Import：`Mathlib.MeasureTheory.Measure.Prod`

- `lintegral_prod`、`lintegral_lintegral`、`lintegral_lintegral_swap`（Tonelli）。

Import：`Mathlib.MeasureTheory.Integral.DominatedConvergence`

- `tendsto_integral_of_dominated_convergence`；
- `tendsto_integral_filter_of_dominated_convergence`；
- `tendsto_integral_filter_of_norm_le_const`。

Import：`Mathlib.Analysis.Calculus.ParametricIntegral`

- `hasDerivAt_integral_of_dominated_loc_of_lip`；
- `hasDerivAt_integral_of_dominated_loc_of_deriv_le`。

Import：`Mathlib.MeasureTheory.Integral.IntegralEqImproper`

- `integral_comp_rpow_Ioi`，允许负指数，故 \(p=-1\) 可处理反演换元；
- `integral_comp_rpow_Ioi_of_pos`、`integrableOn_Ioi_comp_rpow_iff`；
- `integral_comp_mul_left_Ioi`、`integral_comp_mul_right_Ioi`；
- `integral_comp_mul_deriv_Ioi`；
- `integral_Ioi_mul_deriv_eq_deriv_mul`。

有限区间分部积分还可使用
`Mathlib.MeasureTheory.Integral.IntervalIntegral.IntegrationByParts` 中的
`intervalIntegral.integral_mul_deriv_eq_deriv_mul` 等定理。证明无穷区间恒等式时，优先先在
\([\varepsilon,R]\) 上使用有限区间版本，再独立验证两个边界极限。

### 3.4 严格 Jensen 与对数

Import：`Mathlib.Analysis.Convex.Integral`

- `StrictConvexOn.ae_eq_const_or_map_average_lt`；
- `StrictConcaveOn.ae_eq_const_or_lt_map_average`。

Import：`Mathlib.Analysis.Convex.SpecificFunctions.Basic`

- `Real.strictConcaveOn_log_Ioi`。

Import：`Mathlib.Analysis.SpecialFunctions.Log.Basic`

- `Real.log_le_sub_one_of_pos`；
- `Real.log_lt_sub_one_of_pos`。

通用 strict-Jensen API 要求承载集合满足闭性条件，而本项目中的 \(H_\alpha\) 可任意接近
零，不能直接把像限制在固定的 \([\varepsilon,M]\)。首选做法是用
`log x ≤ x - 1` 及其严格版证明项目专用的 strict log-Jensen lemma。

### 3.5 Fourier 与 Gaussian

Import：`Mathlib.Analysis.Fourier.Inversion`

- `MeasureTheory.Integrable.fourierInv_fourier_eq`；
- `Continuous.fourierInv_fourier_eq`；
- `Real.tendsto_integral_cexp_sq_smul`；
- `Real.tendsto_integral_gaussian_smul` 及其变体。

Import：`Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral`

- `GaussianFourier.integrable_exp_neg_mul_sq`；
- `GaussianFourier.integrable_cexp_neg_mul_sq`；
- Gaussian integral formulas。

Import：`Mathlib.Analysis.SpecialFunctions.Gaussian.FourierTransform`

- root theorem `fourierIntegral_gaussian`；
- `GaussianFourier.integral_cexp_neg_mul_sq_add_real_mul_I`；
- `integral_cexp_quadratic`、`fourier_gaussian_pi`。

这些 API 足以通过 Gaussian regularization 证明 T8，无需先形式化“可积特征函数必有连续
密度”的完整 Fourier inversion 定理。

### 3.6 复幂与 Cauchy–Goursat

Import：`Mathlib.Analysis.Complex.Basic`、`Mathlib.Analysis.Complex.Convex`

- `Complex.slitPlane`、`isOpen_slitPlane`、`ofReal_mem_slitPlane`；
- `slitPlane_ne_zero`、`starConvex_one_slitPlane`。

Import：`Mathlib.Analysis.SpecialFunctions.Pow.Continuity`、
`Mathlib.Analysis.SpecialFunctions.Pow.Deriv`

- `Complex.continuousAt_cpow_const`；
- `HasDerivAt.cpow_const`、`Complex.deriv_cpow_const`。

Import：`Mathlib.Analysis.Complex.CauchyIntegral`

- `integral_boundary_rect_eq_zero_of_differentiableOn`。

mathlib 没有可直接使用的一般 residue theorem。本项目的 complex beta-ray 公式应以矩形
Cauchy–Goursat 为首选证明路线，而不是在 Lean 中复刻原稿的一句“由留数定理”。

### 3.7 已有 Cauchy 分布

Import：`Mathlib.Probability.Distributions.Cauchy`

- `ProbabilityTheory.cauchyPDFReal`、`cauchyMeasure`；
- `integral_cauchyPDFReal_eq_one`、`integrable_cauchyPDFReal`；
- `instIsProbabilityMeasure_cauchyMeasure`。

这只覆盖通常的 Cauchy 分布，即本项目的 \(\alpha=2\) 端点。该文件没有现成的 Cauchy
特征函数公式，也没有稳定性或 SD 定理。

## 4. 必须自行搭建的基础设施

全文检索上述 mathlib revision 后，没有找到 SD、ID、Lévy triplet、Lévy–Khintchine、
conditionally negative definite、BDLP、HCM/GGC/Thorin/Bondesson、beta-prime 或 Gamma-ratio
的现成理论。不能把 `LevyConvergence` 误当成 Lévy–Khintchine 基础设施。

建议自建如下模块；“薄”表示主要包装已有 mathlib，“厚”表示包含新的理论层。

| 模块 | 厚度 | 应提供的内容 |
|---|---:|---|
| `AlphaCauchy/Parameters` | 薄 | 参数结构 `1 < α ∧ α < 2`，\(c_\alpha\) 的符号、sin 非零、rpow 基本式 |
| `AlphaCauchy/Kernel` | 中 | \(D_\alpha,H_\alpha,h_\alpha\)；正性、连续性、可测性、局部/端点界及可积性 |
| `AlphaCauchy/LaplaceRepresentation` | 中 | 抽象 Laplace 函数 \(\phi_\alpha\)、正性、连续性、参数下求导、缩放后的 \(F_\alpha\) |
| `AlphaCauchy/LaplaceBounds` | 厚 | \(q,J,F,\log F\) 的两端估计、连续性、有界性与可积性；不用 Watson/HL 黑箱 |
| `Probability/GammaMoments` | 薄 | `gammaMeasure a r` 的 moments，特别是 \(E\Gamma_{1+\alpha}=1+\alpha\)，以及有限高阶矩 |
| `Probability/GammaSupport` | 薄 | Gamma measure 在 \((0,\infty)\) 上与 Lebesgue measure 的零集关系、每个非空正区间有正测度、非退化性 |
| `Probability/GammaScaling` | 中 | \(\int_0^\infty E[g(U/z)]dz=E[U]\int_0^\infty g(y)y^{-2}dy\) 及绝对可积版本 |
| `Analysis/StrictLogJensen` | 中 | 正随机变量的项目专用严格 log-Jensen；等号当且仅当 a.e. 常数 |
| `Analysis/ComplexBetaRay` | 厚 | complex beta-ray 公式、分支约定和所有 improper-limit 估计 |
| `AlphaCauchy/LogCancellation` | 中 | 对数积分的绝对可积性、分部积分、rpow 换元及 \(K_\alpha=0\) |
| `Probability/IntegrableCharFun` | 中 | Gaussian regularization 与 `0 ≤ (∫ t, charFun μ t).re` |
| `Probability/SelfDecomposable/Basic` | 中 | 用 dilation + convolution 定义实直线概率测度的 SD；基本闭包和 charFun 表述 |
| `Probability/SelfDecomposable/BackgroundDriving` | 很厚 | SD \(\Rightarrow\) 背景驱动 Lévy 指数；对称 LK；有界指数 \(\Rightarrow\) 有限 Lévy 测度；T9 |
| `AlphaCauchy/Basic` | 中 | \(\alpha\)-Cauchy pdf、归一化、对称性、对应 probability measure |
| `AlphaCauchy/CharacteristicFunction` | 很厚 | 真实 pdf 的 charFun 与 Wang Laplace 表示的识别 |
| `AlphaCauchy/Main` | 薄 | 只组装已经闭合的 theorem，不承载技术估计 |

### 4.1 complex beta-ray 的首选实现

令 \(0<s<1\)、\(|\theta|<\pi\)，并考虑

\[
  g(w)=\frac{e^{sw}}{1+e^w}.
\]

在矩形 \([-R,R]\times[0,\theta]\) 上应用
`integral_boundary_rect_eq_zero_of_differentiableOn`。两条竖边分别由
\(O(e^{s x})\) 和 \(O(e^{-(1-s)x})\) 控制，令 \(R\to\infty\) 后得到

\[
 e^{i\theta}\int_0^\infty
   \frac{u^{s-1}}{1+e^{i\theta}u}\,du
 =e^{i(1-s)\theta}\frac{\pi}{\sin(\pi s)}.
\]

取 \(s=1-1/\alpha\)、\(\theta=\pm\pi\alpha/2\)，右侧分别为纯虚数且互为相反数，
从而得到 T4 所需的抵消。此路线只依赖矩形 Cauchy–Goursat；备选路线是在
`Complex.slitPlane` 上证明参数积分解析，再用 identity theorem 从正实轴延拓，但局部一致控制
通常更重。

### 4.2 可积特征函数的首选实现

对 \(\varepsilon>0\) 定义

\[
 I_\varepsilon=\int_{\mathbb R}\widehat\mu(t)e^{-\varepsilon t^2}\,dt.
\]

展开 `charFun`，由 Fubini 和 `fourierIntegral_gaussian` 得

\[
 I_\varepsilon
 =\sqrt{\pi/\varepsilon}\int_{\mathbb R}
   e^{-x^2/(4\varepsilon)}\,\mu(dx)\ge0.
\]

若 `charFun μ` 可积，则以其范数为支配函数，令 \(\varepsilon\downarrow0\) 并用 DCT，得到

```lean
0 ≤ (∫ t : ℝ, MeasureTheory.charFun μ t).re
```

复数没有顺序，所以 theorem 接口必须取 `.re`，或同时给出积分虚部为零。

### 4.3 strict log-Jensen 的首选实现

不要直接强行应用现有 strict-Jensen theorem。令 \(m=E[X]>0\)，对 \(Y=X/m\) 逐点应用

\[
  \log Y\le Y-1,
\]

并使用 `Real.log_lt_sub_one_of_pos` 控制等号情形。若积分等号成立，则 \(Y=1\) a.e.；Gamma
密度在每个正区间严格为正、且 \(H_\alpha\) 连续非恒定，与此矛盾。通用 lemma 至少应要求：

- `0 < X` a.e.；
- `Integrable X` 与 `Integrable (log ∘ X)`；
- 底层测度为 probability；
- `X` 不是 a.e. 常数。

## 5. 建议的 theorem 接口

以下是接口草案；名称和参数顺序可在首次编译时调整，不声称当前代码片段已经可编译。

```lean
def alphaCauchyDenom (α y : ℝ) : ℝ :=
  y ^ (2 * α) + 2 * Real.cos (Real.pi * α / 2) * y ^ α + 1

def alphaCauchyKernel (α y : ℝ) : ℝ :=
  (alphaCauchyDenom α y)⁻¹

theorem logDenom_integrable
    (hα : α ∈ Set.Ioo (1 : ℝ) 2) :
    IntegrableOn (fun y ↦ |Real.log (alphaCauchyDenom α y)| / y ^ 2)
      (Set.Ioi 0) := by
  ...

theorem logDenom_integral_eq_zero
    (hα : α ∈ Set.Ioo (1 : ℝ) 2) :
    ∫ y in Set.Ioi (0 : ℝ),
      Real.log (alphaCauchyDenom α y) / y ^ 2 = 0 := by
  ...

theorem strict_log_jensen
    [IsProbabilityMeasure μ]
    (hXpos : ∀ᵐ x ∂μ, 0 < X x)
    (hX : Integrable X μ)
    (hlogX : Integrable (fun x ↦ Real.log (X x)) μ)
    (hnonconst : ¬ ∃ c, X =ᵐ[μ] fun _ ↦ c) :
    Real.log (∫ x, X x ∂μ) > ∫ x, Real.log (X x) ∂μ := by
  ...

theorem integral_re_charFun_nonneg
    (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hμ : Integrable (MeasureTheory.charFun μ)) :
    0 ≤ (∫ t : ℝ, MeasureTheory.charFun μ t).re := by
  ...

theorem alphaCauchyJ_not_charFun
    (hα : α ∈ Set.Ioo (1 : ℝ) 2) :
    ¬ ∃ μ : Measure ℝ,
      IsProbabilityMeasure μ ∧
      ∀ t : ℝ,
        MeasureTheory.charFun μ t = (alphaCauchyJ α t : ℂ) := by
  ...
```

SD 的定义建议直接从卷积因子化开始，而不是先定义 Lévy 过程：

```lean
def IsSelfDecomposable (μ : Measure ℝ) : Prop :=
  IsProbabilityMeasure μ ∧
  ∀ c ∈ Set.Ioo (0 : ℝ) 1, ∃ ρ : Measure ℝ,
    IsProbabilityMeasure ρ ∧
    μ = (μ.map fun x ↦ c * x).conv ρ
```

随后以一个中间 predicate 隔离背景驱动数据，例如
`HasSymmetricBackgroundDrivingExponent μ q`。这样可以先无条件完成
`bounded_background_exponent_implies_J_charFun`，再单独完成最昂贵的
`IsSelfDecomposable → HasSymmetricBackgroundDrivingExponent`。

## 6. 建议目录结构

```text
formalization/
├── README.md
├── lean-toolchain
├── lakefile.toml
├── AlphaCauchy.lean
├── AlphaCauchy/
│   ├── Parameters.lean
│   ├── Kernel.lean
│   ├── Basic.lean
│   ├── CharacteristicFunction.lean
│   ├── LaplaceRepresentation.lean
│   ├── LaplaceBounds.lean
│   ├── LogCancellation.lean
│   └── Main.lean
├── Analysis/
│   ├── ComplexBetaRay.lean
│   └── StrictLogJensen.lean
└── Probability/
    ├── GammaMoments.lean
    ├── GammaSupport.lean
    ├── GammaScaling.lean
    ├── IntegrableCharFun.lean
    └── SelfDecomposable/
        ├── Basic.lean
        └── BackgroundDriving.lean
```

`AlphaCauchy.lean` 只作公开入口。`AlphaCauchy/Main.lean` 不允许包含长解析证明，也不应让
analytic core import `SelfDecomposable`，否则容易形成循环依赖。

## 7. 里程碑与验收标准

### M0：工程骨架

- 固定 Lean/mathlib revision；
- 上述文件均可被 Lake 找到并 import；
- CI 执行 `lake build`；
- 被 `AlphaCauchy/Main.lean` import 的代码零 `sorry`、零 `admit`、零项目自设公理。

### M1：\(\alpha=3/2\) 的 kernel pilot

- 证明 \(D_{3/2}>0\)；
- 完成 \(H_{3/2}\) 和 \(\log D_{3/2}/y^2\) 的端点界及绝对可积性；
- 不使用数值积分或浮点近似作为证明。

### M2：\(\alpha=3/2\) 的 Laplace bounds

- \(\phi,F,q,J\) 定义闭合；
- 导数移入积分的所有可测性和支配条件闭合；
- 证明 \(q(0+)=0\)、\(q(\infty)=5/2\)、\(J\in L^1\)；
- 不依赖 Watson lemma 或 Hardy–Littlewood Tauberian theorem。

### M3：complex cancellation

- 独立编译 complex beta-ray lemma；
- 明确 principal branch 和 \(|\theta|<\pi\)；
- 所有矩形竖边极限均有显式估计；
- 推出 \(K_{3/2}=0\)。

### M4：Gamma scaling 与严格 Jensen

- Gamma moments/support lemmas 独立可复用；
- Fubini 前先证明绝对可积；
- 严格性不以“显然非恒定”收尾，而有 a.e. 非退化证明；
- 得到 \(\int_0^\infty J_{3/2}<0\)。

### M5：特征函数障碍

- `integral_re_charFun_nonneg` 对一般实线概率测度成立；
- Gaussian regularization 的 Fubini 与 DCT 条件全部闭合；
- 得到无 `sorry` 的 `alphaCauchyJ_not_charFun`（先对 \(3/2\)）。

### M6：推广到 \(1<\alpha<2\)

- 移除所有 \(3/2\) 特化假设；
- analytic obstruction 对整个开区间成立；
- 对 \(\alpha\to1,2\) 不要求统一常数，只要求每个固定参数的合法估计。

### M7：SD/BDLP 桥梁

- 完成 `IsSelfDecomposable` 的 charFun 版本；
- 最终版本不依赖未证明的 LK/BDLP axiom；
- 有界背景指数导出有限 Lévy 测度；
- 使用“原点补原子”修复归一化，且 generic theorem 明确假设 \(0<L\)。

### M8：真实 \(\alpha\)-Cauchy 分布识别与主定理

- pdf 的归一化、对称性和 probability instance 闭合；
- `alphaCauchy_charFun_laplace` 闭合并注明对应 Wang, Lemma 2.7；
- 组装 `1 < α → α < 2 → ¬ IsSelfDecomposable (alphaCauchyMeasure α)`；
- `AlphaCauchy/Main.lean` 零 `sorry`、零 `admit`、零项目自设公理。

### M9：端点和应用（不阻塞首个交付）

- \(\alpha=2\)：标准 Cauchy 的特征函数、缩放稳定性和 SD；
- \(\alpha>2\)：ID 基础设施及 Wang 非 ID 结论；
- 首次击中时间分布的识别和非 SD 推论。

## 8. `version-1` 在形式化前必须处理的证明义务

这些不是 Lean 的语法问题，而是原稿中需要显式补足或修正的数学步骤。

1. **Lévy 测度归一化。** `SD2.tex` 的 Fatou 步骤只给
   \(\nu(\mathbb R)\le L\)，随后却把它当成 \(\nu(\mathbb R)=L\)。不需要额外证明等号；应定义

   \[
     \mu=\left(1-\frac{\nu(\mathbb R)}L\right)\delta_0+rac1L\nu.
   \]

   则 \(\mu\) 是概率测度且
   \(\widehat\mu(z)=1-q(z)/L\)。详见
   [`../version-1/remarks/levy-measure-normalization.tex`](../version-1/remarks/levy-measure-normalization.tex)。
   抽象 lemma 必须额外假设 `0 < L`。

2. **原点处不可全局求导。** 对 \(1<\alpha<2\)，\(\Psi_\alpha\) 在零点一般不可微。Lean 中应在
   `z ≠ 0` 或 `0 < z` 上定义导数表达式，再规定 \(q_\alpha(0)=0\) 并证明连续延拓，不能把
   `deriv Ψ 0` 当作已有量。

3. **渐近系数缺少因子 2。** `SD2.tex` 第 369 行的首项应为

   \[
   -2\cos(\pi\alpha/2)
   \frac{\Gamma(1+2\alpha)}{\Gamma(1+\alpha)}z^{-\alpha}.
   \]

   这不改变边界极限；形式化时最好只证明所需的 `O(z⁻ᵅ)`，避免引入无用的精确系数。

4. **端点渐近不自动推出全局结论。** “两端有渐近”到“全局有界/可积”之间还需连续性、
   紧区间有界以及分段积分。

5. **strict Jensen 的严格性。** 必须证明
   \(H_\alpha(\Gamma_{1+\alpha}/z)\) 不是 a.e. 常数。可用 Gamma 密度在
   \((0,\infty)\) 严格为正、\(H_\alpha\) 连续且非恒定。

6. **Fubini 的绝对可积性。** \(\log D_\alpha\) 会变号；先证明
   \(\int_0^\infty|\log D_\alpha(y)|y^{-2}dy<\infty\)，之后才能交换积分。

7. **无穷区间分部积分。** 必须在 \([\varepsilon,R]\) 上证明，再分别令
   \(\varepsilon\downarrow0\)、\(R\to\infty\)；不得把无穷端边界项形式上直接删掉。

8. **复幂分支。** beta-ray lemma 必须固定 principal `Complex.cpow` 分支，并证明所有参数保持在
   分支域内。原稿的“由留数定理”不是可直接导入的 Lean 事实。

9. **两个外部桥梁必须独立命名。** Wang 的 Laplace 公式和 Jurek–Vervaat/Sato 的 BDLP
   characterization 都应各自成为带准确文献 docstring 的 theorem；引用文献不能代替 Lean proof。

## 9. 编码和文献规范

- 主分支中由 `AlphaCauchy/Main.lean` 可达的文件不允许 `sorry`、`admit`、项目自设
  `axiom`，或把待证结论包装成未经证明的 typeclass/structure 字段。
- 探索性 placeholder 如确有必要，放在不被主入口 import 的 `Scratch/`，并附 issue 编号。
- 每个核心 lemma 的 docstring 标明其来源类别：`[mathlib]`、`[literature]`、
  `[new derivation]` 或 `[gap repair]`。
- 外部结果至少记录作者、题名、年份、定理/命题编号和仓库内文献路径；不要只写“well known”。
- 数值实验只能用于发现 conjecture 或调试界，不能进入 theorem 的证明依赖。
- 尽量窄化 import；先证明可复用的小 lemma，再在 `Main` 中组装。
- rpow、Fourier 和 Gamma 的参数约定必须写进 docstring，尤其区分 Gamma 的 rate/scale。
- 每个里程碑以 `lake build` 和零 `sorry` 检查为验收，不以文件存在或 theorem statement 存在为验收。

## 10. 风险排序与实施顺序

| 风险 | 工作项 | 原因 |
|---|---|---|
| 红 | SD/BDLP/Lévy–Khintchine 桥梁 | mathlib 基本空白，理论基础设施最大 |
| 红 | 真实 \(\alpha\)-Cauchy charFun 的 Laplace 识别 | 本身需要非平凡 Fourier/复分析 |
| 红 | complex beta-ray | 需自行处理矩形极限、分支与 Mellin/Beta 识别 |
| 黄 | Laplace 两端界、参数下求导 | 证明义务多，但可由直接估计和现有 DCT API 完成 |
| 黄 | Gaussian charFun obstruction | 复积分/Fubini 较繁，但所需 Gaussian API 已齐全 |
| 黄 | strict Jensen 非退化 | 需 Gamma full-support 薄层和 a.e. 等号分析 |
| 绿 | kernel 代数、正性、局部可积性 | 主要为 rpow/三角代数与比较判别 |
| 绿 | Gamma moments/scaling | 可由现有密度与 Gamma integral 机械推出 |

推荐执行顺序是 M0 → M1 → M3 → M4 → M2 → M5 → M6，并行准备 M7 和 M8。这样最先
交付的是数学上最创新、同时与缺失的 Lévy 基础设施解耦的 analytic obstruction。

## 11. 主要数学来源

- Min Wang, *Infinite divisibility of \(\alpha\)-Cauchy distributions*, arXiv:2512.23164,
  v3 (2026-04-15)，特别是 Lemma 2.7；仓库副本：
  [`../literature/ECP2604-002R1A0.pdf`](../literature/ECP2604-002R1A0.pdf)。
- K. Yano, Y. Yano and M. Yor, *On the Laws of First Hitting Times of Points for
  One-Dimensional Symmetric Stable Lévy Processes*, Séminaire de Probabilités XLII,
  LNM 1979 (2009), 187–227，特别是 Remark 2.9 和 Proposition 2.11。
- Z. J. Jurek and W. Vervaat, *An Integral Representation for Self-Decomposable
  Banach Space Valued Random Variables*, Z. Wahrscheinlichkeitstheorie verw. Gebiete
  62 (1983), 247–262, DOI 10.1007/BF00538800。
- K.-I. Sato, *Lévy Processes and Infinitely Divisible Distributions*, Cambridge
  Studies in Advanced Mathematics 68, Cambridge University Press, 1999，特别是
  Theorems 8.1、17.5 和 Exercise 18.1（对应当前原稿采用的 BDLP/LK 步骤）。

在 Lean 文件中引用这些来源时，应同时写出具体 theorem 对应的数学陈述；书目元数据可与
`../version-0/references.bib` 保持一致。
