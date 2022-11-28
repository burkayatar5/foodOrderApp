//
//  BasketTableViewCell.swift
//  foodOrderDemoProject
//
//  Created by Burkay Atar on 28.11.2022.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var basketFoodImage: UIImageView!
    @IBOutlet weak var basketFoodNameLabel: UILabel!
    @IBOutlet weak var basketFoodOrderAmountLabel: UILabel!
    @IBOutlet weak var basketFoodPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
