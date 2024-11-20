//
//  CartTableViewCell.swift
//  NeoSTORE
//
//  Created by Apple on 11/20/24.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet var cartProductImg: UIImageView!
    
    @IBOutlet var cartProductName: UILabel!
    
    @IBOutlet var cartProductCategory: UILabel!
    
    @IBOutlet var cartProductqty: UIButton!
    
    @IBOutlet var cartProductPrice: UILabel!
    
    var qty : Int?
    
    var product : ProductDetailData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cartProductqty.setTitle("\(1)", for: .normal)
       cartProductqty.isUserInteractionEnabled = true
        self.isUserInteractionEnabled = true
        let editMenuInteraction = UIEditMenuInteraction(delegate: self)
             cartProductqty.addInteraction(editMenuInteraction)
    }

    func updateQuantity(_ quantity: Int) {
        qty = quantity
        cartProductqty.setTitle("\(quantity)", for: .normal)
        
    }
    func configureCell(with product: ProductDetailData?) {
          self.product = product
          
         
        cartProductName.text = product?.name
          cartProductCategory.text = product?.producer
        cartProductPrice.text = "₹\(Int(product!.cost))"
          
        if let imageurl = URL(string: product?.product_images[0].image ?? "")
        {
            cartProductImg.loadImage(from: imageurl,placeholder: UIImage(named: "cricket"))
        }
      }
  }
extension CartTableViewCell: UIEditMenuInteractionDelegate {
    func editMenuInteraction(_ interaction: UIEditMenuInteraction, menuFor configuration: UIEditMenuConfiguration) -> UIMenu? {
        return UIMenu(title: "", children: [
            UIAction(title: "1", handler: { _ in self.updateQuantity(1) }),
            UIAction(title: "2", handler: { _ in self.updateQuantity(2) }),
            UIAction(title: "3", handler: { _ in self.updateQuantity(3) }),
            UIAction(title: "4", handler: { _ in self.updateQuantity(4) }),
            UIAction(title: "5", handler: { _ in self.updateQuantity(5) })
        ])
    }
}
