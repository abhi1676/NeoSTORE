//
//  CartViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/14/24.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet var cartTableView: UITableView!
    var product : ProductDetailData?
    var productQty: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cartTableView.delegate = self
        cartTableView.dataSource = self
        setUpNib()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.title = "My Cart"
    }
    
    func setUpNib(){
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        cartTableView.register(nib, forCellReuseIdentifier: "CartTableViewCell")
    }
  
    @IBAction func orderButtonTapped(_ sender: Any) {
       navigate(storyboardName: "OrderScreen", viewControllerID: "AddressListViewController")
    }
    
}

extension CartViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.configureCell(with:product, qty: productQty)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
}

