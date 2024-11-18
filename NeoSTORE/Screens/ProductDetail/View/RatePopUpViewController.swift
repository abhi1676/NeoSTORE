//
//  RatePopUpViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/15/24.
//

import UIKit

class RatePopUpViewController: UIViewController {
    @IBOutlet var lblProductName: UILabel!
    
    @IBOutlet var startRating: PopupStarRatingView!
    
    @IBOutlet var productImage: UIImageView!
    
    @IBOutlet var qtyTextField: UITextField!
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var popUpView: UIView!
    var product: ProductDetailData?
    var id : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black.withAlphaComponent(0.6)
        startRating.rating =  2
        popUpView.layer.cornerRadius = 15
        setData()
    }

    private func setData(){
        guard let product else {return}
        
        lblProductName.text = product.name
        if let imgurl = URL(string: product.product_images[0].image){
            productImage.loadImage(from: imgurl)
        }
        
        if id == 1 {
            qtyTextField.isHidden = true
            button.setTitle("RATE NOW", for: .normal)
        }
        else if id == 2{
            qtyTextField.isHidden = false
            startRating.isHidden = true
            button.setTitle("SUBMIT", for: .normal)
        }
    }
   
    @IBAction func backViewTapped(_ sender: Any) {
        dismiss(animated: true)

    }
    
    @IBAction func rateButtonTapped(_ sender: Any) {
        // api call rating
        dismiss(animated: true)
    }
}
