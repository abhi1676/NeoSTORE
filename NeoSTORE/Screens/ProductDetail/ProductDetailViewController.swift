//
//  ProductDetailViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/12/24.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var productName = ""
    var viewmodel : ProductDetailViewModel?
    var productId : Int?
    
    @IBOutlet var productNameLbl: UILabel!
    
    @IBOutlet var productCategoryLbl: UILabel!
    
    @IBOutlet var productInfoLbl: UILabel!
    
    @IBOutlet var productStarView: StarRatingView!
    
    @IBOutlet var shimmerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = productName
        self.navigationController?.navigationBar.topItem?.title = ""
        fetchProductDetail()
        self.observeEvent()
        shimmerView.isUserInteractionEnabled = false
        self.shimmerView.isShimmering = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }
    

    func setUpUI(data:ProductDetail?){
        productNameLbl.text = data?.data.name
         
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
        
        productInfoLbl.text = data?.data.producer
        if let rating = data?.data.rating{
            productStarView.rating = rating
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
    

}
