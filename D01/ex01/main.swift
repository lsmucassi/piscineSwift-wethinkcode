
let card_one: Card = Card(col: Color.clubs, val: Value.five)
let card_two: Card = Card(col: Color.hearts, val: Value.seven)
let card_three: Card = Card(col: Color.diamonds, val: Value.ace)
let card_four: Card = Card(col: Color.clubs, val: Value.five)

print("Value and card types")
print(card_one)
print(card_two)
print(card_three)
print(card_four)

print("\nFirst comparison")
print(card_one.isEqual(card_three))
print(card_two.isEqual(card_one))
print(card_three.isEqual(card_three))
print(card_four.isEqual(card_one))

print("\nSecond comparison")
print(card_one == card_two)
print(card_two == card_one)
print(card_three == card_two)
print(card_four == card_one)
