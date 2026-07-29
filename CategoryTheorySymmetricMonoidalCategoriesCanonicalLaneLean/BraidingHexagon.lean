import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean.SymmetricMonoidalStructure

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean

structure BraidingPackage (C : SymmetricMonoidalCategory) where
  braidingNatural : Prop
  hexagonForward : Prop
  hexagonBackward : Prop
  involutive : Prop

structure BraidingEvidence {C : SymmetricMonoidalCategory} (B : BraidingPackage C) where
  braidingNaturalClosed : B.braidingNatural
  hexagonForwardClosed : B.hexagonForward
  hexagonBackwardClosed : B.hexagonBackward
  involutiveClosed : B.involutive

def BraidingClosed {C : SymmetricMonoidalCategory} (B : BraidingPackage C) : Prop :=
  B.braidingNatural ∧ B.hexagonForward ∧ B.hexagonBackward ∧ B.involutive

theorem braiding_closed_from_evidence {C : SymmetricMonoidalCategory}
    (B : BraidingPackage C) (E : BraidingEvidence B) : BraidingClosed B := by
  exact And.intro E.braidingNaturalClosed
    (And.intro E.hexagonForwardClosed
      (And.intro E.hexagonBackwardClosed E.involutiveClosed))

end CategoryTheorySymmetricMonoidalCategoriesCanonicalLaneLean
end HautevilleHouse