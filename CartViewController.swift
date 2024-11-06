import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.recipes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath)
        
       
        let recipeName = AppData.recipes[indexPath.row]
        
    
        let ingredients = getIngredientsForRecipe(at: indexPath.row)
        
        
        let accuracy = calculateAccuracy(for: ingredients)
        
       
        let ingredientsText = ingredients.joined(separator: ", ")
        
       
        let accuracyText = "\(accuracy * 100)%"
        
       
        cell.textLabel?.text = recipeName
        
        
        cell.detailTextLabel?.text = "Ingredients: \(ingredientsText)\nAccuracy: \(accuracyText)"
        
        return cell
    }
    
    
    func getIngredientsForRecipe(at index: Int) -> [String] {
        
        let startIndex = index * 8
        let endIndex = startIndex + 8
        
      
        let ingredients = AppData.ingredientsByRecipe[startIndex..<endIndex].filter { !$0.isEmpty }
        
        return Array(ingredients)
    }
    
    
    func calculateAccuracy(for ingredients: [String]) -> Double {
        var matchedIngredientsCount = 0
        
        
        for ingredient in ingredients {
            if AppData.cart.contains(ingredient) {
                matchedIngredientsCount += 1
            }
        }
        
      
        let accuracy = Double(matchedIngredientsCount) / Double(ingredients.count)
        
        return accuracy
    }
}

