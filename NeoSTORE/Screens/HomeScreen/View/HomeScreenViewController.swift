//
//  HomeScreenViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/6/24.
//

import UIKit

class HomeScreenViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet var homeScreenCollectionView:
    UICollectionView!
    
    @IBOutlet var slideMenuLeadingConstraint: NSLayoutConstraint!

    
    
    @IBOutlet var backViewForSlideMenu: UIView!
    
    let images = [UIImage(named: "slider_img1"),UIImage(named: "slider_img2"),UIImage(named: "slider_img3"),UIImage(named: "slider_img4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.isHidden = true
        hideNavigationBackButtton()
        setupNavigationBarButton(imageName: Constants.menuIcon, isLeft: true, action: #selector(menuButtonTapped))
        setupNavigationBarButton(imageName: Constants.searchIcon, isLeft: false, action: #selector(serachButtonTapped))
        homeScreenCollectionView.delegate = self
        homeScreenCollectionView.dataSource = self
        setUpNib()
        homeScreenCollectionView.isPagingEnabled = true
        backViewForSlideMenu.isHidden = true
        backViewForSlideMenu.layer.cornerRadius = 10
    }
    
    func setUpNib(){
        let nib = UINib(nibName: "HomeScreenCollectionViewCell", bundle: nil)
        homeScreenCollectionView.register(nib, forCellWithReuseIdentifier: "HomeScreenCollectionViewCell")
    }
    @objc func menuButtonTapped(){
        self.navigationController?.navigationBar.isHidden = true
        backViewForSlideMenu.isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.slideMenuLeadingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func homeScreentapped(_ sender: UITapGestureRecognizer) {
        

       print("homescrren tapped")
        UIView.animate(withDuration: 0.5) {
            self.slideMenuLeadingConstraint.constant = -280
            self.view.layoutIfNeeded()
           
        }
        UIView.animate(withDuration: 0.6){
            self.navigationController?.navigationBar.isHidden = false

        }
        
    }
    
    
    
    @objc func serachButtonTapped(){
        print("search button tapped")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeScreenCollectionViewCell", for: indexPath) as! HomeScreenCollectionViewCell
        cell.configure(image: images[indexPath.row] ?? UIImage(), currentPage: indexPath.row, totalPages: images.count)
        
        return cell
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let pageIndex = round(scrollView.contentOffset.x / homeScreenCollectionView.frame.width)
//        if let visibleCells = homeScreenCollectionView.visibleCells as? [HomeScreenCollectionViewCell] {
//            visibleCells.forEach { cell in
//                cell.pageCOntrol.currentPage = Int(pageIndex)
//            }
//        }
//  }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let width =  homeScreenCollectionView.frame.width
            let height =  homeScreenCollectionView.frame.height
            return .init(width: width, height: height)
            
       
       
    }

}


