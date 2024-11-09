//
//  SlideViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/8/24.
//

import UIKit

class SlideViewController: UIViewController {

    @IBOutlet var slideMenuTableView: UITableView!
    
    let slideImages = ["chair","table"]
    let slideItems = ["My Cart","Tables"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "SlideMenuTableViewCell", bundle: nil)
        slideMenuTableView.register(nib, forCellReuseIdentifier: "SlideMenuTableViewCell")
        slideMenuTableView.delegate = self
        slideMenuTableView.dataSource = self
        
    }
    


}

extension SlideViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        slideImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SlideMenuTableViewCell", for: indexPath) as! SlideMenuTableViewCell
        
        cell.slideImage.image = UIImage(named: slideImages[indexPath.row])
        cell.slideItem.text = slideItems[indexPath.row]
        return cell
    }
    
    
}
