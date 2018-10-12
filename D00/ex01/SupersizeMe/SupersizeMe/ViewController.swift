//
//  ViewController.swift
//  SupersizeMe
//
//  Created by Linda MUCASSI on 2018/10/01.
//  Copyright © 2018 Linda MUCASSI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var changeText: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func chageText(_ sender: Any) {
        textLabel.text = "Hello world !"
    }
}

