//
//  HomeScreenViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/6/24.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet var homeScreenCollectionView:
    UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.isHidden = true
        hideNavigationBackButtton()
        setupNavigationBarButton(imageName: Constants.menuIcon, isLeft: true, action: #selector(menuButtonTapped))
        setupNavigationBarButton(imageName: Constants.searchIcon, isLeft: false, action: #selector(serachButtonTapped))
        homeScreenCollectionView.delegate = self
        homeScreenCollectionView.dataSource = self
        setUpNib()
    }
    
    func setUpNib(){
        let nib = UINib(nibName: "HomeScreenCollectionViewCell", bundle: nil)
        homeScreenCollectionView.register(nib, forCellWithReuseIdentifier: "HomeScreenCollectionViewCell")
    }
    @objc func menuButtonTapped(){
        print("menu button tapped")
    }
    
    
    @objc func serachButtonTapped(){
        print("search button tapped")
    }
    
    

}


