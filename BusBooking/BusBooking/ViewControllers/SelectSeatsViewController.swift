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
    private var totalSeats = 45
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
        
        pathWayNumber = 2
        seatNum = 1
        
        for i in 0...totalSeats{
            if i == pathWayNumber { // If it s centre, values empty to dictionary
                if i == 52 {
                    busSeatNumDict[i] = String(seatNum)
                    seatNum = seatNum + 1
                } else {
                    busSeatNumDict[i] = ""
                    pathWayNumber = pathWayNumber + 5 // Position empty - 2,7,12,17,22 ...... like that
                }
            } else {
                busSeatNumDict[i] = String(seatNum)
                seatNum = seatNum + 1
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        for seat in recentlySoldSeats {
            SelectSeatsViewController.soldSeats.append(seat)
        }
        recentlySoldSeats.removeAll()
        collectionView.reloadData()
    }
    
    //MARK: -
    @IBAction func buyTickets(_ sender: Any) {
        
    }
}

//MARK: -CollectionView Extensions
extension SelectSeatsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSeats
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeatsCollectionViewCell.identifier, for: indexPath) as? SeatsCollectionViewCell {
            let text = busSeatNumDict[indexPath.row]
            
            if isSold(seatNumber: indexPath.row){
                cell.seatImage.image = UIImage(named: "gray")
            } else if isSelected(seatNumber: indexPath.row + 1) {
                cell.seatImage.image = UIImage(named: "green")
                print(indexPath.row + 1)
            } else {
                cell.seatImage.image = UIImage(named: "orange")
            }
            
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
}

extension SelectSeatsViewController {

    private func isSold(seatNumber: Int) -> Bool {
        for seat in SelectSeatsViewController.soldSeats {
            if seatNumber == seat {
                return true
            }
        }
        return false
    }
    
    private func isSelected(seatNumber: Int) -> Bool {
        for seat in selectedSeats {
            if seatNumber == seat {
                return true
            }
        }
        return false
    }
}
