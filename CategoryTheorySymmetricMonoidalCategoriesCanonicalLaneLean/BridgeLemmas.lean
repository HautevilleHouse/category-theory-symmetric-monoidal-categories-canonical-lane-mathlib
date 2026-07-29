import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SymmetricMonoidalCategoryClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  rcases A with ⟨obj, _, _, _⟩
  sorry

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse