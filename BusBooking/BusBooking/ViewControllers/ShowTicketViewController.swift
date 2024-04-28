//
//  ShowTicketViewController.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 28.04.2024.
//

import UIKit

final class ShowTicketViewController: UIViewController {

    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numberOfPersonLabel: UILabel!
    @IBOutlet weak var reservationNoLabel: UILabel!
    @IBOutlet weak var seatNumbers: UILabel!
    
    var departure = String()
    var arrival = String()
    var date = String()
    var person = String()
    var reservationNo = String()
    var selectedSeatNumbers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
