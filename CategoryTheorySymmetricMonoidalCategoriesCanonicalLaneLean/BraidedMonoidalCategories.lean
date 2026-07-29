import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.MacLaneCoherence

/-!
# Braided and Symmetric Monoidal Categories
-/

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure BraidedMonoidalStructure where
  braiding : Prop
  hexagonIdentity : Prop
  naturalityCondition : Prop
  symmetricCase : Prop

def SymmetricMonoidalStructure (B : BraidedMonoidalStructure) : Prop :=
  B.braiding ∧ B.hexagonIdentity ∧ B.naturalityCondition ∧ B.symmetricCase

structure BraidedMonoidalEvidence (B : BraidedMonoidalStructure) where
  braidingClosed : B.braiding
  hexagonIdentityClosed : B.hexagonIdentity
  naturalityConditionClosed : B.naturalityCondition
  symmetricCaseClosed : B.symmetricCase

theorem symmetric_monoidal_structure_from_evidence (B : BraidedMonoidalStructure)
    (E : BraidedMonoidalEvidence B) : SymmetricMonoidalStructure B := by
  exact And.intro E.braidingClosed
    (And.intro E.hexagonIdentityClosed
      (And.intro E.naturalityConditionClosed E.symmetricCaseClosed))

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse