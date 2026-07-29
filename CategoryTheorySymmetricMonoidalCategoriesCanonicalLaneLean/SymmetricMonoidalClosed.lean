import CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.SymmetricMonoidalCoherence

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure ClosedStructurePackage where
  internalHom : Type u → Type u → Type u
  evaluationMap : ∀ A B, internalHom A B ⊗ A ⟶ B
  coevaluationMap : ∀ A B, B ⟶ internalHom A (B ⊗ A)
  adjunction : ∀ A B C, (C ⊗ A ⟶ B) ≅ (C ⟶ internalHom A B)
  coherenceWithSymmetry : Prop

structure ClosedStructureEvidence (P : ClosedStructurePackage) where
  adjunctionClosed : P.adjunction
  coherenceWithSymmetryClosed : P.coherenceWithSymmetry

def ClosedStructureClosed (P : ClosedStructurePackage) : Prop :=
  P.adjunction ∧ P.coherenceWithSymmetry

theorem closed_structure_closed_from_evidence (P : ClosedStructurePackage) (E : ClosedStructureEvidence P) :
    ClosedStructureClosed P := by
  exact And.intro E.adjunctionClosed E.coherenceWithSymmetryClosed

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse