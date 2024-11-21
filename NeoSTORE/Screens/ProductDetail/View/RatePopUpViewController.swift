//
//  RatePopUpViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/15/24.
//

import UIKit

protocol ProductQuantityDelegate{
    func onDismiss(productQty: Int)
}
class RatePopUpViewController: UIViewController {
    @IBOutlet var lblProductName: UILabel!
    
    @IBOutlet var startRating: StarRatingView!
    
    @IBOutlet var productImage: UIImageView!
    
    @IBOutlet var qtyTextField: UITextField!
    
    @IBOutlet var dismissView1: UIView!
    
    @IBOutlet var dismissView2: UIView!
    
    @IBOutlet var qtyLbl: UILabel!
    @IBOutlet var button: UIButton!
    
    @IBOutlet var popUpView: UIView!
    
    
    var product: ProductDetailData?
    var id : Int?
    var viewModel = RatingViewModel()
    var delegate : ProductQuantityDelegate?
   // var onDismiss: (() -> Void)?
var viewModel2 = CartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black.withAlphaComponent(0.6)
        startRating.rating =  2
        popUpView.layer.cornerRadius = 15
        setData()
        hideKeyboardWhenTappedAround()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissPopUp))
        dismissView1.addGestureRecognizer(tap)
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(dismissPopUp))
        dismissView2.addGestureRecognizer(tap1)
        addTapGestures()
        setupViewModelBindings()
        
    }
    
    private func addTapGestures() {
        for (index, imageView) in startRating.starImageViews.enumerated() {
            imageView.isUserInteractionEnabled = true
            imageView.tag = index
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleStarTap(_:)))
            imageView.addGestureRecognizer(tapGesture)
        }
    }
    
    @objc private func handleStarTap(_ gesture: UITapGestureRecognizer) {
        guard let tappedStar = gesture.view else { return }
        startRating.rating = tappedStar.tag + 1
    }
    
    private func setData(){
        guard let product else {return}
        
        lblProductName.text = product.name
        if let imgurl = URL(string: product.product_images[0].image){
            productImage.loadImage(from: imgurl)
        }
        
        if id == 1 {
            qtyTextField.isHidden = true
            qtyLbl.isHidden = true
            button.setTitle("RATE NOW", for: .normal)
        } else if id == 2 {
            qtyTextField.isHidden = false
            qtyLbl.isHidden = false
            startRating.isHidden = true
            button.setTitle("SUBMIT", for: .normal)
        }
    }
    
    private func setupViewModelBindings() {
        viewModel.eventHandler = { [weak self] event in
            DispatchQueue.main.async {
                switch event {
                case .loading:
                    print("Loading...")
                case .stopLoading:
                    print("Stopped Loading.")
                case .dataLoaded:
                    self?.handleRatingSuccess()
                case .error(let error):
                    print(error?.localizedDescription)
                }
            }
        }
    }
    private func handleRatingSuccess() {
        if let userMessage = viewModel.ratingResponse?.user_msg {
            print(userMessage)
        }
    }
    
    //MARK: IBAction
    @IBAction func rateButtonTapped(_ sender: Any) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            
            if self.id == 1 {
                print(self.startRating.rating ,"Star Rating Given")
                guard let product = self.product else { return }
                self.viewModel.setRating(productId: "\(product.id)",
                                         rating: self.startRating.rating)
                let alertController = UIAlertController(title: "RATING SUCCESSFULL", message: "THANK YOU FOR RATING !", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    self.dismiss(animated: true)
                }
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            }
            else if self.id == 2{
                
                guard let product = self.product else {return}
                //            let storyboard = UIStoryboard(name: "OrderScreen", bundle: nil).instantiateViewController(withIdentifier: "CartViewController") as!  CartViewController
                //            self.navigationController?.pushViewController(storyboard, animated: true)
                
                //            self.dismiss(animated: true, completion: {
                //                self.onDismiss?()
                let quantity = Int(self.qtyTextField.text ?? "") ?? 0
                self.viewModel2.addToCart(productId: product.id, quantity: quantity)
                self.dismiss(animated: true)
                self.delegate?.onDismiss(productQty: quantity)
              
            }
        }
    }
    @objc func  dismissPopUp(_ sender : UITapGestureRecognizer){
        dismiss(animated: true)
    }
}
