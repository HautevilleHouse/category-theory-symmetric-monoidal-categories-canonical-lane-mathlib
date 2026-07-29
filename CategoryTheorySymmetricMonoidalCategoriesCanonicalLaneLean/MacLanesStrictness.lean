import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.Coherence

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure MacLaneStrictnessPackage {C : SymmetricMonoidalCategoryStructure}
    {P : CoherencePackage C} where
  strictMonoidalEquivalence : Prop
  strictifiesTo : Prop
  strictMonoidalEquivalenceTerm : strictMonoidalEquivalence
  strictifiesToTerm : strictifiesTo

structure MacLaneStrictnessEvidence {C : SymmetricMonoidalCategoryStructure}
    {P : CoherencePackage C} (M : MacLaneStrictnessPackage P) where
  strictMonoidalEquivalenceClosed : M.strictMonoidalEquivalence
  strictifiesToClosed : M.strictifiesTo

def MacLaneStrictnessClosed {C : SymmetricMonoidalCategoryStructure}
    {P : CoherencePackage C} (M : MacLaneStrictnessPackage P) : Prop :=
  M.strictMonoidalEquivalence ∧ M.strictifiesTo

theorem mac_lane_strictness_closed_from_evidence
    {C : SymmetricMonoidalCategoryStructure} {P : CoherencePackage C}
    (M : MacLaneStrictnessPackage P) (E : MacLaneStrictnessEvidence M) :
    MacLaneStrictnessClosed M := by
  exact And.intro E.strictMonoidalEquivalenceClosed E.strictifiesToClosed

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse