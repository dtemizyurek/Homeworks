//
//  SeatsViewController.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 26.04.2024.
//

import UIKit

final class SelectSeatsViewController: UIViewController {
    //MARK: -IBOutlests
    @IBOutlet private weak var departureLabel: UILabel!
    @IBOutlet private weak var arrivalLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
//    @IBOutlet private weak var companyNameLabel: UILabel!
//    @IBOutlet private weak var departureTimeLabel: UILabel!
//    @IBOutlet private weak var arrivalTimeLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //MARK: - Variables
    private var totalSeat = 45
    private var recentlySoldSeats: [Int] = []
    var departureText = String()
    var arrivalText = String()
    var dateText = String()
    var selectedSeats: [Int] = []
    var seatNumbers: [Int] = []
    var busSeatNumDict = [Int : String]()
    var pathWayNumber = Int()
    var seatNum = Int()
    static let identifier = "SelectSeatsViewController"
    static var soldSeats: [Int] = []
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        arrivalLabel.text = arrivalText
        departureLabel.text = departureText
        dateLabel.text = dateText
        
    }
    
    private func generateBusSeatNumbers(totalSeats: Int, pathwayNumber: Int, startingSeatNumber: Int) -> [Int: String] {
        for i in 0..<totalSeats {
            if (i + 1) % pathwayNumber == 0 {
                busSeatNumDict[i] = ""
            } else {
                busSeatNumDict[i] = String(seatNum)
                seatNum += 1
            }
        }
        return busSeatNumDict
    }
}
