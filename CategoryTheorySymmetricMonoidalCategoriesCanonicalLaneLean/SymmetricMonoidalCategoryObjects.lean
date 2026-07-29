import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure SymmetricMonoidalCategoryObject where
  carrier : Type
  tensorProduct : carrier → carrier → carrier
  unitObject : carrier
  associator : (X Y Z : carrier) → tensorProduct (tensorProduct X Y) Z ≅ tensorProduct X (tensorProduct Y Z)
  leftUnitor : (X : carrier) → tensorProduct unitObject X ≅ X
  rightUnitor : (X : carrier) → tensorProduct X unitObject ≅ X
  braiding : (X Y : carrier) → tensorProduct X Y ≅ tensorProduct Y X
  pentagonIdentity : Prop
  triangleIdentity : Prop
  hexagonIdentity : Prop
  symmetryInvolutive : Prop
  coherenceAll : pentagonIdentity ∧ triangleIdentity ∧ hexagonIdentity ∧ symmetryInvolutive

structure AdmittedSymmetricMonoidalCategory where
  obj : SymmetricMonoidalCategoryObject
  closedStructure : Prop
  internalHom : obj.carrier → obj.carrier → obj.carrier
  evaluationMap : (X Y : obj.carrier) → obj.tensorProduct (internalHom X Y) X → Y
  coevaluationMap : (X Y : obj.carrier) → Y → internalHom X (obj.tensorProduct Y X)
  tensorHomAdjunction : Prop
  homTensorAdjunction : Prop
  conclusion : tensorHomAdjunction ∧ homTensorAdjunction

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse