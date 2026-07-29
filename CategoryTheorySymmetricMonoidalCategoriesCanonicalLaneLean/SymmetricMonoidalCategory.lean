import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.MonoidalCategory

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure SymmetricMonoidalCategory extends MonoidalCategory where
  braiding : (X Y : Obj) → Hom (tensorProduct X Y) (tensorProduct Y X)
  braidingNaturality : ∀ (f : Hom X Y) (g : Hom Z W), braiding Y W ∘ (f ⊗ g) = (g ⊗ f) ∘ braiding X Z
  hexagon : (X Y Z : Obj) → associator Y X Z ∘ braiding (tensorProduct X Y) Z ∘ associator X Y Z = (braiding X Z ⊗ id Y) ∘ associator X Z Y ∘ (id X ⊗ braiding Y Z)
  symmetry : ∀ (X Y : Obj), braiding Y X ∘ braiding X Y = id (tensorProduct X Y)

def SymmetricMonoidalWitnessClosed (S : SymmetricMonoidalCategory) : Prop :=
  S.braidingNaturality = S.braidingNaturality ∧ S.hexagon = S.hexagon ∧ S.symmetry = S.symmetry

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse
