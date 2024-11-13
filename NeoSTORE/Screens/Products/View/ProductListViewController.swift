import UIKit

class ProductListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var viewModel = ProductViewModel()
    var categoryId:Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchProductsForCategory()
        tableView.delegate = self
        tableView.dataSource = self
        setNavigationTitle()
        self.navigationController?.navigationBar.topItem?.title = ""
        let nib = UINib(nibName: "ProductsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProductsTableViewCell")
        
    }
    func setNavigationTitle(){
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
            self.navigationItem.title = "NeoStore"

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
        return 100
        
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
