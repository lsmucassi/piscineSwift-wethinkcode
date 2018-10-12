//
//  ViewController.swift
//  Day06
//
//  Created by Linda MUCASSI on 2018/10/09.
//  Copyright © 2018 Linda MUCASSI. All rights reserved.
//

import UIKit
import CoreGraphics
import CoreMotion

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var squareView: UIView!
    var counter = 1;
    
    let gg = gameView()
    
    var gravity: UIGravityBehavior!
    var animator: UIDynamicAnimator!
    var collision: UICollisionBehavior!
    var itemBehaviour: UIDynamicItemBehavior!
    let MotionManager = CMMotionManager()
    let MotionQueue = OperationQueue.main

    override func viewDidLoad() {
        super.viewDidLoad()
        if (MotionManager.isAccelerometerAvailable)
        {
            MotionManager.accelerometerUpdateInterval = 0.2
            MotionManager.startAccelerometerUpdates(to: MotionQueue, withHandler: gravityUpdated as! CMAccelerometerHandler)
        }
        let tapGesteur = UITapGestureRecognizer(target: self, action: #selector(tapScreen))
        view.addGestureRecognizer(tapGesteur )
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior()
        gravity.magnitude = 5
        animator.addBehavior(gravity)
        collision = UICollisionBehavior()
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        itemBehaviour = UIDynamicItemBehavior()
        itemBehaviour.elasticity = 0.5
        itemBehaviour.angularResistance = 0
        animator.addBehavior(itemBehaviour)
    }
    
    
    @objc func testGesture(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            gravity.removeItem(gesture.view!)
            print("Began")
        case .changed:
            gesture.view?.center = gesture.location(in: self.view)
            animator.updateItem(usingCurrentState: gesture.view!)
        case .cancelled:
            print("Cancelled")
        case .ended:
            gravity.addItem(gesture.view!)
            print("Ended")
        case .failed:
            print("Failed")
        case .possible:
            print("possible")
        }
    }
    
    @objc func rotateGesture(gesture: UIRotationGestureRecognizer) {
        switch gesture.state {
        case .began:
            print("Began")
        case .changed:
            gesture.view?.transform = CGAffineTransform(rotationAngle: gesture.rotation)
            animator.updateItem(usingCurrentState: gesture.view!)
        case .cancelled:
            print("Cancelled")
        case .ended:
            itemBehaviour.removeItem(gesture.view!)
            collision.removeItem(gesture.view!)
            gravity.removeItem(gesture.view!)
            collision.addItem(gesture.view!)
            gravity.addItem(gesture.view!)
            itemBehaviour.addItem(gesture.view!)
            print("Ended")
        case .failed:
            print("Failed")
        case .possible:
            print("possible")
        }
    }
    
    var prevRect: CGRect!
    @objc func pinchGesture(gesture: UIPinchGestureRecognizer) {
        switch gesture.state {
        case .began:
            print("Began")
        case .changed:
            gesture.view?.layer.bounds.size.height *= gesture.scale
            gesture.view?.layer.bounds.size.width *= gesture.scale
            if let tata = gesture.view! as? gameView {
                if tata.isCircle{
                    gesture.view!.layer.cornerRadius *= gesture.scale
                }
            }
            gesture.scale = 1
        case .cancelled:
            print("Cancelled")
        case .ended:
            
            collision.removeItem(gesture.view!)
            gravity.removeItem(gesture.view!)
            itemBehaviour.removeItem(gesture.view!)
            collision.addItem(gesture.view!)
            gravity.addItem(gesture.view!)
            itemBehaviour.addItem(gesture.view!)
            
            print("Ended")
        case .failed:
            print("Failed")
        case .possible:
            print("possible")
        }
    }
    
    @objc func tapScreen(sender: UITapGestureRecognizer) {
        let location_x = sender.location(in: self.view).x - 50
        let location_y = sender.location(in: self.view).y - 50
        let game = gameView(frame: CGRect(x: location_x, y: location_y, width: 100, height: 100))
        game.isUserInteractionEnabled = true
        let rand = Int(arc4random_uniform(3) + 1)
        switch rand {
        case 1:
            game.backgroundColor = UIColor.blue
        case 2:
            game.backgroundColor = UIColor.green
        case 3:
            game.backgroundColor = UIColor.red
        default:
            game.backgroundColor = UIColor.green
        }
        
        
        view.addSubview(game)
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(testGesture))
        gesture.delegate = self
        game.addGestureRecognizer(gesture)
        let gesture2 = UIRotationGestureRecognizer(target: self, action: #selector(rotateGesture))
        gesture2.delegate = self
        game.addGestureRecognizer(gesture2)
        let gesture3 = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture))
        gesture3.delegate = self
        game.addGestureRecognizer(gesture3)
        
        
        gravity.addItem(game)
        collision.addItem(game)
        itemBehaviour.addItem(game)
        
    }
    
    func gravityUpdated(motion: CMAccelerometerData?, error: NSError?) {
        if (error != nil) {
            NSLog("\(String(describing: error))")
        }
        
        let grav : CMAcceleration = motion!.acceleration;
        
        let x = CGFloat(grav.x);
        let y = CGFloat(grav.y);
        var p = CGPoint(x: x,y: y)
        
        let orientation = UIApplication.shared.statusBarOrientation;
        
        if orientation == .landscapeLeft {
            let t = p.x
            p.x = 0 - p.y
            p.y = t
        } else if orientation == .landscapeRight {
            let t = p.x
            p.x = p.y
            p.y = 0 - t
        } else if orientation == .portraitUpsideDown {
            p.x *= -1
            p.y *= -1
        }
        
        let v = CGVector(dx: p.x ,dy: 0 - p.y);
        gravity.gravityDirection = v;
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    func accelerometerHandler(data: CMAccelerometerData?, error: NSError?) {
        print("accelerate")
    }
}


