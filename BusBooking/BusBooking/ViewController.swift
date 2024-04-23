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
    @IBOutlet weak var busView: UIView!
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
        
        customDepartureTextfield()
        customArrivalTextfield()
        customView()
                
    }
    //MARK: - Custom Element Functions
    private func customDepartureTextfield() {
        departureTextfield.layer.cornerRadius = 16
        departureTextfield.layer.masksToBounds = true
        departureTextfield.layer.borderWidth = 0.5
        departureTextfield.layer.borderColor = UIColor.black.cgColor
        departureTextfield.layer.shouldRasterize = true
        departureTextfield.layer.rasterizationScale = UIScreen.main.scale
    }
    
    private func customArrivalTextfield() {
        arrivalTextField.layer.cornerRadius = 16
        arrivalTextField.layer.masksToBounds = true
        arrivalTextField.layer.borderWidth = 0.5
        arrivalTextField.layer.borderColor = UIColor.black.cgColor
        arrivalTextField.layer.shouldRasterize = true
        arrivalTextField.layer.rasterizationScale = UIScreen.main.scale
    }
    
    private func customView() {
        busView.layer.cornerRadius = 16
            busView.layer.masksToBounds = false
            busView.layer.shadowColor = UIColor.black.cgColor
            busView.layer.shadowOpacity = 1
            busView.layer.shadowOffset = CGSize(width: 2, height: 4)
            busView.layer.shadowRadius = 4
    }
    //MARK: - Button Actions
    
    @IBAction func seeExpeditions(_ sender: Any) {
        if departureTextfield.text == "" || departureTextfield.text == "" {
            UIAlertController.alertMessage(title: "Hata", message: "Binilen veya gidilecek yer girilmedi", vc: self)
        } 
    }
    
  
}



