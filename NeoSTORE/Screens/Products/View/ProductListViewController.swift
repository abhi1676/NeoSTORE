import UIKit

class ProductListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var viewModel = ProductViewModel()
    var categoryId:Int?
    
    @IBOutlet var shimmerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchProductsForCategory()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.navigationBar.topItem?.title = ""
        let nib = UINib(nibName: "ProductsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProductsTableViewCell")
        self.observeEvent()
        shimmerView.isUserInteractionEnabled = false
        self.shimmerView.isShimmering = true
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1.0, green: 0.149, blue: 0.0, alpha: 1.0)
//self.navigationController?.navigationBar.tintColor = UIColor(red: 1.0, green: 0.149, blue: 0.0, alpha: 1.0)

        
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigationTitle()

    }
    func setNavigationTitle(){
        self.navigationController?.navigationBar.isHidden = false
        switch categoryId{
        case 1 :
            
            self.navigationItem.title = "Tables"
        case 2 :
            self.navigationItem.title = "Chairs"
        case 3 :
            self.navigationItem.title = "Sofas"
        case 4:
            self.navigationItem.title = "Cupboards"
        default:
            break

        }
    }
    func observeEvent(){
        viewModel.eventHandler = { [weak self] event in
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
                self.shimmerView.stopShimmering()
                DispatchQueue.main.async {
                    self.shimmerView.isHidden = true
                }
              
            case .error(let error):
                print(error ?? "error")
            }
        }
    }
    
    func fetchProductsForCategory() {
        viewModel.fetchProducts(categoryId: categoryId!) {
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products?.data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = viewModel.products?.data?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as! ProductsTableViewCell
        cell.productName.text = product?.name
     
        cell.productMaker.text = product?.producer
        cell.productPrice.text = "Rs.\(product?.cost ?? 0)"
        if let imageurl = URL(string: product?.product_images ?? "")
        {
            cell.productImage.loadImage(from: imageurl,placeholder: UIImage(named: "cricket"))
        }
       
        cell.startView.rating = product?.rating ?? 0
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // navigate(storyboardName: EnumConstants.HomeScreen.rawValue, viewControllerID: "ProductDetailViewController")
        let product = viewModel.products?.data?[indexPath.row]

        navigateToProductDetails(index: product?.id ?? 1,name:product?.name ?? "")
    }
    
    private func navigateToProductDetails(index:Int,name:String){
        let sb = UIStoryboard(name: "HomeScreen", bundle: nil)
        let productDetailVC = sb.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
        productDetailVC.productId = index
        productDetailVC.productName = name
        navigationController?.pushViewController(productDetailVC, animated: true)
        //navigate(storyboardName: "HomeScreen", viewControllerID: "ProductDetailViewController")
    }
}
