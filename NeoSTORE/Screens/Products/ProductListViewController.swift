import UIKit

class ProductListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var categoryId: Int = 1
    var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchProductsForCategory()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func fetchProductsForCategory() {
        viewModel.fetchProducts(categoryId: categoryId) {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        cell.textLabel?.text = product?.name
        cell.detailTextLabel?.text = product?.description
        
        return cell
    }
}
