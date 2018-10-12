//
//  ViewController.swift
//  MoarBtn
//
//  Created by Linda MUCASSI on 2018/10/01.
//  Copyright © 2018 Linda MUCASSI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var equalTo: UIButton!
    @IBOutlet weak var resetCalc: UIButton!
    @IBOutlet weak var subtract: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var neg: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //operands
    @IBAction func pressZero(_ sender: Any) {
        display.text = "0"
        print("pressed zero : 0")
    }
    
    @IBAction func pressOne(_ sender: Any) {
        display.text = "1"
        print("pressed one : 1")
    }
    
    @IBAction func pressTwo(_ sender: Any) {
        display.text = "2"
        print("pressed two : 2")
    }
    
    @IBAction func pressThree(_ sender: Any) {
        display.text = "3"
        print("pressed three : 3")
    }
    
    @IBAction func pressFour(_ sender: Any) {
        display.text = "4"
        print("pressed four : 4")
    }
    
    @IBAction func pressFive(_ sender: Any) {
        display.text = "5"
        print("pressed five : 5")
    }
    
    @IBAction func pressSix(_ sender: Any) {
        display.text = "6"
        print("pressed six : 6")
    }
    
    @IBAction func pressSeven(_ sender: Any) {
        display.text = "7"
        print("pressed seven : 7")
    }
    
    @IBAction func pressEight(_ sender: Any) {
        display.text = "8"
        print("pressed eight : 8")
    }
    
    @IBAction func pressNine(_ sender: Any) {
        display.text = "9"
        print("pressed nine : 9")
    }
    
    //operations
    @IBAction func divideBy(_ sender: Any) {
        print("pressed divide : /")
    }
    
    @IBAction func multiplyer(_ sender: Any) {
        print("pressed multiply : x")
    }
    
    @IBAction func add(_ sender: Any) {
        print("pressed plus : +")
    }
    
    @IBAction func subtract(_ sender: Any) {
        print("pressed minus : -")
    }
    
    @IBAction func reseter(_ sender: Any) {
        print("pressed reset : AC")
    }
    
    @IBAction func equalTo(_ sender: Any) {
        print("pressed equal to : =")
    }
    @IBAction func negator(_ sender: Any) {
        print("pressed Negation : NEG")
    }
}
