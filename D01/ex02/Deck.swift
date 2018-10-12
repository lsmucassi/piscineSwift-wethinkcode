import Foundation

class Deck: NSObject {
    static let allSpades: [Card]    = Value.allValues.map{Card(col: Color.spades, val: $0)}
    static let allHearts: [Card]    = Value.allValues.map{Card(col: Color.hearts, val: $0)}
    static let allClubs: [Card]     = Value.allValues.map{Card(col: Color.clubs, val: $0)}
    static let allDiamonds: [Card]  = Value.allValues.map{Card(col: Color.diamonds, val: $0)}

    static let allCards: [Card] = allSpades + allHearts + allClubs + allDiamonds
}