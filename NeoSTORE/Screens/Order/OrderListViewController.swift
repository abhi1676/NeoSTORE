//
//  OrderListViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/22/24.
//

import UIKit

class OrderListViewController: UIViewController {

    @IBOutlet var orderListTableview: UITableView!
    private lazy var viewModel = OrderViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableview()
        self.navigationController?.navigationBar.isHidden = false
        observerEvent()
        viewModel.fetchOrderList()
//        self.navigationController?.title = "My Orders"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.title = "My Orders"
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1.0, green: 0.149, blue: 0.0, alpha: 1.0)
        setupNavigationBarButton(imageName: Constants.searchIcon, isLeft: false, action: #selector(searchTapped))
    }

   func  setUpTableview(){
       orderListTableview.delegate = self
       orderListTableview.dataSource = self
       
       let nib = UINib(nibName: Constants.OrderListTableViewCell, bundle: nil)
       orderListTableview.register(nib, forCellReuseIdentifier: Constants.OrderListTableViewCell)
    }
    
    func observerEvent(){
        viewModel.eventHandler = { [weak self] event in
                    switch event {
                    case .loading:
                        print("Loading")
                    case .stopLoading:
                        print("Loading Stopped")
                    case .dataLoaded:
                        self?.orderListTableview.reloadData()
                    case .error(let message):
                        self?.showAlert(title: "Error", message: message!.localizedDescription)
                    }
                }
    }

    @objc func searchTapped(){
        print("Search tapped")
    }
}

extension OrderListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.OrderListTableViewCell, for: indexPath) as? OrderListTableViewCell else {return UITableViewCell()}
        
        let order = viewModel.orders[indexPath.row]
        cell.orderCost.text = "Rs. \(order.cost ?? 1)"
        cell.orderDate.text = "\(order.created ?? "1")"
        cell.orderID.text = " \(order.id ?? 1)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: Constants.OrderScreen, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: Constants.OrderDetailViewController) as? OrderDetailViewController
        let order = viewModel.orders[indexPath.row]
        vc?.orderId = order.id
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
