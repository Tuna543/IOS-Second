//
//  ViewController.swift
//  firstApp
//
//  Created by kuetcse on 26/5/21.
//  Copyright © 2021 kuetcse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var text1: UITextField!
    
    
    @IBAction func button1(_ sender: UIButton) {
        
        let pass = text1.text
        
        if(pass == "123"){
            label1.text = " HELLO WORLD "
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

