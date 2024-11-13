import UIKit

class AppData{
    static var favoriteInstructions = [String]()
    static var hi = 0
    static var num = 10
    static var favoriteRecipes = [String]()
    static var ingredientsByRecipe = [
        "spaghetti", "ground beef", "tomato sauce", "onion", "garlic", "olive oil", "salt", "pepper", "",
        "chicken", "curry powder", "coconut milk", "onion", "garlic", "ginger", "vegetable oil", "salt", "",
        "bell pepper", "broccoli", "carrot", "soy sauce", "ginger", "garlic", "sesame oil", "",
        "ground beef", "taco shells", "lettuce", "tomato", "cheese", "sour cream", "taco seasoning", "",
        "romaine lettuce", "Caesar dressing", "croutons", "parmesan cheese", "lemon", "",
        "salmon fillets", "olive oil", "lemon", "garlic", "dill", "salt", "pepper", "",
        "flour", "milk", "egg", "baking powder", "sugar", "salt", "butter", "",
        "pie crust", "eggs", "cream", "bacon", "cheese", "onion", "salt", "pepper", "",
        "ground beef", "kidney beans", "tomato sauce", "onion", " garlic", "chili powder", "cumin", "salt", "",
        "flour", "butter", "sugar", "brown sugar", "egg", "vanilla extract", "baking soda", "chocolate chips"
    ]
    static var instructions = [
        "1. Cook spaghetti according to package instructions. 2. In a pan, sauté onion and garlic, then add ground beef. 3. Once browned, add tomato sauce and simmer. 4. Serve sauce over spaghetti.",
        "1. In a pot, heat oil and sauté onion, garlic, and ginger. 2. Add chicken and curry powder, cook until browned. 3. Pour in coconut milk and simmer. 4. Serve with rice.",
        "1. Chop all vegetables. 2. Heat oil in a wok and stir fry garlic and ginger. 3. Add vegetables and soy sauce, cook until tender. 4. Serve hot.",
        "1. Brown ground beef in a pan. 2. Add taco seasoning and water, simmer. 3. Fill taco shells with beef, lettuce, tomato, and cheese.",
        "1. Toss romaine with Caesar dressing. 2. Add croutons and parmesan. 3. Squeeze lemon on top before serving.",
        "1. Preheat grill. 2. Season salmon with oil, garlic, dill, salt, and pepper. 3. Grill for about 6-8 minutes per side.",
        "1. Mix flour, baking powder, sugar, and salt. 2. In another bowl, combine milk, egg, and melted butter. 3. Mix wet and dry ingredients, then cook on a griddle.",
        "1. Preheat oven to 375°F. 2. Whisk eggs and cream, add bacon, cheese, and onion. 3. Pour into pie crust and bake until set.",
        "1. Brown ground beef, then add onion and garlic. 2. Stir in tomato sauce, beans, and spices. 3. Simmer for 30 minutes and serve.",
        "1. Preheat oven to 350°F. 2. Cream butter and sugars, then add egg and vanilla. 3. Mix in flour and chocolate chips. 4. Bake until golden."
    ]
    static var recipes = [
        "Spaghetti Bolognese",
        "Chicken Curry",
        "Vegetable Stir Fry",
        "Beef Tacos",
        "Caesar Salad",
        "Grilled Salmon",
        "Pancakes",
        "Quiche Lorraine",
        "Chili Con Carne",
        "Chocolate Chip Cookies"
    ]
    static var ingredients = [
        "potato",
        "spaghetti",
        "ground beef",
        "tomato sauce",
        "onion",
        "garlic",
        "olive oil",
        "salt",
        "pepper",
        "chicken",
        "curry powder",
        "coconut milk",
        "bell pepper",
        "broccoli",
        "carrot",
        "soy sauce",
        "ginger",
        "sesame oil",
        "taco shells",
        "lettuce",
        "tomato",
        "cheese",
        "sour cream",
        "taco seasoning",
        "romaine lettuce",
        "Caesar dressing",
        "croutons",
        "parmesan cheese",
        "lemon",
        "salmon fillets",
        "dill",
        "butter",
        "pie crust",
        "cream",
        "bacon",
        "vanilla extract",
        "baking soda",
        "chocolate chips"
    ]
    static var cart = [String]()
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! myTableViewCell
        cell.labelOutlet?.text = AppData.ingredients[indexPath.row]
        
               return cell
    }
    
    
    @IBAction func AddFoodAction(_ sender: UIButton) {
        var blah = textFieldOutlet.text!
        AppData.ingredients.append(blah)
        tableViewOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            // Create the "Add to Cart" action
            let addToCartAction = UIContextualAction(style: .normal, title: "Add to Cart") { (action, view, completionHandler) in
                // Get the ingredient that corresponds to this row
                let ingredient = AppData.ingredients[indexPath.row]
                // Add the ingredient to the cart
                AppData.cart.append(ingredient)
                
            
                
                completionHandler(true)
            }
            
            
            addToCartAction.backgroundColor = .systemGreen
            
        
            return UISwipeActionsConfiguration(actions: [addToCartAction])
        }
}

