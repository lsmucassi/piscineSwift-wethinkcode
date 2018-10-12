//
//  ViewController.swift
//  HelloWorld
//
//  Created by Linda MUCASSI on 2018/10/01.
//  Copyright © 2018 Linda MUCASSI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnIsClicked: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cliclMePressed(_ sender: Any) {
        print("Hello World !")
    }
}

