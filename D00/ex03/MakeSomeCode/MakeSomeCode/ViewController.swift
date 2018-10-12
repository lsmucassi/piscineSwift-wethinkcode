//
//  ViewController.swift
//  calculator
//
//  Created by Sebastian Hette on 12.12.2016.
//  Copyright © 2016 MAGNUMIUM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0;
    var chain:Double = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else {
            label.text = label.text! + String(sender.tag-1)
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
       if label.text != "" && sender.tag != 15 && sender.tag != 16 && sender.tag != 17 {
            previousNumber = Double(label.text!)!
                if sender.tag == 11  { //Divid
                    label.text = "/";
                }
                else if sender.tag == 12 { //Multiply
                    label.text = "x";
                } else if sender.tag == 13 { //Minus
                    label.text = "-";
                } else if sender.tag == 14 { //Plus
                    label.text = "+";
                }
                operation = sender.tag
                performingMath = true;
        }
        if sender.tag == 17 {
            if operation == 11  {
                if numberOnScreen == 0 {
                    label.text = "Can't divide by 0 "
                } else {
                    chain = previousNumber / numberOnScreen
                    label.text = String(chain)
                }
            }
            else if operation == 12 {
                chain += previousNumber * numberOnScreen
                label.text = String(chain)
            }
            else if operation == 13 {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 14 {
                label.text = String(previousNumber + numberOnScreen)
            }
        } else if sender.tag == 15 {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        } else if sender.tag == 16 {
            previousNumber = Double(label.text!)!
            if previousNumber == 0 {
                label.text = String(previousNumber)
            }
            previousNumber = previousNumber * -1
            label.text = String(previousNumber)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
