import UIKit

class AppData{
    static var cart = [""]
    static var ingredients = [""]
    static var recipes = [""]
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell") as! myTableViewCell
        cell.labelOutlet?.text = AppData.ingredients[indexPath.row]
        
               return cell
    }
    
    
    @IBAction func AddFoodAction(_ sender: UIButton) {
        var blah = textFieldOutlet.text!
        AppData.ingredients.append(blah)
        tableViewOutlet.reloadData()
    }
    
    
   
}

