//
//  ProductCellTableViewCell.swift
//  MVVM-ProductDetails
//
//  Created by Anand Yadav on 23-05-2024.
//

import UIKit

class ProductCellTableViewCell: UITableViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var viewCellBackground: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblProductCategory: UILabel!
    @IBOutlet weak var btnRate: UIButton!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var product:Product? {
        didSet {
            productDetailsConfig()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewCellBackground.clipsToBounds = false
        viewCellBackground.layer.cornerRadius = 15
        imgProduct.layer.cornerRadius = 10
        viewCellBackground.backgroundColor = .systemGray6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailsConfig() {
        guard let product else { return }
        imgProduct.setImage(with: product.image)
        lblTitle.text = product.title
        lblProductCategory.text = product.category
        lblDesc.text = product.description
        lblPrice.text = "$\(product.price)"
        btnRate.setTitle("\(product.rating.rate)", for: UIControl.State.normal)
    }
    
}
