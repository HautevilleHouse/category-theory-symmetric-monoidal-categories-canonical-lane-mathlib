import canonicalLaneMathlib.AdmissibleClass
import CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.SymmetricMonoidalCategoryObjects

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure CoherencePackage (C : AdmittedSymmetricMonoidalCategory) where
  pentagon : C.obj.pentagonIdentity
  triangle : C.obj.triangleIdentity
  hexagon : C.obj.hexagonIdentity
  symmetryInvolutive : C.obj.symmetryInvolutive
  allCoherences : pentagon ∧ triangle ∧ hexagon ∧ symmetryInvolutive

structure CoherenceEvidence (C : AdmittedSymmetricMonoidalCategory) (P : CoherencePackage C) where
  pentagonClosed : P.pentagon
  triangleClosed : P.triangle
  hexagonClosed : P.hexagon
  symmetryInvolutiveClosed : P.symmetryInvolutive

def CoherenceClosed (C : AdmittedSymmetricMonoidalCategory) (P : CoherencePackage C) : Prop :=
  P.pentagon ∧ P.triangle ∧ P.hexagon ∧ P.symmetryInvolutive

theorem coherence_closed_from_evidence (C : AdmittedSymmetricMonoidalCategory)
    (P : CoherencePackage C) (E : CoherenceEvidence C P) : CoherenceClosed C P :=
  And.intro E.pentagonClosed
    (And.intro E.triangleClosed
      (And.intro E.hexagonClosed E.symmetryInvolutiveClosed))

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse