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

    @IBOutlet var backViewLeading: NSLayoutConstraint!
    
    @IBOutlet var backView: UIView!
    
    @IBOutlet var backViewForSlideMenu: UIView!
    
    
    @IBOutlet var tableProductView: UIView!
    
    @IBOutlet var sofaProductView: UIImageView!
    
    @IBOutlet var chairProductView: UIView!
    
    
    @IBOutlet var cupboardProductView: UIView!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    
    
    
    
    
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
        backView.isUserInteractionEnabled = true

        self.navigationController?.navigationBar.isHidden = true
        backViewForSlideMenu.isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.slideMenuLeadingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        tapGesture.isEnabled = true

    }
    
    @IBAction func homeScreentapped(_ sender: UITapGestureRecognizer) {
        
        backView.isUserInteractionEnabled = false

       print("homescrren tapped")
        UIView.animate(withDuration: 0.5) {
            self.slideMenuLeadingConstraint.constant = -280
            self.view.layoutIfNeeded()
           
        }
        UIView.animate(withDuration: 0.6){
            self.navigationController?.navigationBar.isHidden = false

        }
        
        tapGesture.isEnabled = false
        
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
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        print("Tables tapped")
        if tableProductView == touch.view{
            print("Tables tapped")
        }
        if sofaProductView == touch.view{
            print("sofas tapped")
        }
    }

    @IBAction func tableProductTapped(_ sender: Any) {
        print("Tables tapped")
        navigate(storyboardName: "HomeScreen", viewControllerID: "ProductListViewController")
    }
    
    
    @IBAction func sofasProductTapped(_ sender: Any) {
        print("sofas tapped")
        navigate(storyboardName: "HomeScreen", viewControllerID: "ProductListViewController")

    }
    
    
    @IBAction func chairProductTapped(_ sender: Any) {
        print("chairs tapped")
        navigate(storyboardName: "HomeScreen", viewControllerID: "ProductListViewController")

    }
    
    @IBAction func cupboardProductTapped(_ sender: Any) {
        print("cupboards tapped")
        navigate(storyboardName: "HomeScreen", viewControllerID: "ProductListViewController")

    }
}


