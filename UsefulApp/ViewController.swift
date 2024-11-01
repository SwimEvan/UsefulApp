//
//  ViewController.swift
//  UsefulApp
//
//  Created by EVAN MEYER on 10/28/24.
//

import UIKit

class AppData{
    static var cart = [""]
    static var list = [""]
    
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  

    @IBOutlet weak var tableViewCell: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyTableViewCell
        cell.textLabel?.text = AppData.cart[indexPath.row]
       
               return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(AppData.cart[indexPath.row])
    }
    

}

