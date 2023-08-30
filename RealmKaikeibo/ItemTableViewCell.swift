//
//  ItemTableViewCell.swift
//  RealmKaikeibo
//
//  Created by 浦山秀斗 on 2023/08/30.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var markImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(title: String, price: Int, isMarked: Bool) {
        titleLabel.text = title
        priceLabel.text = "\(price)円"
        markImageView.image = isMarked ? UIImage(systemName: "star.fill") : UIImage(systemName: "star");
    }
    
}
