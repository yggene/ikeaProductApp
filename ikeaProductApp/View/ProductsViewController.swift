//
//  ViewController.swift
//  ikeaProductApp
//
//  Created by Evgeny Alekseev on 29.01.2023.
//

import UIKit

class ProductsViewController: UITableViewController {
    
    @IBAction func addItemButton(_ sender: Any) {
        promptSearch()
    }
    
    @IBAction func goToFavoritesButton(_ sender: Any) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Search history"
    }
    
    func promptSearch() {
        
        let searchAlertController = UIAlertController(
            title: "Search for a product",
            message: "Enter the article number",
            preferredStyle: .alert)
        
        searchAlertController.addTextField { textField in
            textField.placeholder = "e.g. 00123456"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel)
        let searchAction = UIAlertAction(title: "Search",
                                         style: .default) { _ in
            guard let inputText = searchAlertController.textFields?[0].text,
                  let result = products.first(where: { $0.article == inputText }) else { return }
            searchHistoryList.contains(result) ? print("already in the list") : searchHistoryList.append(result)
            self.tableView.reloadData()
        }
        
        searchAlertController.addAction(cancelAction)
        searchAlertController.addAction(searchAction)
        
        present(searchAlertController, animated: true, completion: nil)
    }
}

// MARK: - Table view data source
extension ProductsViewController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        searchHistoryList.count
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "productTableViewCell",
            for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }
        
        cell.configure(product: searchHistoryList[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
