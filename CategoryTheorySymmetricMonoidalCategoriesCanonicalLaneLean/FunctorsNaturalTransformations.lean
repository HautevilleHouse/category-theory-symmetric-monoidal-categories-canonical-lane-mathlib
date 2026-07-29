import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.SymmetricMonoidalStructure

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure MonoidalFunctor (C D : SymmetricMonoidalCategory) where
  mapObj : C.obj → D.obj
  mapHom : ∀ {X Y : C.obj}, C.hom X Y → D.hom (mapObj X) (mapObj Y)
  preservationTensor : ∀ X Y : C.obj, D.hom (D.tensor (mapObj X) (mapObj Y)) (mapObj (C.tensor X Y))
  preservationUnit : D.hom D.unit (mapObj C.unit)
  monoidalCoherence : Prop
  symmetricCoherence : Prop

structure MonoidalNaturalTransformation {C D : SymmetricMonoidalCategory}
    (F G : MonoidalFunctor C D) where
  component : ∀ X : C.obj, D.hom (F.mapObj X) (G.mapObj X)
  naturality : Prop
  monoidalCompatibility : Prop

def MonoidalNaturalTransformationClosed {C D : SymmetricMonoidalCategory}
    {F G : MonoidalFunctor C D} (η : MonoidalNaturalTransformation F G) : Prop :=
  η.naturality ∧ η.monoidalCompatibility

structure FunctorEvidence (C D : SymmetricMonoidalCategory) (F : MonoidalFunctor C D) where
  monoidalCoherenceClosed : F.monoidalCoherence
  symmetricCoherenceClosed : F.symmetricCoherence

def MonoidalFunctorClosed (C D : SymmetricMonoidalCategory) (F : MonoidalFunctor C D) : Prop :=
  F.monoidalCoherence ∧ F.symmetricCoherence

theorem monoidal_functor_closed_from_evidence (C D : SymmetricMonoidalCategory)
    (F : MonoidalFunctor C D) (E : FunctorEvidence C D F) : MonoidalFunctorClosed C D F := by
  exact And.intro E.monoidalCoherenceClosed E.symmetricCoherenceClosed

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse