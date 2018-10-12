var ltab = [23,2,5,574,687,68,0,87,68]
var cards = Deck.allCards

print("Printing The original list:")
print(ltab)
print("\nPrinting The Shufflesd list:")
ltab.shuffle()
print(ltab)


print("\n\n\nPrinting The original cards:")
print(cards)

cards.shuffle()

print("\nPrinting The Shufflesd cards:")
print(cards)