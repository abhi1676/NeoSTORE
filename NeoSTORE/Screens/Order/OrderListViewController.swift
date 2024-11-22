//
//  OrderListViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/22/24.
//

import UIKit

class OrderListViewController: UIViewController {

    @IBOutlet var orderListTableview: UITableView!
    var viewModel = OrderViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableview()
        self.title = "My Orders"
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1.0, green: 0.149, blue: 0.0, alpha: 1.0)
        setupNavigationBarButton(imageName: Constants.searchIcon, isLeft: true, action: #selector(searchTapped))
        
    }
    

   func  setUpTableview(){
       orderListTableview.delegate = self
       orderListTableview.dataSource = self
       
       let nib = UINib(nibName: "OrderListTableViewCell", bundle: nil)
       orderListTableview.register(nib, forCellReuseIdentifier: "OrderListTableViewCell")
    }
    
    func observerEvent(){
       
    }

    @objc func searchTapped(){
        print("Search tapped")
    }
}

extension OrderListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell", for: indexPath) as? OrderListTableViewCell else {return UITableViewCell()}
        cell.orderCost.text = "Rs. \(45.0)"
        cell.orderDate.text = "01-06-2002"
        cell.orderID.text = "123456"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       100
    }
    
    
}
