//
//  ShowTicketViewController.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 28.04.2024.
//

import UIKit

final class ShowTicketViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numberOfPersonLabel: UILabel!
    @IBOutlet weak var reservationNoLabel: UILabel!
    @IBOutlet weak var seatNumbers: UILabel!
    
    //MARK: - Variables
    var departure = String()
    var arrival = String()
    var date = String()
    var person = String()
    var reservationNo = String()
    var selectedSeatNumbers = [Int]()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    
    //MARK: - Private functions
    private func setupLabels() {
        departureLabel.text = departure
        arrivalLabel.text = arrival
        dateLabel.text = date
        numberOfPersonLabel.text = person
        reservationNoLabel.text = reservationNo
        seatNumbers.text = (selectedSeatNumbers.map { String($0) }.joined(separator: ", "))
    }
    //MARK: - Button Action
    @IBAction func backToHomeButton(_ sender: UIButton) {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}

