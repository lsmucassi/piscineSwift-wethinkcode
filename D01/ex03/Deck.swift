import Foundation

class Deck: NSObject {
    static let allSpades: [Card]    = Value.allValues.map{Card(col: Color.spades, val: $0)}
    static let allHearts: [Card]    = Value.allValues.map{Card(col: Color.hearts, val: $0)}
    static let allClubs: [Card]     = Value.allValues.map{Card(col: Color.clubs, val: $0)}
    static let allDiamonds: [Card]  = Value.allValues.map{Card(col: Color.diamonds, val: $0)}

    static let allCards: [Card] = allSpades + allHearts + allClubs + allDiamonds
}

// extension Array  {
//     var shuffle: [Element] {
//         var element = self
//         for i in indices {
//             let x = Int(arc4random_uniform(UInt32(element.count - i))) + i
//             if (x != i) {
//                 swap(&element[i], &element[x])
//             }
//         }
//         return element
//     }

extension Array {
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }

        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            self.swapAt(firstUnshuffled, i)
        }
    }
}