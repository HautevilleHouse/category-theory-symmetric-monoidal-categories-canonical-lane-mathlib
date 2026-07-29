import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.SymmetricMonoidalCategory

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure CoherencePackage (S : SymmetricMonoidalCategory) where
  macLaneCoherence : Prop
  strictificationExists : Prop
  coherenceConditionsMet : Prop

def CoherenceClosed (C : CoherencePackage S) : Prop :=
  C.macLaneCoherence ∧ C.strictificationExists ∧ C.coherenceConditionsMet

structure CoherenceEvidence (C : CoherencePackage S) where
  macLaneCoherenceClosed : C.macLaneCoherence
  strictificationExistsClosed : C.strictificationExists
  coherenceConditionsMetClosed : C.coherenceConditionsMet

theorem coherence_closed_from_evidence (C : CoherencePackage S) (E : CoherenceEvidence C) : CoherenceClosed C := by
  exact And.intro E.macLaneCoherenceClosed (And.intro E.strictificationExistsClosed E.coherenceConditionsMetClosed)

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse
