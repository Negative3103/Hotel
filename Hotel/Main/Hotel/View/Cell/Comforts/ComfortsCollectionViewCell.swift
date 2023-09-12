//
//  ComfortsCollectionViewCell.swift
//  Hotel
//
//  Created by Хасан Давронбеков on 12/09/23.
//

import UIKit

final class ComfortsCollectionViewCell: UICollectionViewCell {
    
    //MARK: -  Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Lifecycles
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5
    }
}
