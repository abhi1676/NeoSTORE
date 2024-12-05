//
//  SlideViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/8/24.
//

import UIKit

class SlideViewController: UIViewController {

    @IBOutlet var slideMenuTableView: UITableView!
    
    let slideImages = Constants.slideImages
    let slideItems = Constants.slideItems
    @IBOutlet var slideMenuView: UIView!
    
    @IBOutlet var fullname: UILabel!
    
    @IBOutlet var email: UILabel!
    
    @IBOutlet var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: Constants.slideMenuTableViewCell, bundle: nil)
        slideMenuTableView.register(nib, forCellReuseIdentifier:Constants.slideMenuTableViewCell)
        slideMenuTableView.delegate = self
        slideMenuTableView.dataSource = self
        slideMenuView.layer.cornerRadius = 10
        
        fullname.text = UserDefaults.standard.string(forKey: Constants.fullname)
        email.text = UserDefaults.standard.string(forKey: Constants.email)
        
        if let imageData = UserDefaults.standard.data(forKey: "profileImage") {
            profilePic.image = UIImage(data: imageData)
        } else {
            print("No image found in UserDefaults")
        }
        profilePic.layer.cornerRadius = profilePic.frame.size.width/2
        profilePic.clipsToBounds = true
    }
    
    func navigateToProductList(categoryId:Int) {
        let sb = UIStoryboard(name: "HomeScreen", bundle: nil)
      
        if let nextVc = sb.instantiateViewController(withIdentifier: Constants.productListViewController) as? ProductListViewController
                
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
    func navigateToAccount(){
        let sb = UIStoryboard(name: Constants.AccountScreen, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: Constants.myAccountViewController) as! MyAccountViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

extension SlideViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        slideImages.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.slideMenuTableViewCell, for: indexPath) as! SlideMenuTableViewCell
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
            let storyboard = UIStoryboard(name: Constants.OrderScreen, bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: Constants.CartViewController) as? CartViewController {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case 1 :
            navigateToProductList(categoryId: 1)
        case 2 :
            navigateToProductList(categoryId: 3)
        case 3 :
            navigateToProductList(categoryId: 2)
        case 4 :
            navigateToProductList(categoryId: 4)
        case 5 :
            let storyboard = UIStoryboard(name: Constants.AccountScreen, bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: Constants.myAccountViewController) as? MyAccountViewController {
                self.navigationController?.pushViewController(vc, animated: true)
            }
            //navigate(storyboardName: "AccountScreen", viewControllerID: "MyAccountViewController")
        case 6 :
            navigate(storyboardName:Constants.AccountScreen, viewControllerID: Constants.StoreLocatorViewController)
        case 7 :
            navigate(storyboardName: Constants.OrderScreen, viewControllerID: Constants.OrderListViewController)
        case 8 :
            UserDefaults.standard.removeObject(forKey: Constants.fullname)
            UserDefaults.standard.removeObject(forKey:Constants.email)
            UserDefaults.standard.removeObject( forKey: Constants.accessToken)
            
            print(UserDefaults.standard.string(forKey: Constants.fullname)," ",UserDefaults.standard.string(forKey: Constants.accessToken))
            self.navigationController?.popToRootViewController(animated: true)
        default :
            break
        }
        
        
    }
    
    
}
