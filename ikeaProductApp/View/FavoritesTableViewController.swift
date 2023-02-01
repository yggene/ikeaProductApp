//
//  FavoritesTableViewController.swift
//  ikeaProductApp
//
//  Created by Evgeny Alekseev on 01.02.2023.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Favorites"
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

// MARK: - Table view data source
extension FavoritesTableViewController {
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        favoritesList.count
    }
    
    // Override to configure prototype cell
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "productTableViewCell",
            for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }
        
        cell.configure(product: favoritesList[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    // Override to deselect row on touchup
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            favoritesList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView,
                            moveRowAt fromIndexPath: IndexPath,
                            to: IndexPath) {
        (favoritesList[fromIndexPath.row], favoritesList[to.row]) = (favoritesList[to.row], favoritesList[fromIndexPath.row])
    }
}
