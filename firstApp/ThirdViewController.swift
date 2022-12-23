//
//  ThirdViewController.swift
//  firstApp
//
//  Created by kuetcse on 26/5/21.
//  Copyright © 2021 kuetcse. All rights reserved.
//

import UIKit

struct Student: Decodable {
    
    let id: String
    let name: String
    let address: String
    
}

class ThirdViewController: UIViewController {

    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://mocki.io/v1/3f8bf03a-8fa6-4119-9d32-082880b17d79"
        
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let pdata = data else {return}
            do {
            let student = try JSONDecoder().decode(Student.self, from: pdata )
                //print(student.name)
                self.label2.text = student.name
                
            } catch let jsonErr {
                print("error in parsing", jsonErr)
            }
            
        }.resume()

        // Do any additional setup after loading the view.
    }
    


}
