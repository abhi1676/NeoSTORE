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
    }
    
    @IBAction func placeOrderButtonTapped(_ sender: Any) {
        print(UserDefaults.standard.stringArray(forKey: "Address")?.description)
        print(UserDefaults.standard.string(forKey: Constants.fullname))
        UserDefaults.standard.removeObject(forKey: "Address")
    }
    
   

}

extension AddressListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        UserDefaults.standard.stringArray(forKey: "Address")?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddressListTableViewCell") as? AddressListTableViewCell else {return UITableViewCell()}
        cell.backgroundColor = .red
        cell.userAddress.text = UserDefaults.standard.stringArray(forKey: "Address")?[indexPath.row]
        cell.userNameLbl.text = UserDefaults.standard.string(forKey: Constants.fullname)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
