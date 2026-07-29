import CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure CoherencePackage where
  macLaneCoherence : Prop
  strictification : Prop
  graphicalCalculus : Prop
  coherenceConditionImplied : Prop

structure CoherenceEvidence (P : CoherencePackage) where
  macLaneCoherenceClosed : P.macLaneCoherence
  strictificationClosed : P.strictification
  graphicalCalculusClosed : P.graphicalCalculus
  coherenceConditionImpliedClosed : P.coherenceConditionImplied

def CoherenceClosed (P : CoherencePackage) : Prop :=
  P.macLaneCoherence ∧ P.strictification ∧ P.graphicalCalculus ∧ P.coherenceConditionImplied

theorem coherence_closed_from_evidence (P : CoherencePackage) (E : CoherenceEvidence P) :
    CoherenceClosed P := by
  exact And.intro E.macLaneCoherenceClosed
    (And.intro E.strictificationClosed
      (And.intro E.graphicalCalculusClosed E.coherenceConditionImpliedClosed))

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse