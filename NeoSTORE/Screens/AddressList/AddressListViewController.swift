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
        
        print(UserDefaults.standard.stringArray(forKey: "Address")?.description)
        print(UserDefaults.standard.string(forKey: Constants.fullname))
        self.setupNavigationBarButton(imageName: "Plus 2", isLeft: false, action: #selector(addAddress))
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Address List"
    }
    
    @IBAction func placeOrderButtonTapped(_ sender: Any) {
        print(UserDefaults.standard.stringArray(forKey: "Address")?.description)
        print(UserDefaults.standard.string(forKey: Constants.fullname))
        UserDefaults.standard.removeObject(forKey: "Address")
    }
    
    @objc func addAddress(){
        navigate(storyboardName: "OrderScreen", viewControllerID: "AddressViewController")
    }

}

extension AddressListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = UserDefaults.standard.stringArray(forKey: "Address")
        return arr?.count ?? 0 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let arr = UserDefaults.standard.stringArray(forKey: "Address")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddressListTableViewCell") as? AddressListTableViewCell else {
            return UITableViewCell()
        }
        
        let address = arr?[indexPath.row] ?? "No Address"
        cell.userAddress.text = address
        cell.userNameLbl.text = UserDefaults.standard.string(forKey: Constants.fullname)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
