import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure SymmetricMonoidalStructure (M : MonoidalCategory) where
  braiding : ∀ (X Y : M.category), M.tensorProduct X Y ≅ M.tensorProduct Y X
  hexagonCondition : Prop
  braidingNaturality : Prop
  hexagonConditionTerm : hexagonCondition
  braidingNaturalityTerm : braidingNaturality

structure SymmetricMonoidalEvidence (M : MonoidalCategory) (S : SymmetricMonoidalStructure M) where
  hexagonConditionClosed : S.hexagonCondition
  braidingNaturalityClosed : S.braidingNaturality

def SymmetricMonoidalClosed (M : MonoidalCategory) (S : SymmetricMonoidalStructure M) : Prop :=
  S.hexagonCondition ∧ S.braidingNaturality

theorem symmetric_monoidal_closed_from_evidence (M : MonoidalCategory) (S : SymmetricMonoidalStructure M) (E : SymmetricMonoidalEvidence M S) : SymmetricMonoidalClosed M S := by
  exact And.intro E.hexagonConditionClosed E.braidingNaturalityClosed

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse