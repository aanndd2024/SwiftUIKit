//
//  ProductListViewController.swift
//  MVVM-ProductDetails
//
//  Created by Anand Yadav on 23-05-2024.
//

import UIKit

class ProductListViewController: UIViewController {
    
    var viewModel = ProductViewModel()
    @IBOutlet weak var productTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
}

extension ProductListViewController {
    func configuration() {
        initViewModel()
        observeEvent()
        productTableView.register(UINib(nibName: "ProductCellTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
    }
    
    func initViewModel() {
        viewModel.fetchProduct()
    }
    
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            switch event {
            case .loading:
                print("Loading")
            case .stopLoading:
                print("Stop Loading")
            case .dataReceived:
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .error(let error):
                printContent(error)
            }
        }
    }
}

extension ProductListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCellTableViewCell else {
            return UITableViewCell()
        }
        let product = viewModel.product[indexPath.row]
        cell.product = product
        return cell
    }
}
