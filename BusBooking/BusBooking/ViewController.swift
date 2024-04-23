//
//  ViewController.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 20.04.2024.
//

import UIKit
import MapKit

class ViewController: UIViewController {
//MARK: -IBOutlets
    
   
    @IBOutlet weak var departureTextfield: UITextField!
    @IBOutlet weak var arrivalTextField: UITextField!
    @IBOutlet weak var citiesImageView: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var departurePoint = ""
    var arrivalPoint = ""
    var activeTag = 0
    var mapKitSearch = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    

    @IBAction func buyTicket(_ sender: Any) {
        if departureTextfield.text?.contains(", ") != nil {
            let departure = departureTextfield.text?.components(separatedBy: ", ")
            
        }
    }
    
    func getAndTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: datePicker.date)
        
        let calendar = datePicker.calendar
        let hour = String((calendar?.component(.hour, from: datePicker.date))!)
        var minute = String((calendar?.component(.minute, from: datePicker.date))!)
        
        if minute == "0" { minute += "0"}
        let time = "\(hour):\(minute)"
        
        Ticket.shared.date = date
        Ticket.shared.time = time
    }
}

