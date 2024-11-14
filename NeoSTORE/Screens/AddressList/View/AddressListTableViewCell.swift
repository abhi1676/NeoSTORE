//
//  AddressListTableViewCell.swift
//  NeoSTORE
//
//  Created by Apple on 11/14/24.
//

import UIKit

class AddressListTableViewCell: UITableViewCell {

    @IBOutlet var userNameLbl: UILabel!
    
    @IBOutlet var userAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
