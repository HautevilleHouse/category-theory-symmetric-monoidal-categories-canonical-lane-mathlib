import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.SymmetricMonoidalStructure
import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.BraidingHexagon
import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.FunctorsNaturalTransformations

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure CoherencePackage (C : SymmetricMonoidalCategory) where
  macLaneCoherence : Prop
  strictification : Prop
  coherenceTheoremProved : Prop

structure CoherenceEvidence {C : SymmetricMonoidalCategory} (P : CoherencePackage C) where
  macLaneCoherenceClosed : P.macLaneCoherence
  strictificationClosed : P.strictification
  coherenceTheoremProvedClosed : P.coherenceTheoremProved

def CoherenceClosed {C : SymmetricMonoidalCategory} (P : CoherencePackage C) : Prop :=
  P.macLaneCoherence ∧ P.strictification ∧ P.coherenceTheoremProved

theorem coherence_closed_from_evidence {C : SymmetricMonoidalCategory}
    (P : CoherencePackage C) (E : CoherenceEvidence P) : CoherenceClosed P := by
  exact And.intro E.macLaneCoherenceClosed
    (And.intro E.strictificationClosed E.coherenceTheoremProvedClosed)

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse