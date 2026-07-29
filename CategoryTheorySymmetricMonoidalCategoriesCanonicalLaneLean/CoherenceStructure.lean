import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.SymmetricMonoidalCategoryPackage

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure CoherenceStructure {P : SymmetricMonoidalCategoryPackage} (hP : SymmetricMonoidalCategoryClosed P) where
  macLaneCoherence : Prop
  strictificationExists : Prop
  braidingNaturality : Prop
  macLaneCoherenceClosed : macLaneCoherence
  strictificationExistsClosed : strictificationExists
  braidingNaturalityClosed : braidingNaturality

structure CoherenceEvidence {P : SymmetricMonoidalCategoryPackage} {hP : SymmetricMonoidalCategoryClosed P} (C : CoherenceStructure hP) where
  macLaneCoherenceClosed : C.macLaneCoherence
  strictificationExistsClosed : C.strictificationExists
  braidingNaturalityClosed : C.braidingNaturality

def CoherenceClosed {P : SymmetricMonoidalCategoryPackage} {hP : SymmetricMonoidalCategoryClosed P} (C : CoherenceStructure hP) : Prop :=
  C.macLaneCoherence ∧ C.strictificationExists ∧ C.braidingNaturality

theorem coherence_closed_from_evidence
    {P : SymmetricMonoidalCategoryPackage} {hP : SymmetricMonoidalCategoryClosed P}
    (C : CoherenceStructure hP) (E : CoherenceEvidence C) : CoherenceClosed C := by
  exact And.intro E.macLaneCoherenceClosed
    (And.intro E.strictificationExistsClosed E.braidingNaturalityClosed)

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse