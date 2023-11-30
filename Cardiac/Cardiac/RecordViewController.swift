//
//  RecordViewController.swift
//  Cardiac
//
//  Created by SHEAM SHAHARIAR on 26/12/22.
//

import UIKit

class RecordViewController: UIViewController {

    
    @IBOutlet weak var diastol: UITextField!
    
    
    @IBOutlet weak var systol: UITextField!
    
    
    @IBOutlet weak var height: UITextField!
    
    @IBOutlet weak var weight: UITextField!
    
    
    @IBOutlet weak var age: UITextField!
    
    @IBOutlet weak var show: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func submit(_ sender: UIButton) {
        
        
        guard let diastol = diastol.text else { return }
        guard let systol = systol.text else { return }
        
        guard let height = height.text else { return }
        guard let weight = weight.text else { return }
        guard let age = age.text else { return }
        
        var bmi: Float;
        var h: Float;
//        var w = Int(weight)
//        var hg = Int(height)
        
        let w = (weight as NSString).floatValue
        
        let hg = (height as NSString).floatValue
        
        let sys = (systol as NSString).intValue
        let dys = (diastol as NSString).intValue
        
        
        if systol.isEmpty || diastol.isEmpty || height.isEmpty || weight.isEmpty || age.isEmpty{
            
            
            let alert = UIAlertController(title: "Sorry", message: "You have to fill out all the fields", preferredStyle: .alert)
                      
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
                        //Cancel Action
                    }))
                     
                    DispatchQueue.main.async {
                        self.present(alert, animated: false, completion: nil)
                    }
            
        }
        
        else {
            h = (hg / 100) * (hg / 100) ;
            bmi = w / h;
            let s = NSString(format: "%.2f", bmi)
            
            var ans: String = "";
            
            if sys == 120 && dys == 80 {
                ans = "Normal"
            }
            else if dys < 80 || sys < 120 {
                ans = "Low"
            }
            else if sys > 120 || dys > 80 {
                ans = "High"
            }
            
            
            
            let alert = UIAlertController(title: "BMI:\(s)", message: "Your pressure is \(ans)", preferredStyle: .alert)
                      
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
                        //Cancel Action
                    }))
                     
                    DispatchQueue.main.async {
                        self.present(alert, animated: false, completion: nil)
                    }
            
        }
    }
    
    
    func deleteRecord()
        {
            print("Delete record function called")
        }
    
    
    @IBAction func info(_ sender: UIButton) {
        
            self.performSegue(withIdentifier: "gotonext", sender: self)
    }
    
    
    @IBAction func corona(_ sender: UIButton) {
        
        
            self.performSegue(withIdentifier: "next", sender: self)
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
