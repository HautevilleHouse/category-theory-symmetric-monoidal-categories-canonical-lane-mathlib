import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure CoherenceTheoremPackage where
  freeSymmetricMonoidalCategory : Type
  coherenceMorphismUnique : Prop
  coherenceMorphismUniqueTerm : coherenceMorphismUnique

structure CoherenceEvidence (C : CoherenceTheoremPackage) where
  coherenceMorphismUniqueClosed : C.coherenceMorphismUnique

def CoherenceClosed (C : CoherenceTheoremPackage) : Prop :=
  C.coherenceMorphismUnique

theorem coherence_closed_from_evidence (C : CoherenceTheoremPackage)
    (E : CoherenceEvidence C) : CoherenceClosed C := by
  exact E.coherenceMorphismUniqueClosed

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse
