//
//  PassengerCollectionViewCell.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 28.04.2024.
//

import UIKit

class PassengerCollectionViewCell: UICollectionViewCell {
    //MARK: -IBOutlets
    @IBOutlet weak var passengerNoTextField: UITextField!
    @IBOutlet weak var passengerNameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var seatNoTextField: UITextField!
    @IBOutlet weak var view: UIView!
    //MARK: - Variables
    static let identifier = "PassengerCollectionViewCell"
    
    //MARK: - awakeFromNib()
    override func awakeFromNib() {
        super.awakeFromNib()
        customView()
    }
    
    private func customView() {
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true

    }
    
    //MARK: - Configure Method
     func configure(with passenger: Passenger) {
        passengerNoTextField.text = passenger.name
        passengerNameTextField.text = passenger.surname
        idTextField.text = String(passenger.id)
    }

}
