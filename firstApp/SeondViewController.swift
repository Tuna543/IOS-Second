//
//  SeondViewController.swift
//  firstApp
//
//  Created by kuetcse on 26/5/21.
//  Copyright © 2021 kuetcse. All rights reserved.
//

import UIKit
var list = ["CSE", "EEE", "ECE", "BME"]
var count = 0

class SeondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "dept")
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        count = indexPath.row
        if(count==2){
        performSegue(withIdentifier: "kuet", sender: self)
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
