import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.BraidedMonoidalCategories

/-!
# Monoidal Equivalences and Coherence for Monoidal Functors
-/

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure MonoidalEquivalencePackage where
  functor : Type u → Type v
  tensorPreservation : Prop
  unitPreservation : Prop
  coherenceMorphism : Prop
  quasiInverse : Type u → Type v
  equivalenceWitness : Prop

structure MonoidalEquivalenceEvidence (Z : MonoidalEquivalencePackage) where
  tensorPreservationClosed : Z.tensorPreservation
  unitPreservationClosed : Z.unitPreservation
  coherenceMorphismClosed : Z.coherenceMorphism
  equivalenceWitnessClosed : Z.equivalenceWitness

def MonoidalEquivalenceClosed (Z : MonoidalEquivalencePackage) : Prop :=
  Z.tensorPreservation ∧ Z.unitPreservation ∧ Z.coherenceMorphism ∧ Z.equivalenceWitness

theorem monoidal_equivalence_closed_from_evidence (Z : MonoidalEquivalencePackage)
    (E : MonoidalEquivalenceEvidence Z) : MonoidalEquivalenceClosed Z := by
  exact And.intro E.tensorPreservationClosed
    (And.intro E.unitPreservationClosed
      (And.intro E.coherenceMorphismClosed E.equivalenceWitnessClosed))

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse