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
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //MARK: - Variables
    private var totalSeats = 67
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
        collectionViewRegister()
        setupBusLayout()// Oturma düzenini oluştur
        prepareLabels()
        UIAlertController.alertMessage(title: "Scroll the screen", message: "Scroll the screen to select a seat and choose one of the available seats", vc: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        for seat in recentlySoldSeats {
            SelectSeatsViewController.soldSeats.append(seat)
        }
        recentlySoldSeats.removeAll()
        collectionView.reloadData()
    }
    
    //MARK: - Private functions
    // Oturma düzenini oluştur
    private func setupBusLayout() {
        let seatsPerRow = 6 // Her sıradaki koltuk sayısı (2 koltuk + 2 boşluk + 2 koltuk)
        let totalRows = Int(ceil(Double(totalSeats) / Double(seatsPerRow))) // Toplam satır sayısı
        var seatNum = 1
        
        for row in 0..<totalRows {
            for col in 0..<seatsPerRow {
                let seatIndex = row * seatsPerRow + col
                if seatIndex < totalSeats {
                    if col % 6 == 2 || col % 6 == 3 {
                        // Her iki koltuğun arasına üç boşluk olacak
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

    private func prepareLabels() {
        departureLabel.text = departureText
        arrivalLabel.text = arrivalText
        dateLabel.text = dateText
    }
    
    private func collectionViewRegister() {
        collectionView.register(UINib(nibName: "SeatsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SeatsCollectionViewCell")
    }
    
    //MARK: - Button Actions
    @IBAction func buyTickets(_ sender: Any) {
        let passengerInfoVC = PassengerInfoViewController(nibName: PassengerInfoViewController.identifier, bundle: nil)
        if selectedSeats.count == 0 {
            UIAlertController.alertMessage(title: "You did not choose a seat", message: "Please choose a seat", vc: self)
        } else {
            UserDefaults.standard.set(selectedSeats, forKey: "selectedSeats")
            passengerInfoVC.arrival = self.arrivalText
            passengerInfoVC.departure = self.departureText
            passengerInfoVC.date = self.dateText
            navigationController?.pushViewController(passengerInfoVC, animated: true)
            
        }
    }
}
//MARK: -CollectionView Extensions
extension SelectSeatsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalSeats
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeatsCollectionViewCell", for: indexPath) as? SeatsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let seatNumber = busSeatNumDict[indexPath.row] ?? ""
        
        if isSold(seatNumber: indexPath.row) {
            cell.seatImage.image = UIImage(named: "gray")
        } else if isSelected(seatNumber: indexPath.row + 1) {
            cell.seatImage.image = UIImage(named: "green")
        } else {
            cell.seatImage.image = UIImage(named: "orange")
        }
        
        cell.seatLabel.text = seatNumber
        
        // Show or hide cell based on seat number availability
        cell.isHidden = seatNumber.isEmpty
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let seatNumber = indexPath.row + 1
        
        if let cell = collectionView.cellForItem(at: indexPath) as? SeatsCollectionViewCell {
            if cell.seatImage.image == UIImage(named: "orange") {
                if emptySeatOperations(index: indexPath.row, seatNumber: cell.seatLabel.text ?? "") {
                    cell.seatImage.image = UIImage(named: "green")
                    selectedSeats.append(seatNumber)
                    seatNumbers.append(seatNumber)
                }
            } else if cell.seatImage.image == UIImage(named: "gray") {
                UIAlertController.alertMessage(title: "You can't take this seat", message: "This seat has already been purchased", vc: self)
            } else {
                if selectedSeatOperations(index: indexPath.row, seatNumber: cell.seatLabel.text ?? "") {
                    cell.seatImage.image = UIImage(named: "orange")
                    selectedSeats.removeAll(where: { $0 == seatNumber })
                    seatNumbers.removeAll(where: { $0 == seatNumber })
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width / 7) // Assuming 7 items per row
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }
}


//MARK: - Select Seats ViewController Extension

extension SelectSeatsViewController {
    
    private func isSold(seatNumber: Int) -> Bool {
        return SelectSeatsViewController.soldSeats.contains(seatNumber)
    }
    
    private func isSelected(seatNumber: Int) -> Bool {
        return selectedSeats.contains(seatNumber)
    }
    
    private func emptySeatOperations(index: Int, seatNumber: String) -> Bool{
        if selectedSeats.count > 4 {
            UIAlertController.alertMessage(title: "You can't get more seats", message: "You can purchase a maximum of 5 seats", vc: self)
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


