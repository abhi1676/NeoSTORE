//
//  OrderListTableViewCell.swift
//  NeoSTORE
//
//  Created by Apple on 11/22/24.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {

    @IBOutlet var orderID: UILabel!
    
    @IBOutlet var orderDate: UILabel!
    
    @IBOutlet var orderCost: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
}
