import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure MacLaneStrictnessPackage where
  strictificationFunctor : Type
  equivalenceWithOriginal : Prop
  strictnessCondition : Prop
  equivalenceWithOriginalTerm : equivalenceWithOriginal
  strictnessConditionTerm : strictnessCondition

structure MacLaneStrictnessEvidence (M : MacLaneStrictnessPackage) where
  equivalenceWithOriginalClosed : M.equivalenceWithOriginal
  strictnessConditionClosed : M.strictnessCondition

def MacLaneStrictnessClosed (M : MacLaneStrictnessPackage) : Prop :=
  M.equivalenceWithOriginal ∧ M.strictnessCondition

theorem mac_lane_strictness_closed_from_evidence (M : MacLaneStrictnessPackage)
    (E : MacLaneStrictnessEvidence M) : MacLaneStrictnessClosed M := by
  exact And.intro E.equivalenceWithOriginalClosed E.strictnessConditionClosed

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse
