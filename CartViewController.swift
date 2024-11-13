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
        
        
        let accuracy: Double
               if ingredients.isEmpty {
                   accuracy = 0.0 // or some default value
               } else {
                   accuracy = calculateAccuracy(for: ingredients)
               }
        
       
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
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            // Create the "Add to Cart" action
            let addToCartAction = UIContextualAction(style: .normal, title: "Favorite") { (action, view, completionHandler) in
                // Get the ingredient that corresponds to this row
                let recipe = AppData.recipes[indexPath.row]
                // Add the ingredient to the cart
                AppData.favoriteRecipes.append(recipe)
                AppData.favoriteInstructions.append(AppData.instructions[indexPath.row])
            
                
                completionHandler(true)
                print("Favorite Recipes: \(AppData.favoriteRecipes)")
            }
            
            
            addToCartAction.backgroundColor = .systemGreen
            
        
            return UISwipeActionsConfiguration(actions: [addToCartAction])
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        AppData.num = indexPath.row
        let selectedRecipeIndex = indexPath.row
        AppData.hi = 0
        performSegue(withIdentifier: "detailVC", sender: indexPath)
                    }
        
}

