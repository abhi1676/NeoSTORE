//
//  SlideMenuTableViewCell.swift
//  NeoSTORE
//
//  Created by Apple on 11/9/24.
//

import UIKit

class SlideMenuTableViewCell: UITableViewCell {
    
    
    @IBOutlet var slideImage: UIImageView!
    

    @IBOutlet var slideItem: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
