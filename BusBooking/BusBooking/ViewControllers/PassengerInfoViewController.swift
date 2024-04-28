//
//  PassengerInfoViewController.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 28.04.2024.
//

import UIKit

final class PassengerInfoViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Variables
    var departure = String()
    var arrival = String()
    var date = String()
    var passengerNames = String()
    var selectedSeats = [Int]()
    var passengerId = [String]()
    var passengers: [Passenger] = []
    static let identifier = "PassengerInfoViewController"
    
    //MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLabels()
        NIBRegister()
    }
    
    //MARK: - Private functions
    private func prepareLabels() {
        departureLabel.text = departure
        arrivalLabel.text = arrival
        dateLabel.text = date
    }
    
    private func NIBRegister() {
        collectionView.register(UINib(nibName: PassengerCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PassengerCollectionViewCell.identifier)
    }
    
    private func generateUUIDs(count: Int) -> [UUID] {
        var uuids = [UUID]()
        
        for _ in 1...count {
            let uuid = UUID()
            uuids.append(uuid)
        }
        return uuids
    }
    
    @IBAction func seeDetailsButton(_ sender: Any) {
       let showTicketVC = ShowTicketViewController()
        navigationController?.pushViewController(showTicketVC, animated: true)
    }
    
}
//MARK: - CollectionView Extensions
extension PassengerInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let enteredText = textField.text!
        passengerNames.append(enteredText)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedSeats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PassengerCollectionViewCell.identifier, for: indexPath) as? PassengerCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.passengerNoTextField.text = "Passenger \(indexPath.item + 1)"
        let uuidArray = generateUUIDs(count: selectedSeats.count)
        let uuidStrings = uuidArray.map { String($0.uuidString.prefix(8)) }
        passengerId = uuidStrings
        cell.idTextField.text = uuidStrings[indexPath.row]
        cell.idTextField.isUserInteractionEnabled = false
        cell.passengerNoTextField.isUserInteractionEnabled = false
        cell.passengerNoTextField.delegate = self
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = collectionView.frame.width - 20
        let cellHeight: CGFloat = 190
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}
