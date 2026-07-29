import canonicalLaneMathlib.AdmissibleClass
import CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.SymmetricMonoidalCategoryObjects

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure ClosedStructurePackage (C : AdmittedSymmetricMonoidalCategory) where
  internalHomDefined : (X Y : C.obj.carrier) → C.internalHom X Y ∈ C.obj.carrier
  evaluationMapDefined : (X Y : C.obj.carrier) → C.evaluationMap X Y ∈ (C.obj.tensorProduct (C.internalHom X Y) X → Y)
  coevaluationMapDefined : (X Y : C.obj.carrier) → C.coevaluationMap X Y ∈ (Y → C.internalHom X (C.obj.tensorProduct Y X))
  tensorHomAdjunctionHolds : C.tensorHomAdjunction
  homTensorAdjunctionHolds : C.homTensorAdjunction
  allStructure : tensorHomAdjunctionHolds ∧ homTensorAdjunctionHolds

structure ClosedStructureEvidence (C : AdmittedSymmetricMonoidalCategory)
    (S : ClosedStructurePackage C) where
  tensorHomAdjunctionClosed : S.tensorHomAdjunctionHolds
  homTensorAdjunctionClosed : S.homTensorAdjunctionHolds

def ClosedStructureClosed (C : AdmittedSymmetricMonoidalCategory)
    (S : ClosedStructurePackage C) : Prop :=
  S.tensorHomAdjunctionHolds ∧ S.homTensorAdjunctionHolds

theorem closed_structure_closed_from_evidence (C : AdmittedSymmetricMonoidalCategory)
    (S : ClosedStructurePackage C) (E : ClosedStructureEvidence C S) :
    ClosedStructureClosed C S :=
  And.intro E.tensorHomAdjunctionClosed E.homTensorAdjunctionClosed

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse