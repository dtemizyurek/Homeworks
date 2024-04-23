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
    //MARK: - Variables
    var boardingPickerView = UIPickerView()
    var destianationPickerView = UIPickerView()
    var cities = String()
    let toolBar = UIToolbar()
    let time = [8,10,9,7,11,10]
    var findRoutes = [Routes]()
    var dateFormatter = DateFormatter()
    private var price = ["700","800","900","1200"]
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
    @IBAction func seeExpeditions(_ sender: Any) {
        if departureTextfield.text == "" || departureTextfield.text == "" {
            UIAlertController.alertMessage(title: "Hata", message: "Binilen veya gidilecek yer girilmedi", vc: self)
        } 
    }
    
   private func getAndTime() {
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

