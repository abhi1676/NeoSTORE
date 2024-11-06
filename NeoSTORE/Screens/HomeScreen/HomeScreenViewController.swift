//
//  HomeScreenViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/6/24.
//

import UIKit

class HomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.isHidden = true
        hideNavigationBackButtton()
        setupNavigationBarButton(imageName: Constants.menuIcon, isLeft: true, action: #selector(menuButtonTapped))
        setupNavigationBarButton(imageName: Constants.searchIcon, isLeft: false, action: #selector(serachButtonTapped))

        
    }
    

    @objc func menuButtonTapped(){
        print("menu button tapped")
    }
    
    
    @objc func serachButtonTapped(){
        print("search button tapped")
    }

}
