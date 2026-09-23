import GGC.FiniteGamma
import GGC.Thorin
import External.Bondesson

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
#print GGC.powerLaw
#print GGC.GGCPowerClosure

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

#print axioms GGC.External.Bondesson.thorin_realization
#print axioms GGC.External.Bondesson.weak_closure
#print axioms GGC.External.Bondesson.finite_atomic_approximation
