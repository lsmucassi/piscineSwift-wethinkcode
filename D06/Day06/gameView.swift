//
//  gameView.swift
//  Day06
//
//  Created by Linda MUCASSI on 2018/10/10.
//  Copyright © 2018 Linda MUCASSI. All rights reserved.
//

import Foundation
import UIKit

class gameView: UIView {
    
    var isCircle = false
    let rand = Int(arc4random_uniform(2) + 1)
    
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        if rand == 1 {
            self.layer.cornerRadius = self.frame.size.width/2
            self.clipsToBounds = true
            isCircle = true
            return .ellipse
        }
        else {
            return .rectangle
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isCircle = false
    }
    
    init(frame: CGRect, isCircle: Bool) {
        super.init(frame: frame)
        self.isCircle = isCircle
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}
