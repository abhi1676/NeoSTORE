//
//  SlideViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/8/24.
//

import UIKit

class SlideViewController: UIViewController {

    @IBOutlet var slideMenuTableView: UITableView!
    
    let slideImages = ["chair","table","sofa","chair","cupboard","username_icon","storelocator_icon","logout_icon"]
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
        print("tapped on ",slideItems[indexPath.row])
    }
    
    
}
