import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure DualObjectData where
  object : Type u
  dual : Type u
  unit : Type u
  evaluation : tensorProduct object dual → unit
  coevaluation : unit → tensorProduct dual object
  triangleCondition : Prop
  triangleConditionTerm : triangleCondition

structure DualObjectEvidence (D : DualObjectData) where
  triangleConditionClosed : D.triangleCondition

def DualObjectClosed (D : DualObjectData) : Prop :=
  D.triangleCondition

theorem dual_object_closed_from_evidence (D : DualObjectData)
    (E : DualObjectEvidence D) : DualObjectClosed D := by
  exact E.triangleConditionClosed

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse
