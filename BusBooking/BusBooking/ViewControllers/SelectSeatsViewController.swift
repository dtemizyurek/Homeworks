//
//  SeatsViewController.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 26.04.2024.
//

import UIKit

class SelectSeatsViewController: UIViewController {
   //MARK: -IBOutlests
    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var arrivalTimeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    static let identifier = "SelectSeatsViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
