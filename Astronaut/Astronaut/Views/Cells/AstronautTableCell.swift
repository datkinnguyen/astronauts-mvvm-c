//
//  AstronautTableCell.swift
//  Astronaut
//
//  Created by Danny Nguyen on 14/1/2022.
//

import Foundation
import UIKit

final class AstronautTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.setCornerRadius(Constants.viewCornerRadius)
    }
}

extension AstronautTableCell: CellConfigurable {
    
    func configure(model: AstronautViewModel) {
        nameLabel.text = model.name
        nationalityLabel.text = model.nationality
        thumbnailImageView.imageFromUrl(urlString: model.profileImageThumbnail, placeHolderImage: nil)
    }
}
