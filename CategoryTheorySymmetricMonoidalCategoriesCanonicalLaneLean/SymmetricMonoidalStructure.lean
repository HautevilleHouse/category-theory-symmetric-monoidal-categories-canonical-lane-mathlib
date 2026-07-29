import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure SymmetricMonoidalCategory where
  obj : Type u
  hom : obj → obj → Type v
  id : ∀ X : obj, hom X X
  comp : ∀ {X Y Z : obj}, hom X Y → hom Y Z → hom X Z
  tensor : obj → obj → obj
  tensorHom : ∀ {X Y Z W : obj}, hom X Y → hom Z W → hom (tensor X Z) (tensor Y W)
  associator : ∀ X Y Z : obj, hom (tensor (tensor X Y) Z) (tensor X (tensor Y Z))
  leftUnitor : ∀ X : obj, hom (tensor unit X) X
  rightUnitor : ∀ X : obj, hom (tensor X unit) X
  braiding : ∀ X Y : obj, hom (tensor X Y) (tensor Y X)
  unit : obj
  pentagonCondition : Prop
  triangleCondition : Prop
  hexagonCondition : Prop

structure SymmetricMonoidalEvidence (C : SymmetricMonoidalCategory) where
  pentagonConditionClosed : C.pentagonCondition
  triangleConditionClosed : C.triangleCondition
  hexagonConditionClosed : C.hexagonCondition

def SymmetricMonoidalClosed (C : SymmetricMonoidalCategory) : Prop :=
  C.pentagonCondition ∧ C.triangleCondition ∧ C.hexagonCondition

theorem symmetric_monoidal_closed_from_evidence (C : SymmetricMonoidalCategory)
    (E : SymmetricMonoidalEvidence C) : SymmetricMonoidalClosed C := by
  exact And.intro E.pentagonConditionClosed
    (And.intro E.triangleConditionClosed E.hexagonConditionClosed)

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse