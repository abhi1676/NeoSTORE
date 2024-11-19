//
//  BaseViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/19/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func navigateToProductList(categoryId:Int) {
        let sb = UIStoryboard(name: "HomeScreen", bundle: nil)
      
         if let nextVc = sb.instantiateViewController(withIdentifier: "ProductListViewController") as? ProductListViewController
                
        {
             nextVc.categoryId = categoryId
             if let navigationController = self.navigationController {
                 navigationController.pushViewController(nextVc, animated: true)
             }
             else{
                 print("Error! In Navigation")
             }
             
         }
       
     }

}
