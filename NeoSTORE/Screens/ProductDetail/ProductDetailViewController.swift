//
//  ProductDetailViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/12/24.
//

import UIKit

class ProductDetailViewController: UIViewController{
    
    @IBOutlet var shimmerView: UIView!
    
    @IBOutlet var productNameLbl: UILabel!
    @IBOutlet var productCategoryLbl: UILabel!
    @IBOutlet var productInfoLbl: UILabel!
    @IBOutlet var productStarView: StarRatingView!
    @IBOutlet var productPrice: UILabel!
    
    @IBOutlet var shareButton: UIButton!
    
    @IBOutlet var productImage1: UIImageView!

    
    @IBOutlet var productDescription: UITextView!
   
    
    var productName = ""
    var viewmodel : ProductDetailViewModel?
    var productId : Int?
    var ratePopUp = RatePopUpViewController()
    var data : ProductDetailData?
  
    
    @IBOutlet var productImageCollectionView: UICollectionView?{
        didSet{
            productImageCollectionView?.delegate = self
            productImageCollectionView?.dataSource = self
            let nib = UINib(nibName: "ProductImagesCollectionViewCell", bundle: nil)
            productImageCollectionView?.register(nib, forCellWithReuseIdentifier: "ProductImagesCollectionViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        fetchProductDetail()
        self.observeEvent()
        self.shimmerView.isUserInteractionEnabled = false
        self.shimmerView.isShimmering = true
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1.0, green: 0.149, blue: 0.0, alpha: 1.0)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = productName
        ratePopUp.delegate = self
        
    }
    
    func setUpUI(data:ProductDetail?){
        guard let product = data?.data else {return}
        productNameLbl.text = product.name
        productPrice.text = "Rs.\(product.cost ?? 1)"
        switch viewmodel?.productDetail?.data?.product_category_id {
        case 1:
            productCategoryLbl.text = "Category - Table"
        case 2:
            productCategoryLbl.text = "Category - Chaie"
        case 3:
            productCategoryLbl.text = "Category - Sofa"
        case 4:
            productCategoryLbl.text = "Category - Cupboard"
        default:
            break
        }
        productInfoLbl.text = product.producer
        productStarView.rating = product.rating ?? 1
        if let imgurl = URL(string: product.product_images[0].image ?? ""){
            productImage1.loadImage(from: imgurl)
           
        }
    }
    func fetchProductDetail(){
        viewmodel = ProductDetailViewModel()
        viewmodel?.fetchProductDetails(productId: productId ?? 1) {
            self.data = self.viewmodel?.productDetail?.data
            DispatchQueue.main.async {
                self.setUpUI(data: self.viewmodel?.productDetail )
            }
        }
    }
    
    func observeEvent(){
        viewmodel?.eventHandler = { [weak self] event in
            guard let self = self else {return}
            
            switch event {
            case .loading :
                
                self.shimmerView.isHidden = false
                self.shimmerView.startShimmering()
                print("loading")
                
            case .stopLoading :
                self.shimmerView.stopShimmering()
                DispatchQueue.main.async {
                    self.shimmerView.isHidden = true
                }
                print("Loading Stopped")
            case .dataLoaded :
                print("data loaded")
                DispatchQueue.main.async {
                    self.productImageCollectionView?.reloadData()
                }
                self.shimmerView.stopShimmering()
                DispatchQueue.main.async {
                    self.shimmerView.isHidden = true
                }
                
            case .error(let error):
                print(error ?? "error")
            }
        }
    }
    
  
    @IBAction func shareButtonTapped(_ sender: Any) {
        
        
        
        let name = "\(self.data?.name ?? "")"
        let producer = "\(self.data?.producer ?? "")"
        let image = UIImage(named: self.data?.product_images[0].image ?? "")
        
        let items: [Any] = [name, producer, image]
        
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        activityViewController.excludedActivityTypes = [.addToReadingList, .postToFacebook]
        
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    @IBAction func productBuyButtonTapped(_ sender: Any) {
        //navigate(storyboardName: "OrderScreen", viewControllerID: "AddressViewController")
        let ratepop = RatePopUpViewController()
        
        guard let product = viewmodel?.productDetail?.data  else {return}
        //        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RatePopUpViewController") as RatePopUpViewController
        ratepop.product = product
        ratepop.id = 2
        //        ratepop.onDismiss = { [weak self] in
        //                    self?.navigateToCartViewController(with: product)
        //                }
        ratepop.delegate = self
        ratepop.modalPresentationStyle = .overCurrentContext
        ratepop.modalTransitionStyle = .crossDissolve
        present(ratepop, animated: true)
    }
    
    @IBAction func productRateButtonTapped(_ sender: Any) {
        let ratepop = RatePopUpViewController()
        
        //navigate(storyboardName: "OrderScreen", viewControllerID: "AddressListViewController")
        guard let product = viewmodel?.productDetail?.data  else {return}
        ratepop.product = product
        ratepop.id = 1
        ratepop.modalPresentationStyle = .overCurrentContext
        ratepop.modalTransitionStyle = .crossDissolve
        present(ratepop, animated: true)
    }
    
    
}


extension ProductDetailViewController: ProductQuantityDelegate {
    func onDismiss(productQty: Int) {
        let storyboard = UIStoryboard(name: Constants.OrderScreen, bundle: nil)
        if let cartVC = storyboard.instantiateViewController(withIdentifier: Constants.CartViewController) as? CartViewController {
            cartVC.product = viewmodel?.productDetail?.data
            cartVC.productQty = productQty
            
            self.navigationController?.pushViewController(cartVC, animated: true)
        }
    }
}

extension ProductDetailViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel?.productDetail?.data?.product_images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductImagesCollectionViewCell", for: indexPath) as? ProductImagesCollectionViewCell else {return UICollectionViewCell()}
        if let imgurl = URL(string: viewmodel?.productDetail?.data?.product_images[indexPath.row].image ?? "cricket"){
            cell.productImage.loadImage(from: imgurl)
        }
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        collectionView.cellForItem(at: indexPath)?.layer.borderColor = UIColor.black.cgColor
        collectionView.cellForItem(at: indexPath)?.layer.borderWidth = 2
        if let imgurl = URL(string: viewmodel?.productDetail?.data?.product_images[indexPath.row].image ?? ""){
            productImage1.loadImage(from: imgurl)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.layer.borderColor = UIColor.clear.cgColor
        collectionView.cellForItem(at: indexPath)?.layer.borderWidth = 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: 80)
    }
}
