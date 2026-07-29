import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure SymmetricMonoidalCategoryPackage where
  category : Type u
  tensorProduct : category → category → category
  tensorUnit : category
  associator : (X Y Z : category) → tensorProduct (tensorProduct X Y) Z ≅ tensorProduct X (tensorProduct Y Z)
  leftUnitor : (X : category) → tensorProduct tensorUnit X ≅ X
  rightUnitor : (X : category) → tensorProduct X tensorUnit ≅ X
  braiding : (X Y : category) → tensorProduct X Y ≅ tensorProduct Y X
  pentagonCondition : Prop
  triangleCondition : Prop
  hexagonCondition : Prop
  symmetryCondition : Prop

structure SymmetricMonoidalCategoryEvidence (S : SymmetricMonoidalCategoryPackage) where
  pentagonConditionClosed : S.pentagonCondition
  triangleConditionClosed : S.triangleCondition
  hexagonConditionClosed : S.hexagonCondition
  symmetryConditionClosed : S.symmetryCondition

def SymmetricMonoidalCategoryClosed (S : SymmetricMonoidalCategoryPackage) : Prop :=
  S.pentagonCondition ∧ S.triangleCondition ∧ S.hexagonCondition ∧ S.symmetryCondition

theorem symmetric_monoidal_category_closed_from_evidence
    (S : SymmetricMonoidalCategoryPackage) (E : SymmetricMonoidalCategoryEvidence S) :
    SymmetricMonoidalCategoryClosed S := by
  exact And.intro E.pentagonConditionClosed
    (And.intro E.triangleConditionClosed
      (And.intro E.hexagonConditionClosed E.symmetryConditionClosed))

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse