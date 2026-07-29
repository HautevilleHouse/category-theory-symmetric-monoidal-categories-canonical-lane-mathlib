import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure SymmetricMonoidalCategoryPackage where
  objectType : Type u
  morphismType : Type v
  tensorProduct : objectType → objectType → objectType
  unitObject : objectType
  associator : (a b c : objectType) → morphismType (tensorProduct (tensorProduct a b) c) (tensorProduct a (tensorProduct b c))
  leftUnitor : (a : objectType) → morphismType (tensorProduct unitObject a) a
  rightUnitor : (a : objectType) → morphismType (tensorProduct a unitObject) a
  braiding : (a b : objectType) → morphismType (tensorProduct a b) (tensorProduct b a)
  pentagonCondition : Prop
  triangleCondition : Prop
  hexagonCondition : Prop
  symmetryCondition : Prop

structure SymmetricMonoidalCategoryEvidence (P : SymmetricMonoidalCategoryPackage) where
  pentagonConditionClosed : P.pentagonCondition
  triangleConditionClosed : P.triangleCondition
  hexagonConditionClosed : P.hexagonCondition
  symmetryConditionClosed : P.symmetryCondition

def SymmetricMonoidalCategoryClosed (P : SymmetricMonoidalCategoryPackage) : Prop :=
  P.pentagonCondition ∧ P.triangleCondition ∧ P.hexagonCondition ∧ P.symmetryCondition

theorem symmetric_monoidal_category_closed_from_evidence
    (P : SymmetricMonoidalCategoryPackage) (E : SymmetricMonoidalCategoryEvidence P) :
    SymmetricMonoidalCategoryClosed P := by
  exact And.intro E.pentagonConditionClosed
    (And.intro E.triangleConditionClosed
      (And.intro E.hexagonConditionClosed E.symmetryConditionClosed))

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse