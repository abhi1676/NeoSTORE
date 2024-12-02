//
//  AddressListViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/14/24.
//

import UIKit

class AddressListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var viewModel = OrderViewModel()
    var selectedAddress: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "AddressListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "AddressListTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.navigationBar.topItem?.title = ""
        
//        print(UserDefaults.standard.stringArray(forKey: "Address")?.description)
//        print(UserDefaults.standard.string(forKey: Constants.fullname))
        self.setupNavigationBarButton(imageName: "Plus 2", isLeft: false, action: #selector(addAddress))
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Address List"
        self.tableView.reloadData()
        if let viewControllers = navigationController?.viewControllers {
            for viewController in viewControllers {
                print("ViewController: \(viewController)")
            }
        }
    }
    
    @IBAction func placeOrderButtonTapped(_ sender: Any) {
//        print(UserDefaults.standard.stringArray(forKey: "Address")?.description)
//        print(UserDefaults.standard.string(forKey: Constants.fullname))
//        let arr = UserDefaults.standard.array(forKey: "Address")
//        let address = arr?[0] as? String ?? ""
//        viewModel.placeOrder(with: address)
        guard let address = selectedAddress else {
                showAlert(title: "Error", message: "Please select an address to place your order.")
                return
            }
            viewModel.placeOrder(with: address)
        showAlert(title: "ORDER PLACED", message: "THANK YOU FOR ORDERING"){
            if let viewControllers = self.navigationController?.viewControllers {
                for viewController in viewControllers {
                    if let homeScreenVC = viewController as? HomeScreenViewController {
                        self.navigationController?.popToViewController(homeScreenVC, animated: true)
                        break
                    }
                }
            }
        }
        
    }
    
    @objc func addAddress(){
        navigate(storyboardName: "OrderScreen", viewControllerID: "AddressViewController")
    }
    
    

}

extension AddressListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = UserDefaults.standard.array(forKey: "Address")
        return arr?.count ?? 0 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let arr = UserDefaults.standard.array(forKey: "Address") as? [String] ?? []

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddressListTableViewCell") as? AddressListTableViewCell else {
            return UITableViewCell()
        }
        
        let address = arr[indexPath.row]
        cell.userAddress.text = address
        cell.userNameLbl.text = UserDefaults.standard.string(forKey: Constants.fullname)
        
        if address == selectedAddress {
               cell.contentView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.2)
           } else {
               cell.contentView.backgroundColor = .clear
           }
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
 
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
          
             var addressArray = UserDefaults.standard.stringArray(forKey: "Address") ?? []
             
        
             addressArray.remove(at: indexPath.row)
             
             
             UserDefaults.standard.set(addressArray, forKey: "Address")
             
             
             tableView.deleteRows(at: [indexPath], with: .automatic)
         }
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arr = UserDefaults.standard.array(forKey: "Address") as? [String] ?? []
          selectedAddress = arr[indexPath.row]
        
          tableView.reloadData()
    }
 }

