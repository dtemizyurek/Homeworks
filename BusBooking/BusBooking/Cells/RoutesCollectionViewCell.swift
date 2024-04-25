//
//  RoutesCollectionViewCell.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 25.04.2024.
//

import UIKit

class RoutesCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    @IBOutlet weak var view: UIView!
    
    //MARK: - Identifier
    static let identifier = "RoutesCollectionViewCell"
    
    //MARK: -Awake From Nib
    override func awakeFromNib() {
          super.awakeFromNib()
          configureUI()
      }
    
      //MARK: -Private Functions
      private func configureUI() {
          view.layer.cornerRadius = 10
          view.layer.masksToBounds = true 
      }
    
    //MARK: - Configuration Method
    func config(with routesModel: Routes){
        if let image = UIImage(named: routesModel.companyImage) {
                imageView.image = image
            } else {
            imageView.image = UIImage(named: "placeholderImage")
        }
        timeLabel.text = routesModel.timeLabel
        priceLabel.text = "\(routesModel.price) ₺"
        dateLabel.text = routesModel.dateLabel
        departureLabel.text = routesModel.departurePoint
        arrivalLabel.text = routesModel.arrivalPoint
    }
}
