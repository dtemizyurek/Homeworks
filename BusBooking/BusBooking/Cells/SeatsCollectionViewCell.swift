//
//  SeatsCollectionViewCell.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 26.04.2024.
//

import UIKit

class SeatsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var seatImage: UIImageView!
    @IBOutlet weak var seatLabel: UILabel!
    
    static let identifier = "SeatsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        seatLabel.text = ""
        seatImage.image = UIImage(named: "orange")
    }

}
