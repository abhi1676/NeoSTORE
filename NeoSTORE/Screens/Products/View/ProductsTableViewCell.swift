//
//  ProductsTableViewCell.swift
//  NeoSTORE
//
//  Created by Apple on 11/12/24.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    
    @IBOutlet var productImage: UIImageView!
    
    @IBOutlet var productName: UILabel!
    
    @IBOutlet var productMaker: UILabel!
    
    @IBOutlet var productPrice: UILabel!
    
    @IBOutlet var startView: StarRatingView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
