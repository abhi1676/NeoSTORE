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
    var viewModel = ListCartViewModel()
    var cartViewModel = CartViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.title = "My Cart"
        
        bindViewModel()
        fetchCartItems()
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.title = "My Cart"
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1.0, green: 0.149, blue: 0.0, alpha: 1.0)
        self.cartTableView.reloadData()
    }
    private func setupTableView() {
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        cartTableView.register(nib, forCellReuseIdentifier: "CartTableViewCell")
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    private func bindViewModel() {
            viewModel.reloadCartData = { [weak self] in
                DispatchQueue.main.async {
                    self?.cartTableView.reloadData()
                }
            }
            
            viewModel.showError = { errorMessage in
                DispatchQueue.main.async {
                    self.showAlert(title: "Error", message: "Error fetching cart items")
                }
            }
        }

        private func fetchCartItems() {
            viewModel.fetchCartItems()
        }
    
//    private func updateTotalCost() {
//        let totalCost = cartItems.reduce(0) { $0 + Int($1.product.cost) * $1.quantity }
//        totalCostLabel.text = Texts.Total  + "\(totalCost)"
//    }
    
  
    @IBAction func orderButtonTapped(_ sender: Any) {
       navigate(storyboardName: "OrderScreen", viewControllerID: "AddressListViewController")
    }
    
}

extension CartViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.configureCell(with: viewModel.cartItems[indexPath.row])
        cell.didQuantityChange = { [weak self] qty in
           
        }
       // cell.editCart(productID: viewModel.cartItems[indexPath.row].product_id)

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
   
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.cartViewModel.deleteFromCart(productId: viewModel.cartItems[indexPath.row].product_id)
           
           
            
        }
    }
    

    
}

