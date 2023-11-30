//
//  LoginViewController.swift
//  Cardiac
//
//  Created by SHEAM SHAHARIAR on 26/12/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func login(_ sender: UIButton) {
        
        guard let email = email.text else { return }
        guard let pass = pass.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: pass) { firebaseResult, error in
            if let e = error {
                print("error")
            }
            else {
                self.performSegue(withIdentifier: "gotonext", sender: self)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
