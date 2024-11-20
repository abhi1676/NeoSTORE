//
//  SlideViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/8/24.
//

import UIKit

class SlideViewController: UIViewController {

    @IBOutlet var slideMenuTableView: UITableView!
    
    let slideImages = ["shopping_cart","table","sofa","chair","cupboard","username_icon","storelocator_icon","myorders_icon","logout_icon"]
    let slideItems = ["My Cart","Tables","Sofas","Chairs","Cupboards","My Account","Store Locator","My Orders","Logout"]
    @IBOutlet var slideMenuView: UIView!
    
    @IBOutlet var fullname: UILabel!
    
    @IBOutlet var email: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SlideMenuTableViewCell", bundle: nil)
        slideMenuTableView.register(nib, forCellReuseIdentifier: "SlideMenuTableViewCell")
        slideMenuTableView.delegate = self
        slideMenuTableView.dataSource = self
        slideMenuView.layer.cornerRadius = 10
        
        fullname.text = UserDefaults.standard.string(forKey: Constants.fullname)
        email.text = UserDefaults.standard.string(forKey: Constants.email)
        
        
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

extension SlideViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        slideImages.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SlideMenuTableViewCell", for: indexPath) as! SlideMenuTableViewCell
        cell.layer.borderColor = UIColor.black.cgColor
        
        if indexPath.row == 0
        {
            let cartButton = UIButton(frame: CGRect(x: 230, y: 15, width: 26, height: 26))
            cartButton.backgroundColor = .red
            cartButton.setTitle("3", for: .normal)
            cartButton.layer.cornerRadius = 0.5 * cartButton.bounds.size.width
            cartButton.clipsToBounds = true
            cell.addSubview(cartButton)
            
        }
        cell.slideImage.image = UIImage(named: slideImages[indexPath.row])
        cell.slideItem.text = slideItems[indexPath.row]
        
        
      
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(false, forKey: "displayHomeNavBar")
        switch indexPath.row {
        case 0 :
            print("Cart tapped")
        case 1 :
            navigateToProductList(categoryId: 1)
        case 2 :
            navigateToProductList(categoryId: 3)
        case 3 :
            navigateToProductList(categoryId: 2)
        case 4 :
            navigateToProductList(categoryId: 4)
        default :
            break
        }
        
        
    }
    
    
}
