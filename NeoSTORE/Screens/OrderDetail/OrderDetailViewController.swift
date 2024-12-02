//
//  OrderDetailViewController.swift
//  NeoSTORE
//
//  Created by Apple on 12/2/24.
//

import UIKit

class OrderDetailViewController: UIViewController {
    
    
    @IBOutlet var orderDeatilTableView: UITableView!
    
    @IBOutlet var orderDetailTotalCost: UILabel!
    var orderId : Int?
    private let viewModel = OrderDetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNib()
        bindViewModel()
        viewModel.fetchOrderDetails(orderId: orderId ?? 1)
    }
    
    private func setUpNib(){
        let nib = UINib(nibName: "OrderDetailTableViewCell", bundle: nil)
        orderDeatilTableView.register(nib, forCellReuseIdentifier: "OrderDetailTableViewCell")
        orderDeatilTableView.delegate = self
        orderDeatilTableView.dataSource = self
    }
    private func bindViewModel() {
        viewModel.eventHandler = { [weak self] event in
            guard let self = self else { return }

            switch event {
            case .loading:
                
                print("Loading...")
            case .stopLoading:
                
                print("Stop loading")
            case .dataLoaded:
                DispatchQueue.main.async {
                    self.orderDeatilTableView.reloadData()
                }
//                self.updateOrderTotalCost()
            case .error(let message):
              
                self.showAlert(title: "ERROR", message: message?.localizedDescription ?? "")
            }
        }
    }
//    private func updateOrderTotalCost() {
//        guard let cost = viewModel.orderDetailsData?.cost else { return }
//        orderDetailTotalCost.text = "Total Cost: \(cost)"
//    }

}

extension OrderDetailViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.orderDetailsData?.order_details?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailTableViewCell", for: indexPath) as? OrderDetailTableViewCell else {return UITableViewCell()}
        if let orderDetail = viewModel.orderDetailsData?.order_details?[indexPath.row]{
            cell.configureCell(data: orderDetail)
        }
       
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}


