//
//  ProductDetailViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/12/24.
//

import UIKit

class ProductDetailViewController: UIViewController{
    
    
    var productName = ""
    var viewmodel : ProductDetailViewModel?
    var productId : Int?
    var ratePopUp = RatePopUpViewController()
    
    @IBOutlet var shimmerView: UIView!
    
    @IBOutlet var productNameLbl: UILabel!
    @IBOutlet var productCategoryLbl: UILabel!
    @IBOutlet var productInfoLbl: UILabel!
    @IBOutlet var productStarView: StarRatingView!
    @IBOutlet var productPrice: UILabel!
    
    @IBOutlet var shareButton: UIButton!
    
    @IBOutlet var productImage1: UIImageView!
    @IBOutlet var productImage2: UIImageView!
    @IBOutlet var productImage3: UIImageView!
    @IBOutlet var productImage4: UIImageView!
    
    @IBOutlet var productDescription: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        fetchProductDetail()
        self.observeEvent()
        self.shimmerView.isUserInteractionEnabled = false
        self.shimmerView.isShimmering = true
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1.0, green: 0.149, blue: 0.0, alpha: 1.0)
        setUpImages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = productName
        ratePopUp.delegate = self
        
    }
    
    func setUpUI(data:ProductDetail?){
        guard let product = data?.data else {return}
        productNameLbl.text = product.name
        productPrice.text = "Rs\(product.cost)"
        switch viewmodel?.productDetail?.data.product_category_id {
        case 1:
            productCategoryLbl.text = "Category - Table"
        case 2:
            productCategoryLbl.text = "Category - Chaie"
        case 3:
            productCategoryLbl.text = "Category - Sofa"
        case 4:
            productCategoryLbl.text = "Category - Cupboard"
        default:
            break
        }
        productInfoLbl.text = product.producer
        productStarView.rating = product.rating
        if let imgurl = URL(string: product.product_images[0].image){
            productImage1.loadImage(from: imgurl)
            productImage2.loadImage(from: imgurl)
            productImage3.loadImage(from: imgurl)
            productImage4.loadImage(from: imgurl)
        }
    }
    func fetchProductDetail(){
        viewmodel = ProductDetailViewModel()
        viewmodel?.fetchProductDetails(productId: productId ?? 1) {
            
            DispatchQueue.main.async {
                self.setUpUI(data: self.viewmodel?.productDetail )
            }
        }
    }
    
    func observeEvent(){
        viewmodel?.eventHandler = { [weak self] event in
            guard let self = self else {return}
            
            switch event {
            case .loading :
                
                self.shimmerView.isHidden = false
                self.shimmerView.startShimmering()
                print("loading")
                
            case .stopLoading :
                self.shimmerView.stopShimmering()
                DispatchQueue.main.async {
                    self.shimmerView.isHidden = true
                }
                print("Loading Stopped")
            case .dataLoaded :
                print("data loaded")
                self.shimmerView.stopShimmering()
                DispatchQueue.main.async {
                    self.shimmerView.isHidden = true
                }
                
            case .error(let error):
                print(error ?? "error")
            }
        }
    }
    
    func setUpImages(){
        productImage2.layer.borderWidth = 1
        productImage3.layer.borderWidth = 1
        productImage4.layer.borderWidth = 1
        
        productImage2.layer.borderColor = UIColor.red.cgColor
        productImage2.layer.borderColor = UIColor.black.cgColor
        productImage2.layer.borderColor = UIColor.green.cgColor
    }
    @IBAction func shareButtonTapped(_ sender: Any) {
        navigate(storyboardName: "AccountScreen", viewControllerID: "MyAccountViewController")
    }
    
    @IBAction func productBuyButtonTapped(_ sender: Any) {
        //navigate(storyboardName: "OrderScreen", viewControllerID: "AddressViewController")
        let ratepop = RatePopUpViewController()
        
        guard let product = viewmodel?.productDetail?.data  else {return}
        //        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RatePopUpViewController") as RatePopUpViewController
        ratepop.product = product
        ratepop.id = 2
        //        ratepop.onDismiss = { [weak self] in
        //                    self?.navigateToCartViewController(with: product)
        //                }
        ratepop.delegate = self
        ratepop.modalPresentationStyle = .overCurrentContext
        ratepop.modalTransitionStyle = .crossDissolve
        present(ratepop, animated: true)
    }
    
    @IBAction func productRateButtonTapped(_ sender: Any) {
        let ratepop = RatePopUpViewController()
        
        //navigate(storyboardName: "OrderScreen", viewControllerID: "AddressListViewController")
        guard let product = viewmodel?.productDetail?.data  else {return}
        ratepop.product = product
        ratepop.id = 1
        ratepop.modalPresentationStyle = .overCurrentContext
        ratepop.modalTransitionStyle = .crossDissolve
        present(ratepop, animated: true)
    }
    
    
}


extension ProductDetailViewController: ProductQuantityDelegate {
    func onDismiss(productQty: Int) {
        let storyboard = UIStoryboard(name: "OrderScreen", bundle: nil)
        if let cartVC = storyboard.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController {
            cartVC.product = viewmodel?.productDetail?.data
            cartVC.productQty = productQty
            self.navigationController?.pushViewController(cartVC, animated: true)
        }
    }
}
