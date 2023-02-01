//
//  ProductTableViewCell.swift
//  ikeaProductApp
//
//  Created by Evgeny Alekseev on 01.02.2023.
//

import UIKit

final class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productArticleLabel: UILabel!
    
    func configure(product: Product) {
        productImageView.image = product.image
        productNameLabel.text = product.name
        productArticleLabel.text = product.article
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
