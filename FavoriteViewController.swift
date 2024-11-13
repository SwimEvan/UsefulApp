//
//  FavoriteViewController.swift
//  UsefulApp
//
//  Created by EVAN MEYER on 11/12/24.
//

import UIKit

class FavoriteViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tfOutlet: UITextField!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
                tableViewOutlet.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        tableViewOutlet.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.favoriteRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        
      
        cell.textLabel?.text = AppData.favoriteRecipes[indexPath.row]
        
        return cell
    }
    @IBAction func addFavAction(_ sender: UIButton) {
        AppData.favoriteRecipes.append(tfOutlet.text!)
        tableViewOutlet.reloadData()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        AppData.num = indexPath.row
        let selectedRecipeIndex = indexPath.row
        AppData.hi = 1
        performSegue(withIdentifier: "recipeInstructions", sender: indexPath)
                    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
            let addToCartAction = UIContextualAction(style: .normal, title: "Remove") { (action, view, completionHandler) in
               
                AppData.favoriteRecipes.remove(at: indexPath.row)
                AppData.favoriteInstructions.remove(at: indexPath.row)
                self.tableViewOutlet.reloadData()
                
                completionHandler(true)
            }
            
            
        addToCartAction.backgroundColor = .systemRed
            
        
            return UISwipeActionsConfiguration(actions: [addToCartAction])
        }

}
