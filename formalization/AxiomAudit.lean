import GGC.FiniteGamma
import GGC.Thorin
import GGC.Reduction
import GGC.Foundations.RandomMeasure
import GGC.Foundations.Sampling
import GGC.Foundations.QuantileContinuity
import GGC.GammaAnalysis
import GGC.BetaAnalysis
import GGC.Foundations.Posterior
import GGC.StieltjesMean
import GGC.StieltjesPhase
import GGC.StieltjesContinuity
import GGC.Foundations.PoissonPairing
import GGC.BetaPosterior
import GGC.ExponentialTilt
import GGC.GammaDirichlet
import GGC.GammaDirichletTangent
import GGC.RateRealization
import GGC.Palm
import GGC.LogRate.Kernel
import GGC.LogRate.JumpMeasure
import GGC.LogRate.Resolvent
import GGC.LogRate.JumpCalculus
import GGC.LogRate.DriftBounds
import GGC.LogRate.PhaseGenerator
import GGC.LogRate.CanonicalGenerator
import GGC.LogRate.CanonicalBounds
import GGC.LogRate.GeneratorResolvent
import GGC.LogRate.SampleContinuity
import GGC.LogRate.Continuity
import GGC.LogRate.EulerTightness
import GGC.LogRate.EulerConsistency
import GGC.LogRate.Existence
import GGC.Identification.LogValueContinuity
import GGC.Identification.TangentSpaceTime
import GGC.Identification.TestExtension
import GGC.Identification.LaplaceEvolution
import GGC.Identification.LogTransport
import GGC.Identification.DynamicIdentification
import main
import External.Bondesson
import External.James
import External.Sethuraman
import External.SSV

/-!
# Audit of the current statement and external boundary

This audit builds the statement, proof modules, elementary sanity lemmas and
full external contracts. It checks the complete type and actual transitive
axioms of `GGC.ggc_rpow`, relative to the whitelist in README.md.
Printing the axioms of the proposition definition alone would not certify its truth.
-/

#print GGC.PosReal
#print GGC.NonnegLaw
#print GGC.gammaLaw
#print GGC.finiteGammaLaw
#print GGC.IsFiniteGammaConvolution
#print GGC.ThorinAdmissible
#print GGC.ThorinData
#print GGC.laplace
#print GGC.thorinLaplace
#print GGC.IsGGC
#print GGC.HasThorinRepresentation
#print GGC.ThorinEndpointAdmissible
#print GGC.finiteThorinMeasure
#print GGC.finiteThorinData
#print GGC.powerLaw
#print GGC.GGCPowerClosure

-- These are proved local results. The conditional assembly still exposes its
-- finite-input premise, and is deliberately not named `ggc_rpow`.
#check GGC.laplace_integrable
#check GGC.laplace_pos
#check GGC.laplace_finiteGammaLaw
#check GGC.isGGC_iff_mem_closure
#check GGC.isGGC_of_tendsto
#check GGC.isGGC_powerLaw_of_finiteGamma
#check GGC.ggcPowerClosure_of_finiteGamma
#check GGC.nonnegLaw_eq_of_laplace_eq
#check GGC.thorinAdmissible_iff_endpoint
#check GGC.ThorinAdmissible.integrable_log
#check GGC.isGGC_iff_hasThorinRepresentation
#check GGC.isGGC_diracLaw
#check GGC.existsUnique_law_thorinLaplace

#print GGC.External.Bondesson.thorin_realization
#print GGC.External.Bondesson.weak_closure
#print GGC.External.Bondesson.finite_atomic_approximation

#print axioms GGC.powerLaw_toMeasure
#print axioms GGC.powerLaw_one
#print axioms GGC.hasThorinRepresentation_diracLaw
#print axioms GGC.isGGC_powerLaw_one
#print axioms GGC.powerLaw_diracLaw
#print axioms GGC.power_pushforward_tendsto
#print axioms GGC.finiteGammaLaw_zero
#print axioms GGC.finiteGammaLaw_one
#print axioms GGC.isGGC_gammaLaw
#print axioms GGC.isGGC_zero
#print axioms GGC.IsGGC
#print axioms GGC.GGCPowerClosure

#print axioms GGC.laplace_integrand_le_one
#print axioms GGC.laplace_integrable
#print axioms GGC.laplace_zero
#print axioms GGC.laplace_pos
#print axioms GGC.laplace_le_one
#print axioms GGC.laplace_antitone
#print axioms GGC.laplace_diracLaw
#print axioms GGC.integral_gammaLaw
#print axioms GGC.integral_gammaPDFReal
#print axioms GGC.laplace_gammaLaw
#print axioms GGC.laplace_gammaLaw_eq_exp
#print axioms GGC.finiteGamma_laplace_integrable
#print axioms GGC.laplace_finiteGammaLaw_eq_prod
#print axioms GGC.laplace_finiteGammaLaw
#print axioms GGC.isGGC_iff_mem_closure
#print axioms GGC.isGGC_of_tendsto
#print axioms GGC.isGGC_powerLaw_of_finiteGamma
#print axioms GGC.ggcPowerClosure_of_finiteGamma

#print axioms GGC.measure_eq_of_laplace_nat_eq
#print axioms GGC.nonnegLaw_eq_of_laplace_eq
#print axioms GGC.ThorinAdmissible.integrable_log
#print axioms GGC.ThorinAdmissible.measure_le_lt_top
#print axioms GGC.ThorinAdmissible.isLocallyFiniteMeasure
#print axioms GGC.thorinAdmissible_iff_endpoint
#print axioms GGC.integrable_finiteThorinMeasure
#print axioms GGC.integral_finiteThorinMeasure
#print axioms GGC.hasThorinRepresentation_finiteGammaLaw
#print axioms GGC.IsGGC.hasThorinRepresentation
#print axioms GGC.HasThorinRepresentation.isGGC
#print axioms GGC.isGGC_iff_hasThorinRepresentation
#print axioms GGC.isGGC_diracLaw
#print axioms GGC.exists_law_thorinLaplace
#print axioms GGC.existsUnique_law_thorinLaplace

#print axioms GGC.External.Bondesson.thorin_realization
#print axioms GGC.External.Bondesson.weak_closure
#print axioms GGC.External.Bondesson.finite_atomic_approximation

-- M2/M3 construction: these are local results, not milestone completion.
#print GGC.RandomMeasure.gammaShapeLaw
#print GGC.RandomMeasure.dirichletLaw
#print GGC.RandomMeasure.Partition
#print GGC.RandomMeasure.IsDirichletProcess
#print GGC.digamma
#print GGC.betaLaw
#print GGC.LogRate.correctionKernel
#print GGC.LogRate.jumpMeasure
#print GGC.LogRate.jumpSecondMoment

#check GGC.RandomMeasure.dirichletLaw_simplex
#check GGC.RandomMeasure.Partition.exists_nonzero_shape
#check GGC.RandomMeasure.IsDirichletProcess.map
#check GGC.integral_self_mul_log_gammaLaw
#check GGC.integral_neg_log_gammaLaw_le
#check GGC.digamma_boundedOn_Icc
#check GGC.LogRate.integral_abs_correctionKernel
#check GGC.LogRate.integrable_sq_jumpMeasure
#check GGC.LogRate.resolvent_cancellation
#check GGC.LogRate.integral_abs_scaled_resolventBracket

#print axioms GGC.RandomMeasure.gammaShapeLaw_nonneg
#print axioms GGC.RandomMeasure.gammaShapeLaw_pos
#print axioms GGC.RandomMeasure.dirichletLaw_zero_coordinate
#print axioms GGC.RandomMeasure.dirichletLaw_simplex
#print axioms GGC.RandomMeasure.Partition.exists_nonzero_shape
#print axioms GGC.RandomMeasure.measurable_partitionEval
#print axioms GGC.RandomMeasure.measurable_probability_map
#print axioms GGC.RandomMeasure.IsDirichletProcess.map
#print axioms GGC.integrableOn_gamma_log_kernel
#print axioms GGC.hasDerivAt_Gamma_integral
#print axioms GGC.integrable_log_gammaLaw
#print axioms GGC.integrable_self_mul_log_gammaLaw
#print axioms GGC.integral_log_gammaLaw
#print axioms GGC.integral_self_mul_log_gammaLaw
#print axioms GGC.continuousOn_digamma
#print axioms GGC.digamma_apply
#print axioms GGC.digamma_eq_re_complex
#print axioms GGC.digamma_boundedOn_Icc
#print axioms GGC.integrableOn_rpow_neg_log
#print axioms GGC.integral_rpow_neg_log
#print axioms GGC.integral_neg_log_gammaLaw_le
#print axioms GGC.gammaNegativeLogBound_boundedOn_Icc
#print axioms GGC.LogRate.measurable_correctionKernel
#print axioms GGC.LogRate.correctionKernel_nonpos
#print axioms GGC.LogRate.correctionKernel_nonneg
#print axioms GGC.LogRate.integrableOn_correctionKernel
#print axioms GGC.LogRate.integral_correctionKernel_Ioo_zero_one
#print axioms GGC.LogRate.integral_correctionKernel_Ioi_one
#print axioms GGC.LogRate.integral_abs_correctionKernel
#print axioms GGC.LogRate.continuousAt_correctionKernel_one
#print axioms GGC.LogRate.jumpDensity_eq_sinh
#print axioms GGC.LogRate.jumpDensity_neg
#print axioms GGC.LogRate.jumpMeasure_singleton
#print axioms GGC.LogRate.integrable_sq_jumpMeasure
#print axioms GGC.LogRate.resolvent_cancellation
#print axioms GGC.LogRate.integrableOn_resolventBracket
#print axioms GGC.LogRate.integral_abs_resolventBracket
#print axioms GGC.LogRate.integral_abs_scaled_resolventBracket
#print axioms GGC.LogRate.integrableOn_scaled_resolventBracket
#print axioms GGC.LogRate.integrableOn_compensated_resolvent

-- Continuing M2/M3: actual laws and local estimates, with explicit remaining
-- phase/Dirichlet inputs. The generic phase generator is not the final generator.
#print GGC.RandomMeasure.atomMixture
#print GGC.RandomMeasure.atomMixtureLaw
#print GGC.stieltjesMean
#print GGC.posteriorMixtureLaw
#print GGC.exponentialTilt
#print GGC.gammaDirichletLaw
#print GGC.samplingJoint
#print GGC.posteriorJoint
#print GGC.LogRate.phaseDrift
#print GGC.LogRate.phaseAcceptance
#print GGC.LogRate.phaseGenerator
#print GGC.External.James.markov_krein
#print GGC.External.James.posterior_palm_nonneg
#print GGC.External.James.beta_atom_posterior

#check GGC.tiltedLaw_eq_gammaDirichlet
#check GGC.posteriorMixture_isDirichlet
#check GGC.posterior_palm
#check GGC.LogRate.phaseDrift_bounds
#check GGC.LogRate.integral_abs_sampleDriftOffset_le
#check GGC.LogRate.phaseGenerator_sq_le

#print axioms GGC.RandomMeasure.measurable_probability_integral
#print axioms GGC.RandomMeasure.measurable_atomMixture
#print axioms GGC.RandomMeasure.integrable_atomMixture
#print axioms GGC.RandomMeasure.integral_atomMixture
#print axioms GGC.RandomMeasure.measurable_atomMixture_sample
#print axioms GGC.RandomMeasure.measurable_atomMixtureLaw
#print axioms GGC.integrableOn_beta_log_kernel
#print axioms GGC.integral_beta_log_kernel
#print axioms GGC.integrable_neg_log_betaLaw
#print axioms GGC.integral_neg_log_betaLaw
#print axioms GGC.continuousOn_betaNegativeLogMoment
#print axioms GGC.betaNegativeLogMoment_boundedOn_Icc
#print axioms GGC.measurable_stieltjesMean
#print axioms GGC.integrable_stieltjesMean
#print axioms GGC.stieltjesMean_pos
#print axioms GGC.stieltjesMean_le
#print axioms GGC.stieltjesMean_atomMixture
#print axioms GGC.atomMixture_stieltjesMean_bounds
#print axioms GGC.atomMixture_neg_log_bounds
#print axioms GGC.measurable_unitWeight
#print axioms GGC.unitWeight_val_of_mem
#print axioms GGC.betaLaw_mem_Ioo
#print axioms GGC.betaWeightLaw_pos
#print axioms GGC.betaWeightLaw_map_val
#print axioms GGC.integrable_neg_log_betaWeightLaw
#print axioms GGC.integral_neg_log_betaWeightLaw
#print axioms GGC.measurable_posteriorLog
#print axioms GGC.posteriorLog_nonneg
#print axioms GGC.integrable_posteriorLog
#print axioms GGC.integral_posteriorLog_bounds
#print axioms GGC.integral_exponentialTilt
#print axioms GGC.exponentialTilt_eq_tilted
#print axioms GGC.laplace_exponentialTilt
#print axioms GGC.laplace_gammaDirichletLaw
#print axioms GGC.dirichletMean_laplace
#print axioms GGC.tiltedLaw_eq_gammaDirichlet
#print axioms GGC.posteriorMixture_isDirichlet
#print axioms GGC.samplingJoint_swap_eq_posteriorJoint
#print axioms GGC.integrable_posteriorJoint_iff
#print axioms GGC.posterior_palm
#print axioms GGC.LogRate.abs_taylorRemainder_le
#print axioms GGC.LogRate.integrable_compensatedJump
#print axioms GGC.LogRate.abs_compensatedJump_le
#print axioms GGC.LogRate.compensatedJump_nonneg_at_min
#print axioms GGC.LogRate.compensatedJump_sq
#print axioms GGC.LogRate.compensatedJump_sq_le
#print axioms GGC.LogRate.integrable_phaseCorrection
#print axioms GGC.LogRate.phaseCorrection_bounds
#print axioms GGC.LogRate.abs_phaseCorrection_le
#print axioms GGC.LogRate.measurable_scaledPhaseCorrection
#print axioms GGC.LogRate.integrable_scaledPhaseCorrection
#print axioms GGC.LogRate.phaseDrift_bounds
#print axioms GGC.LogRate.driftBound_nonneg
#print axioms GGC.LogRate.abs_phaseDrift_sub_le
#print axioms GGC.LogRate.driftBound_boundedOn_Icc
#print axioms GGC.LogRate.integrable_sampleDriftOffset
#print axioms GGC.LogRate.integral_abs_sampleDriftOffset_le
#print axioms GGC.LogRate.measurable_phaseAcceptance
#print axioms GGC.LogRate.phaseAcceptance_bounds
#print axioms GGC.LogRate.integrable_phaseGenerator_jumps
#print axioms GGC.LogRate.phaseGenerator_nonneg_at_min
#print axioms GGC.LogRate.phaseGenerator_sq_le
#print axioms GGC.External.James.markov_krein
#print axioms GGC.External.James.posterior_palm_nonneg
#print axioms GGC.External.James.beta_atom_posterior

-- Canonical integer-boundary phase and parameter-measurable posterior generator.
#print GGC.complexStieltjesMean
#print GGC.phaseHeight
#print GGC.phaseApprox
#print GGC.stieltjesPhase
#print GGC.LogRate.canonicalAcceptance
#print GGC.LogRate.canonicalDrift
#print GGC.LogRate.canonicalGenerator
#check GGC.phase_jointlyMeasurable
#check GGC.stieltjesPhase_bounds
#check GGC.posteriorMixtureLaw_jointlyMeasurable
#check GGC.LogRate.canonicalGenerator_compactTest_bound
#check GGC.LogRate.integrable_canonicalGenerator_compactTest
#print axioms GGC.RandomMeasure.measurable_probability_map_parameterized
#print axioms GGC.RandomMeasure.atomMixtureLaw_jointlyMeasurable
#print axioms GGC.measurable_betaLaw_one
#print axioms GGC.measurable_betaWeightLaw
#print axioms GGC.posteriorMixtureLaw_jointlyMeasurable
#print axioms GGC.measurable_complexStieltjesMean
#print axioms GGC.complexStieltjesMean_ofReal
#print axioms GGC.integrable_complexStieltjesMean
#print axioms GGC.complexStieltjesMean_eq_resolventTransform
#print axioms GGC.norm_complexStieltjesMean_le
#print axioms GGC.complexStieltjesMean_im_neg
#print axioms GGC.complexStieltjesMean_ne_zero
#print axioms GGC.phaseHeight_pos
#print axioms GGC.phaseApprox_bounds
#print axioms GGC.measurable_phaseApprox
#print axioms GGC.phase_jointlyMeasurable
#print axioms GGC.stieltjesPhase_bounds
#print axioms GGC.integrable_stieltjesPhase_mul
#print axioms GGC.abs_integral_stieltjesPhase_mul_le
#print axioms GGC.complexStieltjesMean_dirac
#print axioms GGC.phaseApprox_dirac_self
#print axioms GGC.stieltjesPhase_dirac_self
#print axioms GGC.LogRate.jumpMeasure_sigmaFinite
#print axioms GGC.LogRate.scaledPhaseCorrection_jointlyMeasurable
#print axioms GGC.LogRate.phaseDrift_jointlyMeasurable
#print axioms GGC.LogRate.phaseAcceptance_jointlyMeasurable
#print axioms GGC.LogRate.phaseGenerator_jointlyMeasurable
#print axioms GGC.LogRate.canonicalAcceptance_jointlyMeasurable
#print axioms GGC.LogRate.canonicalDrift_jointlyMeasurable
#print axioms GGC.LogRate.canonicalGenerator_jointlyMeasurable
#print axioms GGC.LogRate.canonicalAcceptance_bounds
#print axioms GGC.LogRate.canonicalDrift_bounds
#print axioms GGC.LogRate.canonicalGenerator_nonneg_at_min
#print axioms GGC.LogRate.integrable_canonicalGenerator_jumps
#print axioms GGC.LogRate.canonicalGenerator_sq_le
#print axioms GGC.LogRate.canonicalGenerator_compactTest_bound
#print axioms GGC.LogRate.integrable_canonicalGenerator_compactTest

-- M2 completion: actual derivatives, measurable DP realizations and canonical phase.
-- Printing the external contracts checks their complete types, not their proofs.
#print GGC.External.Sethuraman.stick_breaking
#print GGC.External.SSV.RealPhase
#print GGC.External.SSV.Phase
#print GGC.External.SSV.phase_representation
#print GGC.powerTangent
#check GGC.normalized_powerTangent
#check GGC.mixed_log_powerLaplace_commute
#check GGC.powerTangent_eq_deriv_mul_tiltedXLog
#check GGC.exists_dirichletProcess
#check GGC.ae_all_parameters_stick_realization
#check GGC.ratePosteriorSample_isDirichlet
#check GGC.phase_anchor_one
#check GGC.phase_unique_ae

#print axioms GGC.damped_pow_bound
#print axioms GGC.damped_log_pow_bound
#print axioms GGC.integrable_damped_pow
#print axioms GGC.integrable_damped_log_pow
#print axioms GGC.hasDerivAt_dampedMoment
#print axioms GGC.hasDerivAt_dampedLogMoment
#print axioms GGC.hasDerivAt_laplace
#print axioms GGC.tiltedXLog_eq_integral
#print axioms GGC.integrable_self_exponentialTilt
#print axioms GGC.integrable_self_mul_log_exponentialTilt
#print axioms GGC.hasDerivAt_tiltedXLog
#print axioms GGC.hasDerivAt_mul_tiltedXLog
#print axioms GGC.powerLaplace_eq_laplace_powerLaw
#print axioms GGC.power_log_integrand_bound
#print axioms GGC.integrable_powerMoment
#print axioms GGC.integrable_powerLogMoment
#print axioms GGC.hasDerivAt_powerMoment_s
#print axioms GGC.hasDerivAt_powerLaplace_q
#print axioms GGC.hasDerivAt_powerMoment_one_q
#print axioms GGC.powerLaplace_pos
#print axioms GGC.powerLogDerivative_eq_powerLaw
#print axioms GGC.hasDerivAt_log_powerLaplace_s
#print axioms GGC.powerLogDerivative_eq_ratio
#print axioms GGC.hasDerivAt_powerLogDerivative_q
#print axioms GGC.powerTangent_eq_expanded
#print axioms GGC.hasDerivAt_mul_tiltedXLog_powerTangent
#print axioms GGC.powerTangent_eq_deriv_mul_tiltedXLog
#print axioms GGC.hasDerivAt_log_powerLaplace_q
#print axioms GGC.hasDerivAt_mixed_log_powerLaplace
#print axioms GGC.mixed_log_powerLaplace_commute
#print axioms GGC.integrable_self_gammaLaw
#print axioms GGC.integral_self_gammaLaw
#print axioms GGC.measurable_stieltjesWeight
#print axioms GGC.hasDerivAt_stieltjesMean
#print axioms GGC.stieltjesWeight_eq
#print axioms GGC.stieltjesWeight_bounds
#print axioms GGC.stieltjes_log_kernel_bounds
#print axioms GGC.hasDerivAt_integral_stieltjes_log_kernel
#print axioms GGC.integral_gammaDirichletLaw
#print axioms GGC.tiltedXLog_eq_dirichlet_of_tiltLaw
#print axioms GGC.powerLogDerivative_one_eq_dirichlet_of_tiltLaw
#print axioms GGC.normalized_powerTangent_of_tiltLaws
#print axioms GGC.normalized_powerTangent
#print axioms GGC.exists_normalized_powerTangent

#print axioms GGC.RandomMeasure.exists_joint_probability_sampler
#print axioms GGC.RandomMeasure.measurable_probabilitySampler
#print axioms GGC.RandomMeasure.probabilitySampler_map
#print axioms GGC.RandomMeasure.quantile_set_nonempty
#print axioms GGC.RandomMeasure.quantile_set_bddBelow
#print axioms GGC.RandomMeasure.le_cdf_quantile
#print axioms GGC.RandomMeasure.quantile_le_iff
#print axioms GGC.RandomMeasure.quantile_lt_iff_rat
#print axioms GGC.RandomMeasure.monotoneOn_quantile
#print axioms GGC.RandomMeasure.measurable_cdf_law
#print axioms GGC.RandomMeasure.quantileSampler_eq
#print axioms GGC.RandomMeasure.measurable_quantileSampler
#print axioms GGC.RandomMeasure.measurable_quantileSampler_section
#print axioms GGC.RandomMeasure.ae_unitInterval_interior
#print axioms GGC.RandomMeasure.quantileSampler_map
#print axioms GGC.RandomMeasure.measure_singleton_eq_zero_of_continuousAt_cdf
#print axioms GGC.RandomMeasure.tendsto_cdf_of_narrow
#print axioms GGC.RandomMeasure.exists_continuousAt_cdf_between
#print axioms GGC.RandomMeasure.tendsto_quantile_at_continuity
#print axioms GGC.RandomMeasure.ae_tendsto_quantileSampler
#print axioms GGC.RandomMeasure.sum_stickWeight
#print axioms GGC.RandomMeasure.hasSum_stickWeight_iff
#print axioms GGC.RandomMeasure.measurable_uniformBreak
#print axioms GGC.RandomMeasure.stickResidual_uniformBreak
#print axioms GGC.RandomMeasure.measurableSet_stickCommonEvent
#print axioms GGC.RandomMeasure.hasSum_uniformBreak_on_commonEvent
#print axioms GGC.RandomMeasure.stickMeasure_univ
#print axioms GGC.RandomMeasure.measurable_stickMeasure
#print axioms GGC.lintegral_uniform_coordinate
#print axioms GGC.lintegral_uniform_product
#print axioms GGC.ae_stickCommonEvent
#print axioms GGC.ae_all_masses_stickWeight_hasSum
#print axioms GGC.betaMeasure_one_Iic
#print axioms GGC.uniformBreak_map
#print axioms GGC.RandomMeasure.measurable_probability_narrow_of_giry
#print axioms GGC.RandomMeasure.probabilityMeasure_measurable_eq_borel
#print axioms GGC.measurable_dirichletCoreSample
#print axioms GGC.measurable_dirichletLaw
#print axioms GGC.dirichletLaw_isDirichlet
#print axioms GGC.measurable_dirichletSample
#print axioms GGC.measurable_posteriorSample
#print axioms GGC.dirichletSample_map
#print axioms GGC.posteriorSample_map
#print axioms GGC.posteriorLaw_isDirichlet
#print axioms GGC.dirichletSample_isDirichlet
#print axioms GGC.posteriorSample_isDirichlet
#print axioms GGC.ae_dirichletCommonEvent
#print axioms GGC.ae_all_parameters_stick_realization
#print axioms GGC.rateEquiv_apply_val
#print axioms GGC.rateEquiv_symm_apply
#print axioms GGC.rateLaw_logRateLaw
#print axioms GGC.logRateLaw_rateLaw
#print axioms GGC.measurable_rateDirichletLaw
#print axioms GGC.measurable_rateDirichletSample
#print axioms GGC.measurable_ratePosteriorSample
#print axioms GGC.rateDirichletLaw_isDirichlet
#print axioms GGC.rateDirichletSample_isDirichlet
#print axioms GGC.ratePosteriorSample_isDirichlet
#print axioms GGC.exists_dirichletProcess

#print axioms GGC.Analysis.tendsto_local_dilation_error
#print axioms GGC.Analysis.ae_tendsto_dilation_integral
#print axioms GGC.Analysis.integral_cauchy_mul_eq_dilation
#print axioms GGC.Analysis.ae_tendsto_cauchy_integral
#print axioms GGC.Analysis.ae_tendsto_halfLine_cauchy_integral
#print axioms GGC.phaseHeight_tendsto_zero
#print axioms GGC.phaseApprox_eq_poisson
#print axioms GGC.phase_eq_ae_of_representation
#print axioms GGC.stieltjesPhase_realPhase
#print axioms GGC.integrable_phase_anchor_one
#print axioms GGC.phase_anchor_one
#print axioms GGC.phase_unique_ae

-- M3: exact coefficients, absolute cancellation, posterior Fubini and Palm.
#print GGC.LogRate.generator
#print GGC.LogRate.integral_generator_eq_normalized_powerTangent
#print axioms GGC.LogRate.integrable_jumpMeasure_iff
#print axioms GGC.LogRate.integral_jumpMeasure
#print axioms GGC.LogRate.integrable_scaledPhase_mul
#print axioms GGC.LogRate.integrable_phase_two_anchors
#print axioms GGC.LogRate.phase_two_anchors
#print axioms GGC.LogRate.integrable_phase_scaled_resolventBracket
#print axioms GGC.LogRate.phase_scaled_resolventBracket
#print axioms GGC.LogRate.integrable_phase_compensated_resolvent
#print axioms GGC.LogRate.phase_integral_cancellation
#print axioms GGC.LogRate.hasDerivAt_logResolvent
#print axioms GGC.LogRate.contDiff_logResolvent
#print axioms GGC.LogRate.hasDerivAt_deriv_logResolvent
#print axioms GGC.LogRate.abs_deriv_logResolvent_le
#print axioms GGC.LogRate.abs_deriv_deriv_logResolvent_le
#print axioms GGC.LogRate.abs_logResolvent_remainder_le
#print axioms GGC.LogRate.abs_y_mul_deriv_logResolvent_le
#print axioms GGC.LogRate.sampleDrift_jointlyMeasurable
#print axioms GGC.LogRate.integrable_sample_jumps
#print axioms GGC.LogRate.integral_abs_sample_jumps_le
#print axioms GGC.LogRate.sample_jump_eq_ratio_integral
#print axioms GGC.LogRate.sampleGenerator_logResolvent
#print axioms GGC.LogRate.sampleDrift_eq_offset
#print axioms GGC.LogRate.integrable_sampleDrift
#print axioms GGC.LogRate.integral_abs_sampleDrift_le
#print axioms GGC.LogRate.canonicalDrift_eq_integral_sampleDrift
#print axioms GGC.LogRate.integrable_sampleJump_product
#print axioms GGC.LogRate.integrable_sampleGenerator
#print axioms GGC.LogRate.integral_sampleJump_eq_canonicalJump
#print axioms GGC.LogRate.canonicalGenerator_eq_integral_sampleGenerator
#print axioms GGC.LogRate.canonicalGenerator_logResolvent
#print axioms GGC.LogRate.integral_abs_sampleDrift_resolvent_le
#print axioms GGC.LogRate.integrable_posterior_abs_sampleDrift_resolvent
#print axioms GGC.LogRate.integrable_resolventPalmIntegrand_samplingJoint
#print axioms GGC.LogRate.integrable_canonicalGenerator_logResolvent_rate
#print axioms GGC.LogRate.integral_canonicalGenerator_logResolvent_rate
#print axioms GGC.LogRate.integral_canonicalGenerator_eq_normalized_powerTangent
#print axioms GGC.LogRate.baseMeasure_mass
#print axioms GGC.LogRate.normalized_baseMeasure
#print axioms GGC.LogRate.baseMeasure_isDirichlet
#print axioms GGC.LogRate.generator_eq
#print axioms GGC.LogRate.acceptance_jointlyMeasurable
#print axioms GGC.LogRate.drift_jointlyMeasurable
#print axioms GGC.LogRate.generator_jointlyMeasurable
#print axioms GGC.LogRate.acceptance_bounds
#print axioms GGC.LogRate.drift_compactMass_bound
#print axioms GGC.LogRate.integrable_generator_jumps
#print axioms GGC.LogRate.generator_nonneg_at_min
#print axioms GGC.LogRate.generator_sq_le
#print axioms GGC.LogRate.generator_compactTest_bound
#print axioms GGC.LogRate.integrable_generator_compactTest
#print axioms GGC.LogRate.integrable_generator_logResolvent
#print axioms GGC.LogRate.integral_generator_eq_dirichlet
#print axioms GGC.LogRate.integral_generator_eq_normalized_powerTangent

-- Continuity groundwork: fixed-height phases and uniform L¹ smoothing error.
-- These results alone do not establish the full M4 continuity contract.
#print axioms GGC.continuous_stieltjesMean_law
#print axioms GGC.continuous_complexStieltjesMean_law
#print axioms GGC.continuous_phaseApprox_law
#print axioms GGC.phaseApprox_eq_poisson_canonical
#print axioms GGC.tendsto_integral_phaseApprox_mul
#print axioms GGC.Analysis.norm_translate_sub_toL1
#print axioms GGC.Analysis.continuous_integral_abs_translate_sub
#print axioms GGC.Analysis.tendsto_integral_abs_translate_sub_zero
#print axioms GGC.Analysis.integral_abs_translate_sub_le
#print axioms GGC.Analysis.cauchyTranslationError_nonneg
#print axioms GGC.Analysis.integrable_cauchyTranslationError
#print axioms GGC.Analysis.cauchyTranslationError_tendsto_zero
#print axioms GGC.Analysis.integral_pairing_shift
#print axioms GGC.Analysis.abs_integral_pairing_shift_sub_le
#print axioms GGC.Analysis.integrable_poisson_pairing_product
#print axioms GGC.Analysis.poisson_pairing_fubini
#print axioms GGC.Analysis.integrable_poisson_pairing_outer
#print axioms GGC.Analysis.abs_poisson_pairing_sub_le

-- M4: every L¹ boundary pairing, varying scales/kernels and the sample generator.
-- Actual Dirichlet/posterior averaging and varying outer laws remain open.
#print GGC.continuous_integral_stieltjesPhase_mul
#print GGC.tendsto_integral_scaledStieltjesPhase_mul_of_l1
#print GGC.LogRate.continuous_sampleGenerator_compact
#print axioms GGC.abs_stieltjesMean_sub_le
#print axioms GGC.tendsto_stieltjesMean
#print axioms GGC.continuous_stieltjesMean
#print axioms GGC.measurable_zeroExtendedPhase
#print axioms GGC.zeroExtendedPhase_bounds
#print axioms GGC.phaseApprox_eq_dilation
#print axioms GGC.abs_phaseApprox_pairing_sub_le
#print axioms GGC.continuous_integral_phaseApprox_mul
#print axioms GGC.tendstoUniformly_phaseApprox_pairing
#print axioms GGC.continuous_integral_zeroExtendedPhase_mul
#print axioms GGC.integral_indicator_zeroExtendedPhase
#print axioms GGC.continuous_integral_stieltjesPhase_mul
#print axioms GGC.tendsto_integral_stieltjesPhase_mul
#print axioms GGC.abs_stieltjesPhase_pairing_sub_le
#print axioms GGC.tendsto_integral_stieltjesPhase_mul_of_l1
#print axioms GGC.Analysis.integrableOn_iff_logKernel
#print axioms GGC.Analysis.integral_logKernel
#print axioms GGC.Analysis.logKernel_dilateKernel
#print axioms GGC.Analysis.integrableOn_dilateKernel
#print axioms GGC.Analysis.integral_abs_dilateKernel_sub_eq
#print axioms GGC.Analysis.tendsto_integral_abs_dilateKernel_sub
#print axioms GGC.integral_scaledStieltjesPhase_mul
#print axioms GGC.tendsto_integral_scaledStieltjesPhase_mul
#print axioms GGC.continuous_integral_scaledStieltjesPhase_mul
#print axioms GGC.integrable_mul_scaledStieltjesPhase
#print axioms GGC.abs_scaledStieltjesPhase_pairing_sub_le
#print axioms GGC.tendsto_integral_scaledStieltjesPhase_mul_of_l1
#print axioms GGC.LogRate.continuous_taylorRemainder
#print axioms GGC.LogRate.integrable_taylorRemainder
#print axioms GGC.LogRate.integrable_sampleJumpKernel
#print axioms GGC.LogRate.integral_abs_sampleJumpKernel_sub
#print axioms GGC.LogRate.tendsto_integral_abs_sampleJumpKernel_sub
#print axioms GGC.LogRate.sampleJump_eq_kernel
#print axioms GGC.LogRate.continuous_sampleJump
#print axioms GGC.LogRate.continuous_sampleDrift
#print axioms GGC.LogRate.continuous_sampleGenerator
#print axioms GGC.LogRate.continuous_sampleGenerator_compact

-- M4 completion: common-space coupling, posterior domination and varying outer law.
#print GGC.LogRate.averagedGenerator
#check GGC.LogRate.continuous_generator_compact
#check GGC.LogRate.generator_compactTest_bound
#check GGC.LogRate.averaged_generator_continuous
#print axioms GGC.Analysis.summable_probability_mul
#print axioms GGC.Analysis.tendsto_tsum_abs_sub_probability
#print axioms GGC.Analysis.tendsto_probability_weighted_tsum
#print axioms GGC.RandomMeasure.continuous_uniformBreak
#print axioms GGC.RandomMeasure.continuous_stickResidual
#print axioms GGC.RandomMeasure.continuous_stickWeight
#print axioms GGC.RandomMeasure.integral_stickProbability
#print axioms GGC.RandomMeasure.tendsto_stickProbability
#print axioms GGC.RandomMeasure.tendsto_atomMixture
#print axioms GGC.measurePreserving_locationUniform
#print axioms GGC.ae_tendsto_locationQuantiles
#print axioms GGC.tendsto_dirichletSample_on_commonEvent
#print axioms GGC.ae_tendsto_dirichletSample
#print axioms GGC.ae_tendsto_posteriorSample
#print axioms GGC.continuous_rateLaw
#print axioms GGC.continuous_logRateLaw
#print axioms GGC.ae_tendsto_rateDirichletSample
#print axioms GGC.ae_tendsto_ratePosteriorSample
#print axioms GGC.tendsto_dirichletLaw
#print axioms GGC.continuous_dirichletLaw
#print axioms GGC.tendsto_posteriorLaw
#print axioms GGC.continuous_posteriorLaw
#print axioms GGC.continuous_rateDirichletLaw
#print axioms GGC.rateLaw_atomMixture
#print axioms GGC.ratePosteriorSample_eq
#print axioms GGC.rateDirichletSample_map
#print axioms GGC.ratePosteriorSample_map
#print axioms GGC.uniformBreak_antitone_mass
#print axioms GGC.integrable_neg_log_uniformBreak
#print axioms GGC.ae_uniformBreak_pos
#print axioms GGC.integrable_neg_log_posteriorUniform
#print axioms GGC.ae_posteriorUniform_pos
#print axioms GGC.posteriorLog_ratePosteriorSample_le
#print axioms GGC.LogRate.abs_sampleDrift_le
#print axioms GGC.LogRate.abs_sampleDrift_ratePosteriorSample_le
#print axioms GGC.LogRate.generator_eq_integral_ratePosteriorSample
#print axioms GGC.LogRate.tendsto_generator_compact
#print axioms GGC.LogRate.continuous_generator_compact
#print axioms GGC.Analysis.tendsto_integral_of_narrow_locally_uniform
#print axioms GGC.LogRate.generator_tendstoUniformlyOn_compact
#print axioms GGC.LogRate.tendsto_averagedGenerator
#print axioms GGC.LogRate.averaged_generator_continuous

-- M5 positive kernel, actual iteration, uniform moments, tightness and local consistency.
#print GGC.LogRate.EulerStep
#print GGC.LogRate.eulerMeasure
#print GGC.LogRate.eulerKernel
#print GGC.LogRate.eulerUpdate
#print GGC.LogRate.eulerIterate
#print GGC.LogRate.eulerMass
#check GGC.LogRate.integral_euler_increment
#check GGC.LogRate.integral_euler_increment_sq
#check GGC.LogRate.eulerIterate_uniform_secondMoment
#check GGC.LogRate.isCompact_closure_eulerLawsUpTo
#check GGC.LogRate.abs_euler_error_le_sqrt
#print axioms GGC.LogRate.measurableSet_jumpTail
#print axioms GGC.LogRate.jumpTail_eq
#print axioms GGC.LogRate.integrableOn_jumpDensity_Ioi
#print axioms GGC.LogRate.integral_jumpDensity_Ioi
#print axioms GGC.LogRate.integrableOn_jumpDensity_jumpTail
#print axioms GGC.LogRate.integral_jumpDensity_jumpTail
#print axioms GGC.LogRate.truncatedJumpMeasure_mass
#print axioms GGC.LogRate.truncatedJumpMeasure_isFinite
#print axioms GGC.LogRate.truncatedJumpMeasure_mass_real
#print axioms GGC.LogRate.truncatedJumpMeasure_mass_le
#print axioms GGC.LogRate.integrable_id_truncatedJumpMeasure
#print axioms GGC.LogRate.integral_sq_truncatedJumpMeasure_le
#print axioms GGC.LogRate.measurable_acceptance_uncurry
#print axioms GGC.LogRate.measurable_acceptance
#print axioms GGC.LogRate.integrable_mul_acceptance
#print axioms GGC.LogRate.integrable_acceptance_truncated
#print axioms GGC.LogRate.measurable_truncatedIntensity
#print axioms GGC.LogRate.measurable_truncatedMeanJump
#print axioms GGC.LogRate.measurable_truncatedDrift
#print axioms GGC.LogRate.truncatedIntensity_nonneg
#print axioms GGC.LogRate.truncatedIntensity_le_mass
#print axioms GGC.LogRate.truncatedIntensity_le
#print axioms GGC.LogRate.retainedJumpKernel_apply
#print axioms GGC.LogRate.retainedJumpKernel_isFinite
#print axioms GGC.LogRate.retainedJumpKernel_mass
#print axioms GGC.LogRate.integral_retainedJumpKernel
#print axioms GGC.LogRate.integrable_retainedJumpKernel
#print axioms GGC.LogRate.integral_id_retainedJumpKernel
#print axioms GGC.LogRate.integral_sq_retainedJumpKernel_le
#print axioms GGC.LogRate.eulerStay_lower_bound
#print axioms GGC.LogRate.eulerStay_ge_half
#print axioms GGC.LogRate.eulerStay_pos
#print axioms GGC.LogRate.eulerStay_le_one
#print axioms GGC.LogRate.measurable_eulerStay
#print axioms GGC.LogRate.measurable_eulerDestination
#print axioms GGC.LogRate.measurable_translatedRetainedJumps
#print axioms GGC.LogRate.measurable_eulerMeasure
#print axioms GGC.LogRate.eulerMeasure_mass
#print axioms GGC.LogRate.eulerMeasure_isProbability
#print axioms GGC.LogRate.eulerKernel_apply
#print axioms GGC.LogRate.eulerKernel_isMarkov
#print axioms GGC.LogRate.integrable_eulerMeasure
#print axioms GGC.LogRate.integral_eulerMeasure
#print axioms GGC.LogRate.integrable_euler_increment
#print axioms GGC.LogRate.integral_euler_increment
#print axioms GGC.LogRate.integrable_euler_increment_sq
#print axioms GGC.LogRate.integral_euler_increment_sq
#print axioms GGC.LogRate.truncatedMeanJump_sq_le
#print axioms GGC.LogRate.truncatedDrift_sq_le
#print axioms GGC.LogRate.euler_sqrt_le_quarter
#print axioms GGC.LogRate.euler_atom_secondMoment_le
#print axioms GGC.LogRate.integral_euler_increment_sq_le
#print axioms GGC.LogRate.integrable_euler_sq
#print axioms GGC.LogRate.integral_euler_sq
#print axioms GGC.LogRate.integral_euler_sq_le
#print axioms GGC.LogRate.eulerUpdate_toMeasure
#print axioms GGC.LogRate.integral_eulerUpdate
#print axioms GGC.LogRate.integrable_sq_eulerUpdate
#print axioms GGC.LogRate.integral_sq_eulerUpdate_le
#print axioms GGC.LogRate.eulerIterate_zero
#print axioms GGC.LogRate.eulerIterate_succ
#print axioms GGC.LogRate.integrable_sq_eulerIterate
#print axioms GGC.LogRate.integral_sq_eulerIterate_succ_le
#print axioms GGC.LogRate.eulerMass_zero
#print axioms GGC.LogRate.eulerMass_mem_Icc
#print axioms GGC.LogRate.eulerIterate_moment_growth_le
#print axioms GGC.LogRate.eulerIterate_moment_le_exp
#print axioms GGC.LogRate.eulerIterate_uniform_secondMoment
#print axioms GGC.LogRate.sq_mul_jumpDensity_le_one
#print axioms GGC.LogRate.integral_sq_smallJumps_le
#print axioms GGC.Analysis.isTightMeasureSet_of_secondMoment_bound
#print axioms GGC.LogRate.isTightMeasureSet_eulerLawsUpTo
#print axioms GGC.LogRate.isCompact_closure_eulerLawsUpTo
#print axioms GGC.LogRate.integrable_compactTest_retained
#print axioms GGC.LogRate.integral_taylor_retained
#print axioms GGC.LogRate.integral_euler_compensated
#print axioms GGC.LogRate.integral_euler_error_eq
#print axioms GGC.LogRate.abs_smallJump_remainder_le
#print axioms GGC.LogRate.abs_euler_error_le
#print axioms GGC.LogRate.abs_euler_error_le_sqrt

-- M5 common curve subsequence and constructed finite-time weak solution.
#print GGC.LogRate.WeakLogRateSolution
#check GGC.LogRate.exists_weakLogRateSolution
#print axioms GGC.Analysis.measure_eq_of_integral_compactC2_eq
#print axioms GGC.Analysis.CompactC2Test
#print axioms GGC.Analysis.compactC2Integrals
#print axioms GGC.Analysis.continuous_compactC2Integrals
#print axioms GGC.Analysis.compactC2Integrals_injective
#print axioms GGC.Analysis.isClosedEmbedding_compactC2Integrals
#print axioms GGC.Analysis.exists_tendsto_subseq_of_compactC2_lipschitz
#print axioms GGC.Analysis.probabilityMixture
#print axioms GGC.Analysis.probabilityMixture_toMeasure
#print axioms GGC.Analysis.probabilityMixture_zero
#print axioms GGC.Analysis.probabilityMixture_one
#print axioms GGC.Analysis.integrable_probabilityMixture
#print axioms GGC.Analysis.integral_probabilityMixture
#print axioms GGC.Analysis.integral_probabilityMixture_le
#print axioms GGC.Analysis.meshIndex
#print axioms GGC.Analysis.meshFraction
#print axioms GGC.Analysis.meshFraction_mem_Ico
#print axioms GGC.Analysis.meshIndex_time_le
#print axioms GGC.Analysis.time_lt_meshIndex_succ
#print axioms GGC.Analysis.meshFraction_mul
#print axioms GGC.Analysis.meshIndex_mono
#print axioms GGC.Analysis.linearInterpolate
#print axioms GGC.Analysis.linearInterpolate_mesh
#print axioms GGC.Analysis.abs_linearInterpolate_sub_left
#print axioms GGC.Analysis.abs_linearInterpolate_sub_right
#print axioms GGC.Analysis.abs_linearInterpolate_sub_le
#print axioms GGC.Analysis.meshStep
#print axioms GGC.Analysis.measurable_meshStep
#print axioms GGC.Analysis.meshIndex_eq_on_cell
#print axioms GGC.Analysis.meshStep_ae_eq_cell
#print axioms GGC.Analysis.intervalIntegrable_meshStep_cell
#print axioms GGC.Analysis.integral_meshStep_cell
#print axioms GGC.Analysis.integral_meshStep_upto
#print axioms GGC.Analysis.intervalIntegrable_meshStep_of_bound
#print axioms GGC.Analysis.abs_integral_meshStep_sub_sum_le
#print axioms GGC.Analysis.integrable_and_integral_le_of_narrow
#print axioms GGC.LogRate.integrable_eulerTestMean
#print axioms GGC.LogRate.eulerTestError
#print axioms GGC.LogRate.eulerTestError_eq_integral
#print axioms GGC.LogRate.abs_eulerTestError_le
#print axioms GGC.LogRate.eulerIterate_uniform_testError
#print axioms GGC.LogRate.averagedGenerator_compactTest_bound
#print axioms GGC.LogRate.eulerIterate_uniform_testIncrement
#print axioms GGC.LogRate.eulerIterate_test_telescope
#print axioms GGC.LogRate.eulerIterate_uniform_cumulativeError
#print axioms GGC.LogRate.eulerIterate_uniform_testTime
#print axioms GGC.LogRate.eulerIterate_cumulativeError_tendsto
#print axioms GGC.LogRate.eulerInterpolation
#print axioms GGC.LogRate.eulerInterpolation_zero
#print axioms GGC.LogRate.eulerInterpolation_mesh
#print axioms GGC.LogRate.integral_eulerInterpolation
#print axioms GGC.LogRate.integrable_sq_eulerInterpolation
#print axioms GGC.LogRate.eulerInterpolation_uniform_secondMoment
#print axioms GGC.LogRate.eulerInterpolatedLawsUpTo
#print axioms GGC.LogRate.isTightMeasureSet_eulerInterpolatedLawsUpTo
#print axioms GGC.LogRate.isCompact_closure_eulerInterpolatedLawsUpTo
#print axioms GGC.LogRate.eulerInterpolation_uniform_testTime
#print axioms GGC.LogRate.eulerCurve
#print axioms GGC.LogRate.lipschitzWith_eulerCurve_test
#print axioms GGC.LogRate.continuous_eulerCurve
#print axioms GGC.LogRate.eulerCurveMap
#print axioms GGC.LogRate.exists_eulerCurve_subsequence
#print axioms GGC.LogRate.eulerCurve_limit_initial
#print axioms GGC.LogRate.eulerCurve_limit_secondMoment
#print axioms GGC.LogRate.massAt
#print axioms GGC.LogRate.continuous_massAt
#print axioms GGC.LogRate.massAt_mem_Icc
#print axioms GGC.LogRate.eulerMass_eq_massAt
#print axioms GGC.LogRate.meshLeftTime
#print axioms GGC.LogRate.meshLeftTime_tendsto
#print axioms GGC.LogRate.extendEulerCurve
#print axioms GGC.LogRate.extendEulerCurve_on_interval
#print axioms GGC.LogRate.eulerSubdivisions
#print axioms GGC.LogRate.eulerSubdivisions_pos
#print axioms GGC.LogRate.eulerStepSequence
#print axioms GGC.LogRate.eulerStepSequence_tendsto_zero
#print axioms GGC.LogRate.eulerCurveMap_at_meshLeftTime
#print axioms GGC.LogRate.eulerIterate_at_mesh_tendsto
#print axioms GGC.LogRate.meshGenerator
#print axioms GGC.LogRate.measurable_meshGenerator
#print axioms GGC.LogRate.meshGenerator_uniform_bound
#print axioms GGC.LogRate.meshGenerator_tendsto
#print axioms GGC.LogRate.integral_meshGenerator_tendsto
#print axioms GGC.LogRate.eulerWeakError
#print axioms GGC.LogRate.eulerInterpolation_uniform_weakError
#print axioms GGC.LogRate.eulerWeakError_tendsto
#print axioms GGC.LogRate.eulerCurve_limit_weakEquation
#print axioms GGC.LogRate.WeakLogRateSolution
#print axioms GGC.LogRate.exists_weakLogRateSolution

/-! M6 value moments, continuity, and actual probability kernel. -/
#print axioms GGC.Analysis.integrable_id_of_integrable_sq
#print axioms GGC.Analysis.integral_abs_le_sqrt_secondMoment
#print axioms GGC.Analysis.integral_abs_le_sqrt_of_secondMoment_le
#print axioms GGC.Analysis.integral_abs_tail_le
#print axioms GGC.Analysis.integrable_of_linearGrowth
#print axioms GGC.Analysis.abs_sub_projIcc_le_sq_div
#print axioms GGC.Analysis.clippedTest
#print axioms GGC.Analysis.integral_clippedTest_error_le
#print axioms GGC.Analysis.tendsto_integral_of_narrow_testSecondMoment
#print axioms GGC.Analysis.sq_le_of_linearGrowth
#print axioms GGC.Analysis.integrable_sq_of_linearGrowth
#print axioms GGC.Analysis.integral_sq_le_of_linearGrowth
#print axioms GGC.Analysis.tendsto_integral_of_narrow_linearGrowth
#print axioms GGC.Analysis.continuous_integral_of_uniform_secondMoment
#print axioms GGC.Analysis.measureReal_le_integral
#print axioms GGC.Analysis.integrable_and_integral_le_of_tail_bound
#print axioms GGC.Analysis.isTightMeasureSet_of_nonnegative_logMoment_bound
#print axioms GGC.Analysis.isTightMeasureSet_of_firstMoment_bound
#print axioms GGC.boundedLaplaceTest
#print axioms GGC.integral_boundedLaplaceTest
#print axioms GGC.tendsto_laplace_of_narrow
#print axioms GGC.nonnegative_of_narrow_limit
#print axioms GGC.nonnegLaw_tendsto_of_laplace_tendsto
#print axioms GGC.Identification.integrableOn_logTest_exp_neg
#print axioms GGC.Identification.integral_logTest_exp_neg_le
#print axioms GGC.Identification.integrable_logTest_exp_neg_prod
#print axioms GGC.Identification.integrable_integral_logTest_exp_neg
#print axioms GGC.Identification.integral_integral_logTest_exp_neg_le
#print axioms GGC.Identification.logTest
#print axioms GGC.Identification.continuous_logTest
#print axioms GGC.Identification.logTest_nonneg
#print axioms GGC.Identification.logTest_le
#print axioms GGC.Identification.integrable_logTest
#print axioms GGC.Identification.integral_logTest_le
#print axioms GGC.Identification.integral_baseMeasure_log
#print axioms GGC.Identification.thorinAdmissible_baseMeasure
#print axioms GGC.Identification.logValueLaw
#print axioms GGC.Identification.expValueLaw
#print axioms GGC.Identification.continuous_expValueLaw
#print axioms GGC.Identification.expValueLaw_logValueLaw
#print axioms GGC.Identification.expValueLaw_injective
#print axioms GGC.Identification.integrable_id_logValueLaw
#print axioms GGC.Identification.integral_abs_logValueLaw
#print axioms GGC.Identification.isTightMeasureSet_logValueLaws
#print axioms GGC.Identification.continuous_logValueLaw
#print axioms GGC.Identification.positiveValueLaw
#print axioms GGC.Identification.positiveValueLaw_map_val
#print axioms GGC.Identification.continuous_positiveValueLaw
#print axioms GGC.Identification.valueKernel
#print axioms GGC.Identification.valueKernel_apply
#print axioms GGC.Identification.valueKernel_isMarkov
#print axioms GGC.Identification.valueLaw_posLog_integrable_bound
#print axioms GGC.Identification.valueLaw_integrable_log_bound
#print axioms GGC.Identification.valueLaw_logMoment_compactMass_bound
#print axioms GGC.Identification.valueLaw_logMoment_bound
#print axioms GGC.Identification.logTest_linearGrowth
#print axioms GGC.Identification.continuous_logTest_integral
#print axioms GGC.Identification.WeakLogRateSolution.continuous_logTest_integral
#print axioms GGC.Identification.WeakLogRateSolution.continuous_laplace
#print axioms GGC.Identification.isTightMeasureSet_valueLaws
#print axioms GGC.Identification.continuous_valueLaw
#print axioms GGC.Identification.logRateThorinData
#print axioms GGC.Identification.valueLaw
#print axioms GGC.Identification.laplace_valueLaw
#print axioms GGC.Identification.isGGC_valueLaw
#print axioms GGC.Identification.valueLaw_eq_of_laplace
#print axioms GGC.Identification.laplace_valueLaw_lower_bound
#print axioms GGC.Identification.WeakLogRateSolution.integrable_sq
#print axioms GGC.Identification.WeakLogRateSolution.value
#print axioms GGC.Identification.WeakLogRateSolution.uniform_laplace_lower_bound
#print axioms GGC.Identification.logTest_exp_lower
#print axioms GGC.Identification.laplace_valueLaw_exp_bound
#print axioms GGC.Identification.laplace_valueLaw_exp_tendsto_zero
#print axioms GGC.Identification.measureReal_zero_le_laplace
#print axioms GGC.Identification.valueLaw_zero_measure
#print axioms GGC.Identification.valueLaw_pos
#print axioms GGC.Identification.measureReal_Iic_exp_neg_le_laplace
#print axioms GGC.Identification.exp_neg_one_le_half
#print axioms GGC.Identification.measureReal_Ioi_exp_le_one_sub_laplace
#print axioms GGC.Identification.measureReal_negLog_tail_le
#print axioms GGC.Identification.measureReal_posLog_tail_le
#print axioms GGC.Identification.valueLaw_negLog_integrable_bound

/-! M6 joint measurability, all tangent terms, zero endpoint and space-time Fubini. -/
#print axioms GGC.Identification.abs_mul_dampedLog_integrand_le
#print axioms GGC.Identification.tendsto_laplace_zero
#print axioms GGC.Identification.abs_mul_dampedLogMoment_le
#print axioms GGC.Identification.tendsto_mul_dampedLogMoment_zero
#print axioms GGC.Identification.tendsto_mul_tiltedXLog_zero
#print axioms GGC.Identification.abs_mul_tiltedXLog_le
#print axioms GGC.Identification.absLogKernel
#print axioms GGC.Identification.absLogKernel_nonneg
#print axioms GGC.Identification.measurable_absLogKernel
#print axioms GGC.Identification.integral_expRate
#print axioms GGC.Identification.integral_mul_expRate
#print axioms GGC.Identification.integrableOn_absLogKernel
#print axioms GGC.Identification.integral_absLogKernel
#print axioms GGC.Identification.integral_norm_absLogKernel
#print axioms GGC.Identification.integrable_absLogKernel_prod
#print axioms GGC.Identification.integrable_integral_absLogKernel
#print axioms GGC.Identification.integral_integral_absLogKernel
#print axioms GGC.Identification.measurable_dampedMoment
#print axioms GGC.Identification.measurable_dampedLogMoment
#print axioms GGC.Identification.measurable_laplace
#print axioms GGC.Identification.measurable_tiltedXLog
#print axioms GGC.Identification.measurable_dampedMoment_value
#print axioms GGC.Identification.measurable_dampedLogMoment_value
#print axioms GGC.Identification.measurable_laplace_value
#print axioms GGC.Identification.measurable_tiltedXLog_value
#print axioms GGC.Identification.measurable_expandedPowerTangent_value
#print axioms GGC.Identification.measurable_powerTangent_value
#print axioms GGC.Identification.integral_absLogKernel_nonneg
#print axioms GGC.Identification.abs_dampedLogMoment_zero_le
#print axioms GGC.Identification.abs_mul_dampedLogMoment_one_le
#print axioms GGC.Identification.mul_dampedMoment_one_nonneg
#print axioms GGC.Identification.mul_dampedMoment_one_le
#print axioms GGC.Identification.integrableOn_of_absLogKernel_bound
#print axioms GGC.Identification.integrableOn_tiltedXLog_bound
#print axioms GGC.Identification.integrableOn_secondTangentTerm_bound
#print axioms GGC.Identification.integrableOn_productTangentTerm_bound
#print axioms GGC.Identification.integrableOn_powerTangent_bound
#print axioms GGC.Identification.integral_powerTangent_zero_endpoint
#print axioms GGC.Identification.timeMeasure
#print axioms GGC.Identification.timeMeasure_univ
#print axioms GGC.Identification.timeMeasure_isFinite
#print axioms GGC.Identification.timeMeasure_real_univ
#print axioms GGC.Identification.aestronglyMeasurable_powerTangent_prod
#print axioms GGC.Identification.integrable_powerTangent_prod_bound
#print axioms GGC.Identification.value_tangent_spaceTime_bound
#print axioms GGC.Identification.tendsto_integral_mul_tiltedXLog_zero
#print axioms GGC.Identification.integrable_valueTangent_prod
#print axioms GGC.Identification.integral_valueTangent_swap_zero_endpoint
#print axioms GGC.Identification.value_zero_endpoint_bounds

/-! M6 expanding cutoffs and the full linearly growing C2 weak test domain. -/
#print axioms GGC.Analysis.unitBump
#print axioms GGC.Analysis.smoothCutoff
#print axioms GGC.Analysis.contDiff_smoothCutoff
#print axioms GGC.Analysis.smoothCutoff_nonneg
#print axioms GGC.Analysis.smoothCutoff_le_one
#print axioms GGC.Analysis.hasCompactSupport_smoothCutoff
#print axioms GGC.Analysis.smoothCutoff_eq_one
#print axioms GGC.Analysis.smoothCutoff_eventuallyEq_one
#print axioms GGC.Analysis.smoothCutoff_eq_zero
#print axioms GGC.Analysis.smoothCutoff_eventuallyEq_zero
#print axioms GGC.Analysis.hasDerivAt_smoothCutoff
#print axioms GGC.Analysis.deriv_smoothCutoff
#print axioms GGC.Analysis.deriv_deriv_smoothCutoff
#print axioms GGC.Analysis.cutoffTest
#print axioms GGC.Analysis.contDiff_cutoffTest
#print axioms GGC.Analysis.hasCompactSupport_cutoffTest
#print axioms GGC.Analysis.cutoffTest_eventuallyEq
#print axioms GGC.Analysis.cutoffTest_eq
#print axioms GGC.Analysis.deriv_cutoffTest_eq
#print axioms GGC.Analysis.cutoffTest_eventually_eventuallyEq
#print axioms GGC.Analysis.abs_cutoffTest_le
#print axioms GGC.Analysis.LinearGrowthC2
#print axioms GGC.Analysis.exists_smoothCutoff_deriv_bounds
#print axioms GGC.Analysis.exists_smoothCutoff_weighted_deriv_bounds
#print axioms GGC.Analysis.deriv_cutoffTest
#print axioms GGC.Analysis.deriv_deriv_cutoffTest
#print axioms GGC.Analysis.exists_cutoffTest_uniform_bound
#print axioms GGC.LogRate.generator_derivative_bound
#print axioms GGC.LogRate.generator_linearGrowth_bound
#print axioms GGC.LogRate.tendsto_generator_cutoffTest
#print axioms GGC.LogRate.tendsto_integral_cutoffTest
#print axioms GGC.LogRate.tendsto_averagedGenerator_cutoffTest
#print axioms GGC.Identification.averagedGenerator_cutoff_uniform_bound
#print axioms GGC.Identification.integral_averagedGenerator_cutoff_tendsto
#print axioms GGC.Identification.weakEquation_linearGrowth

/-! M6 time integrating factor, resolvent cancellation and normalized Laplace evolution. -/
#print axioms GGC.Analysis.exp_neg_mul_sub_eq_integral
#print axioms GGC.Analysis.exp_sub_eq_integral
#print axioms GGC.Identification.averagedGenerator_linearGrowth_uniform_bound
#print axioms GGC.Identification.measurable_averagedGenerator_weakSolution
#print axioms GGC.Identification.intervalIntegrable_averagedGenerator_linearGrowth
#print axioms GGC.Identification.abs_logResolvent_le
#print axioms GGC.Identification.linearGrowthC2_logResolvent
#print axioms GGC.Identification.hasDerivAt_logTest_s
#print axioms GGC.Identification.hasDerivAt_integral_logTest
#print axioms GGC.Identification.hasDerivAt_log_laplace_valueLaw
#print axioms GGC.Identification.powerLogDerivative_valueLaw
#print axioms GGC.Identification.valueAt
#print axioms GGC.Identification.valueAt_eq_value
#print axioms GGC.Identification.continuous_valueAt
#print axioms GGC.Identification.timeUpTo
#print axioms GGC.Identification.timeUpTo_isFinite
#print axioms GGC.Identification.integral_timeUpTo
#print axioms GGC.Identification.averagedGenerator_value_resolvent
#print axioms GGC.Identification.powerLogDerivative_valueAt
#print axioms GGC.Identification.resolvent_time_equation
#print axioms GGC.continuous_laplace_of_narrow
#print axioms GGC.continuous_dampedLogMoment_of_narrow
#print axioms GGC.continuous_tiltedXLog_of_narrow
#print axioms GGC.Identification.hasDerivAt_log_laplace
#print axioms GGC.Identification.tendsto_log_laplace_zero
#print axioms GGC.Identification.log_laplace_time_equation
#print axioms GGC.Identification.laplace_time_equation
#print axioms GGC.Identification.continuous_laplace_time_integrand

/-! M6 simultaneous C1 approximation and the actual log-value transport equation. -/
#print axioms GGC.Analysis.exists_polynomial_primitive
#print axioms GGC.Analysis.exists_polynomial_C1_approximation
#print axioms GGC.integrable_nonnegLaw_test
#print axioms GGC.abs_integral_nonnegLaw_test_le
#print axioms GGC.abs_integral_sub_nonnegLaw_test_le
#print axioms GGC.continuous_integral_nonnegLaw_test
#print axioms GGC.Identification.expTest
#print axioms GGC.Identification.expGenerator
#print axioms GGC.Identification.continuous_expTest
#print axioms GGC.Identification.continuous_expGenerator
#print axioms GGC.Identification.hasDerivAt_expTest
#print axioms GGC.Identification.expGenerator_eq_mul_deriv
#print axioms GGC.Identification.expTest_generator_bounded
#print axioms GGC.Identification.integrable_expTest
#print axioms GGC.Identification.integrable_expGenerator
#print axioms GGC.Identification.continuous_integral_expGenerator
#print axioms GGC.Identification.contDiff_polynomial_eval
#print axioms GGC.Identification.expGenerator_polynomial
#print axioms GGC.Identification.expTest_monomial
#print axioms GGC.Identification.expGenerator_monomial
#print axioms GGC.Identification.exists_expTest_generator_approximation
#print axioms GGC.Identification.polynomial_exp_time_equation
#print axioms GGC.Identification.C1_exp_time_equation
#print axioms GGC.Analysis.contDiff_comp_neg_log
#print axioms GGC.Analysis.logValueTest
#print axioms GGC.Analysis.logValueTest_zero
#print axioms GGC.Analysis.logValueTest_eventually_zero
#print axioms GGC.Analysis.logValueTest_eventuallyEq_log
#print axioms GGC.Analysis.contDiff_logValueTest
#print axioms GGC.Analysis.hasCompactSupport_logValueTest
#print axioms GGC.Analysis.hasDerivAt_logValueTest
#print axioms GGC.Analysis.mul_log_deriv_logValueTest
#print axioms GGC.Identification.compact_value_time_equation
#print axioms GGC.Identification.valueAt_pos
#print axioms GGC.Identification.continuous_logValueAt
#print axioms GGC.Identification.integral_logValueLaw_test
#print axioms GGC.Identification.integral_logValueTest
#print axioms GGC.Identification.integral_logValueTest_generator
#print axioms GGC.Identification.log_value_time_equation

/-! M6 backward-test partition uniqueness and actual power-law identification. -/
#print axioms GGC.Analysis.eq_endpoints_of_partition_cancellation
#print axioms GGC.Analysis.continuous_integral_bounded_joint
#print axioms GGC.Identification.backwardTest
#print axioms GGC.Identification.backwardDerivative
#print axioms GGC.Identification.contDiff_backwardTest
#print axioms GGC.Identification.hasCompactSupport_backwardTest
#print axioms GGC.Identification.hasDerivAt_backwardTest_time
#print axioms GGC.Identification.hasDerivAt_backwardTest_space
#print axioms GGC.Identification.backwardTest_transport_identity
#print axioms GGC.Identification.continuous_backwardDerivative
#print axioms GGC.Identification.backwardTest_derivative_bound
#print axioms GGC.Identification.continuous_backward_pairing
#print axioms GGC.Identification.hasDerivAt_integral_backwardTest
#print axioms GGC.Identification.transport_pairing_eq
#print axioms GGC.Identification.transport_law_eq_map
#print axioms GGC.Identification.logValueAt_eq_map
#print axioms GGC.Identification.valueAt_eq_powerLaw
#print axioms GGC.Identification.valueAt_zero
#print axioms GGC.Identification.isGGC_power_valueLaw_of_weakSolution

/-! M7 initial data, finite-input power closure and the full public theorem. -/
#print axioms GGC.Identification.exists_logRate_initialData
#print axioms GGC.Identification.finiteThorinMeasure_ne_zero
#print axioms GGC.Identification.exists_finiteGamma_initialData
#print axioms GGC.isGGC_power_valueLaw
#print axioms GGC.isGGC_power_finiteGammaLaw
#print axioms GGC.isGGC_power_of_isFiniteGammaConvolution
#check (GGC.ggc_rpow : ∀ (μ : GGC.NonnegLaw) (q : ℝ) (hq : 1 ≤ q),
  GGC.IsGGC μ → GGC.IsGGC (GGC.powerLaw μ q (zero_le_one.trans hq)))
#print GGC.ggc_rpow
#print axioms GGC.ggc_rpow
