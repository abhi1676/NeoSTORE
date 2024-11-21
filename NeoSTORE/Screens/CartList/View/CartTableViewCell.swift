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
    
    var product : ProductDetailData?
    var quantityDidChange: ((Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        showQuantityDropdown()
        
        //        let editMenuInteraction = UIEditMenuInteraction(delegate: self)
        //             cartProductqty.addInteraction(editMenuInteraction)
    }
    
    //    func updateQuantity(_ quantity: Int) {
    //        qty = quantity
    //        cartProductqty.setTitle("\(quantity)", for: .normal)
    //
    //    }
    func configureCell(with product: ProductDetailData?, qty: Int) {
        cartProductqty.setTitle("\(String(describing: qty))", for: .normal)
        
        self.product = product
        cartProductName.text = product?.name
        cartProductCategory.text = product?.producer
        cartProductPrice.text = "₹\(Int(product?.cost ?? 1))"
        
        if let imageurl = URL(string: product?.product_images[0].image ?? "")
        {
            cartProductImg.loadImage(from: imageurl,placeholder: UIImage(named: "cricket"))
        }
    }
    
    
    private func showQuantityDropdown() {
        let menuItems: [UIAction] = (1...5).map { i in
            UIAction(title: "\(i)", handler: { [weak self] _ in
                self?.updateQuantity(i)
            })
        }
        let menu = UIMenu(title: "Select Quantity", children: menuItems)
        cartProductqty.menu = menu
        cartProductqty.showsMenuAsPrimaryAction = true
    }
    
    private func updateQuantity(_ quantity: Int) {
        cartProductqty.setTitle("\(quantity)", for: .normal)
        quantityDidChange?(quantity)
    }
    
    //extension CartTableViewCell: UIEditMenuInteractionDelegate {
    //    func editMenuInteraction(_ interaction: UIEditMenuInteraction, menuFor configuration: UIEditMenuConfiguration) -> UIMenu? {
    //        return UIMenu(title: "", children: [
    //            UIAction(title: "1", handler: { _ in self.updateQuantity(1) }),
    //            UIAction(title: "2", handler: { _ in self.updateQuantity(2) }),
    //            UIAction(title: "3", handler: { _ in self.updateQuantity(3) }),
    //            UIAction(title: "4", handler: { _ in self.updateQuantity(4) }),
    //            UIAction(title: "5", handler: { _ in self.updateQuantity(5) })
    //        ])
    //    }
    
}
extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while let responder = parentResponder {
            parentResponder = responder.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
