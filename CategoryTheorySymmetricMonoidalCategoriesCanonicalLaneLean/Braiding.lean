import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure Braiding {C : MonoidalCategory} where
  braiding : (X Y : C.obj) → C.hom (C.tensorProduct X Y) (C.tensorProduct Y X)
  naturality : Prop
  hexagonCondition : Prop
  symmetryCondition : Prop
  naturalityClosed : naturality
  hexagonConditionClosed : hexagonCondition
  symmetryConditionClosed : symmetryCondition

structure BraidingEvidence {C : MonoidalCategory} (B : Braiding C) where
  naturalityClosed : B.naturality
  hexagonConditionClosed : B.hexagonCondition
  symmetryConditionClosed : B.symmetryCondition

def BraidingClosed {C : MonoidalCategory} (B : Braiding C) : Prop :=
  B.naturality ∧ B.hexagonCondition ∧ B.symmetryCondition

theorem braiding_closed_from_evidence {C : MonoidalCategory} (B : Braiding C) (E : BraidingEvidence B) : BraidingClosed B := by
  exact And.intro E.naturalityClosed (And.intro E.hexagonConditionClosed E.symmetryConditionClosed)

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse