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
         collectionView.register(UINib(nibName: "SeatsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SeatsCollectionViewCell")
         collectionView.dataSource = self
         collectionView.delegate = self
         
         setupBusLayout() // Oturma düzenini oluştur
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
    
    // Oturma düzenini oluştur
    private func setupBusLayout() {
        let seatsPerRow = 3 // Her sıradaki koltuk sayısı (2 koltuk + 1 boşluk)
        let totalRows = Int(ceil(Double(totalSeats) / Double(seatsPerRow))) // Toplam satır sayısı
        
        var seatNum = 1
        
        for row in 0..<totalRows {
            for col in 0..<seatsPerRow {
                let seatIndex = row * seatsPerRow + col
                if seatIndex < totalSeats {
                    if col % 3 == 2 {
                        // Her iki koltuğun arasında bir boşluk olacak
                        busSeatNumDict[seatIndex] = ""
                    } else {
                        // Koridor dışındaki koltuklarda
                        busSeatNumDict[seatIndex] = "\(seatNum)"
                        seatNum += 1
                    }
                }
            }
        }
    }

 }

 //MARK: -CollectionView Extensions
 extension SelectSeatsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         totalSeats
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeatsCollectionViewCell", for: indexPath) as? SeatsCollectionViewCell {
             let text = busSeatNumDict[indexPath.row]
             
             if isSold(seatNumber: indexPath.row) {
                 cell.seatImage.image = UIImage(named: "gray")
             } else if isSelected(seatNumber: indexPath.row + 1) {
                 cell.seatImage.image = UIImage(named: "green")
                 print(indexPath.row + 1)
             } else {
                 cell.seatImage.image = UIImage(named: "orange")
             }
             cell.seatLabel?.text = text
             
             if text == "" {
                 cell.contentView.alpha = 0
                 cell.layer.borderColor = UIColor.white.cgColor
                 cell.isUserInteractionEnabled = false
             }
             return cell
         } else {
             return UICollectionViewCell()
         }
     }
     
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         guard let cell = collectionView.cellForItem(at: indexPath) as? SeatsCollectionViewCell else { return }

         let seatNumber = indexPath.row + 1

         if cell.seatImage.image == UIImage(named: "orange") {
             if emptySeatOperations(index: indexPath.row, seatNumber: cell.seatLabel.text ?? "") {
                 cell.seatImage.image = UIImage(named: "green")
                 selectedSeats.append(seatNumber)
                 seatNumbers.append(seatNumber)
             }
         } else if cell.seatImage.image == UIImage(named: "gray") {
             UIAlertController.alertMessage(title: "AAAA", message: "AAAA", vc: self)
         } else {
             if selectedSeatOperations(index: indexPath.row, seatNumber: cell.seatLabel.text ?? "") {
                 cell.seatImage.image = UIImage(named: "orange")
                 selectedSeats.removeAll(where: { $0 == seatNumber })
                 seatNumbers.removeAll(where: { $0 == seatNumber })
             }
         }
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         
         let width: CGFloat = (self.view.frame.width / 7)
         let height: CGFloat = (self.view.frame.width / 7)
         
         return CGSize(width: width, height: height)
     }
     
 }

 //MARK: -Select Seats ViewController Extension

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
    
    private func emptySeatOperations(index: Int, seatNumber: String) -> Bool{
        if selectedSeats.count > 4 {
            UIAlertController.alertMessage(title: "aa", message: "aa", vc: self)
            return false
        } else {
            return true
        }
    }
    
    private func selectedSeatOperations(index: Int, seatNumber: String) -> Bool{
        selectedSeats.removeAll{
            $0 == Int(seatNumber)
        }
        return true
    }
}

