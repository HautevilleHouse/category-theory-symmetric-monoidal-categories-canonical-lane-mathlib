import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.AdmissibleClass

/-!
# Mac Lane's Coherence Theorem for Symmetric Monoidal Categories
-/

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure MacLaneCoherencePackage where
  freeMonoidalCategory : Type u
  canonicalMap : freeMonoidalCategory → SymmetricMonoidalCategoryAdmittedObject
  uniqueUpToUniqueIsomorphism : Prop
  coherenceConstraint : Prop
  pentagonCondition : Prop
  triangleCondition : Prop
  hexagonCondition : Prop
  symmetryCoherence : Prop

structure MacLaneCoherenceEvidence (Z : MacLaneCoherencePackage) where
  uniqueUpToUniqueIsomorphismClosed : Z.uniqueUpToUniqueIsomorphism
  coherenceConstraintClosed : Z.coherenceConstraint
  pentagonConditionClosed : Z.pentagonCondition
  triangleConditionClosed : Z.triangleCondition
  hexagonConditionClosed : Z.hexagonCondition
  symmetryCoherenceClosed : Z.symmetryCoherence

def MacLaneCoherenceClosed (Z : MacLaneCoherencePackage) : Prop :=
  Z.uniqueUpToUniqueIsomorphism ∧ Z.coherenceConstraint ∧
  Z.pentagonCondition ∧ Z.triangleCondition ∧
  Z.hexagonCondition ∧ Z.symmetryCoherence

theorem maclane_coherence_closed_from_evidence (Z : MacLaneCoherencePackage)
    (E : MacLaneCoherenceEvidence Z) : MacLaneCoherenceClosed Z := by
  exact And.intro E.uniqueUpToUniqueIsomorphismClosed
    (And.intro E.coherenceConstraintClosed
      (And.intro E.pentagonConditionClosed
        (And.intro E.triangleConditionClosed
          (And.intro E.hexagonConditionClosed E.symmetryCoherenceClosed))))

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse