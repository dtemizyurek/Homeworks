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
    private func configure(with passenger: Passenger) {
        nameTextField.text = passenger.name
        surNameTextField.text = passenger.surname
        idTextField.text = String(passenger.id)
    }

}
