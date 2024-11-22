//
//  AddressListViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/14/24.
//

import UIKit

class AddressListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
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
    }
    
    @IBAction func placeOrderButtonTapped(_ sender: Any) {
//        print(UserDefaults.standard.stringArray(forKey: "Address")?.description)
//        print(UserDefaults.standard.string(forKey: Constants.fullname))
        
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
        
        let arr = UserDefaults.standard.array(forKey: "Address")
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddressListTableViewCell") as? AddressListTableViewCell else {
            return UITableViewCell()
        }
        
        let address = arr?[indexPath.row] ?? "No Address"
        cell.userAddress.text = address as? String
        cell.userNameLbl.text = UserDefaults.standard.string(forKey: Constants.fullname)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
 
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
          
             var addressArray = UserDefaults.standard.stringArray(forKey: "Address") ?? []
             
        
             addressArray.remove(at: indexPath.row)
             
             
             UserDefaults.standard.set(addressArray, forKey: "Address")
             
             
             tableView.deleteRows(at: [indexPath], with: .automatic)
         }
     }
 }

