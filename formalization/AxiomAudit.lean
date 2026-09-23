import GGC.FiniteGamma
import GGC.Thorin
import GGC.Reduction
import GGC.Foundations.RandomMeasure
import GGC.GammaAnalysis
import GGC.BetaAnalysis
import GGC.Foundations.Posterior
import GGC.StieltjesMean
import GGC.StieltjesPhase
import GGC.BetaPosterior
import GGC.ExponentialTilt
import GGC.GammaDirichlet
import GGC.Palm
import GGC.LogRate.Kernel
import GGC.LogRate.JumpMeasure
import GGC.LogRate.Resolvent
import GGC.LogRate.JumpCalculus
import GGC.LogRate.DriftBounds
import GGC.LogRate.PhaseGenerator
import GGC.LogRate.CanonicalGenerator
import GGC.LogRate.CanonicalBounds
import External.Bondesson
import External.James

/-!
# Audit of the current statement and external boundary

This audit builds the statement, elementary sanity lemmas, and full external
contracts. There is no declaration `GGC.ggc_rpow` yet: the main proof is pending.
Printing the axioms of a proposition definition does not certify its truth.
Once the main theorem exists, add `#print axioms GGC.ggc_rpow` here and enforce
the whitelist in README.md against its actual transitive dependencies.
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
