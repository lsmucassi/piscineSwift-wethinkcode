import Foundation

class Card: NSObject {
    var color: Color
    var value: Value
    
    init (col: Color, val: Value) {
        self.color = col
        self.value = val
        super.init()
    }

    override var description: String {
        return ("This is a \(self.value) of \(self.color)")
    }

    override func isEqual(_ object: Any? ) -> Bool {
        if let obj = object as? Card {
            return (obj.value == self.value && obj.color == self.color)
        }
        return false
    }

   static func ==(lside: Card, rside: Card) -> Bool {
        return (lside.isEqual(rside))
    }
}
