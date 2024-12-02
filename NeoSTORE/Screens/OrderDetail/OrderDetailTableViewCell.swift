//
//  OrderDetailTableViewCell.swift
//  NeoSTORE
//
//  Created by Apple on 12/2/24.
//

import UIKit

class OrderDetailTableViewCell: UITableViewCell {
    
    @IBOutlet var orderDeatilImg: UIImageView!
    
    @IBOutlet var orderDetailName: UILabel!
    
    @IBOutlet var orderDeatilCategory: UILabel!
    
    @IBOutlet var orderDeatilQty: UILabel!
    
    @IBOutlet var orderDetailCost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data : OrderData_details){
        orderDetailName.text = data.prod_name ?? "N/A"
        orderDeatilCategory.text = data.prod_cat_name ?? "N/A"
        orderDeatilQty.text = "Quantity: \(data.quantity ?? 0)"
        orderDetailCost.text = "Cost: \(data.total ?? 0)"
    }
    

}
