import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.SymmetricMonoidalStructure

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure MacLanePentagonPackage (C : SymmetricMonoidalCategory) where
  pentagonCoherence : Prop
  triangleCoherence : Prop
  pentagonDerivable : Prop
  triangleDerivable : Prop

structure MacLanePentagonEvidence {C : SymmetricMonoidalCategory} (M : MacLanePentagonPackage C) where
  pentagonCoherenceClosed : M.pentagonCoherence
  triangleCoherenceClosed : M.triangleCoherence
  pentagonDerivableClosed : M.pentagonDerivable
  triangleDerivableClosed : M.triangleDerivable

def MacLanePentagonClosed {C : SymmetricMonoidalCategory} (M : MacLanePentagonPackage C) : Prop :=
  M.pentagonCoherence ∧ M.triangleCoherence ∧ M.pentagonDerivable ∧ M.triangleDerivable

theorem mac_lane_pentagon_closed_from_evidence {C : SymmetricMonoidalCategory}
    (M : MacLanePentagonPackage C) (E : MacLanePentagonEvidence M) : MacLanePentagonClosed M := by
  exact And.intro E.pentagonCoherenceClosed
    (And.intro E.triangleCoherenceClosed
      (And.intro E.pentagonDerivableClosed E.triangleDerivableClosed))

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse