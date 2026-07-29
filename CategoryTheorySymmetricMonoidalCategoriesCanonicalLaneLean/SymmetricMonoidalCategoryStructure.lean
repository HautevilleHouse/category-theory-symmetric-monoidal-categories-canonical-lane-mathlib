import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure SymmetricMonoidalCategoryStructure where
  obj : Type u
  hom : obj → obj → Type v
  tensor : obj → obj → obj
  tensorHom : ∀ {X Y Z W : obj}, (X → Y) → (Z → W) → (tensor X Z → tensor Y W)
  associator : ∀ X Y Z : obj, tensor (tensor X Y) Z → tensor X (tensor Y Z)
  leftUnitor : ∀ X : obj, tensor unit X → X
  rightUnitor : ∀ X : obj, tensor X unit → X
  braiding : ∀ X Y : obj, tensor X Y → tensor Y X
  pentagon : Prop
  triangle : Prop
  hexagon : Prop
  symmetryInvolutive : Prop
  pentagonTerm : pentagon
  triangleTerm : triangle
  hexagonTerm : hexagon
  symmetryInvolutiveTerm : symmetryInvolutive

structure SymmetricMonoidalCategoryEvidence (S : SymmetricMonoidalCategoryStructure) where
  pentagonClosed : S.pentagon
  triangleClosed : S.triangle
  hexagonClosed : S.hexagon
  symmetryInvolutiveClosed : S.symmetryInvolutive

def SymmetricMonoidalCategoryClosed (S : SymmetricMonoidalCategoryStructure) : Prop :=
  S.pentagon ∧ S.triangle ∧ S.hexagon ∧ S.symmetryInvolutive

theorem symmetric_monoidal_category_closed_from_evidence
    (S : SymmetricMonoidalCategoryStructure) (E : SymmetricMonoidalCategoryEvidence S) :
    SymmetricMonoidalCategoryClosed S := by
  exact And.intro E.pentagonClosed (And.intro E.triangleClosed (And.intro E.hexagonClosed E.symmetryInvolutiveClosed))

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse