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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.title = productName
        fetchProductDetail()
        
    }
    
    func fetchProductDetail(){
        viewmodel = ProductDetailViewModel()
        viewmodel?.fetchProductDetails(productId: productId!){
            DispatchQueue.main.async {
                self.viewDidLoad()
            }
        }
    }

    

}
