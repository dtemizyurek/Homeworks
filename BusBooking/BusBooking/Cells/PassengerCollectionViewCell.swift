//
//  PassengerCollectionViewCell.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 28.04.2024.
//

import UIKit

class PassengerCollectionViewCell: UICollectionViewCell {
    //MARK: -IBOutlets
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var surNameTextField: UITextField!
    @IBOutlet private weak var idTextField: UITextField!
    
     //MARK: - Variables
    static let identifier = "PassengerCollectionViewCell"
    
    //MARK: - awakeFromNib()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - Configure Method
    private func configure(with passenger: Passenger) {
        nameTextField.text = passenger.name
        surNameTextField.text = passenger.surname
        idTextField.text = String(passenger.id)
    }

}
