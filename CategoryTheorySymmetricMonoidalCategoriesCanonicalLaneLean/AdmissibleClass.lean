import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure AdmissibleClass where
  object : SymmetricMonoidalCategoryPackage
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  SymmetricMonoidalCategoryClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse