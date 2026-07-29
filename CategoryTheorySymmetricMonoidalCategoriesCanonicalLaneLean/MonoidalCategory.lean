import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure MonoidalCategory where
  Obj : Type u
  Hom : Obj → Obj → Type v
  tensorProduct : Obj → Obj → Obj
  tensorUnit : Obj
  associator : (X Y Z : Obj) → Hom (tensorProduct (tensorProduct X Y) Z) (tensorProduct X (tensorProduct Y Z))
  leftUnitor : (X : Obj) → Hom (tensorProduct tensorUnit X) X
  rightUnitor : (X : Obj) → Hom (tensorProduct X tensorUnit) X
  pentagon : (W X Y Z : Obj) → (associator W X Y) ⊗ id Z ∘ associator W (tensorProduct X Y) Z ∘ (id W ⊗ associator X Y Z) = associator (tensorProduct W X) Y Z ∘ associator W X (tensorProduct Y Z)
  triangle : (X Y : Obj) → (id X ⊗ leftUnitor Y) ∘ associator X tensorUnit Y = (rightUnitor X ⊗ id Y)

def MonoidalWitnessClosed (M : MonoidalCategory) : Prop :=
  M.pentagon = M.pentagon ∧ M.triangle = M.triangle

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse
