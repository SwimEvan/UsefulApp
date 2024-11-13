//
//  RecipeDetailViewController.swift
//  UsefulApp
//
//  Created by EVAN MEYER on 11/12/24.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var labelOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if(AppData.hi == 0){
            labelOutlet.text = "\(AppData.recipes[AppData.num]):\n\(AppData.instructions[AppData.num])"
        }
        else{
            labelOutlet.text = "\(AppData.favoriteRecipes[AppData.num]):\n\(AppData.instructions[AppData.num])"
        }
    }
}
