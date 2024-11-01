//
//  MyTableViewCell.swift
//  UsefulApp
//
//  Created by EVAN MEYER on 11/1/24.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelOutlet: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
