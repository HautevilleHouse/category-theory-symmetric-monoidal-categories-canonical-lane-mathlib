import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.SymmetricMonoidalCategoryPackage

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure StringDiagramCalculusPackage where
  diagramRepresentation : Type u
  compositionRule : Prop
  tensorProductRule : Prop
  braidingRule : Prop
  topologicalConsistency : Prop

structure StringDiagramCalculusEvidence (S : StringDiagramCalculusPackage) where
  compositionRuleClosed : S.compositionRule
  tensorProductRuleClosed : S.tensorProductRule
  braidingRuleClosed : S.braidingRule
  topologicalConsistencyClosed : S.topologicalConsistency

def StringDiagramCalculusClosed (S : StringDiagramCalculusPackage) : Prop :=
  S.compositionRule ∧ S.tensorProductRule ∧ S.braidingRule ∧ S.topologicalConsistency

theorem string_diagram_calculus_closed_from_evidence
    (S : StringDiagramCalculusPackage) (E : StringDiagramCalculusEvidence S) :
    StringDiagramCalculusClosed S := by
  exact And.intro E.compositionRuleClosed
    (And.intro E.tensorProductRuleClosed
      (And.intro E.braidingRuleClosed E.topologicalConsistencyClosed))

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse