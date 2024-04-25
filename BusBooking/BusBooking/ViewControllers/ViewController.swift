//
//  ViewController.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 20.04.2024.
//

import UIKit
import MapKit

final class ViewController: UIViewController {
    
    //MARK: -IBOutlets
    @IBOutlet weak var departureTextfield: UITextField!
    @IBOutlet weak var arrivalTextField: UITextField!
    @IBOutlet weak var citiesImageView: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var busView: UIView!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var seeExpeditionsButton: UIButton!
    //MARK: - Variables
    var departurePickerView = UIPickerView()
    var arrivalPickerView = UIPickerView()
    var cities = [String]()
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
        customChangeButton()
        customseeExpeditionsButton()
        pickerViewConfig()
        citiesConfig()
        
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
    
    private func customChangeButton() {
        changeButton.layer.cornerRadius = changeButton.bounds.size.height / 2
        changeButton.clipsToBounds = true
    }
    private func customseeExpeditionsButton() {
        seeExpeditionsButton.layer.cornerRadius = 10
        seeExpeditionsButton.layer.masksToBounds = false
        seeExpeditionsButton.layer.shadowColor = UIColor.black.cgColor
        seeExpeditionsButton.layer.shadowOpacity = 0.5
        seeExpeditionsButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        seeExpeditionsButton.layer.shadowRadius = 4
    }
    
    private func citiesConfig() {
        cities = ["Adana", "Afyon", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "İçel (Mersin)", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"]
        departureTextfield.inputView = departurePickerView
        arrivalTextField.inputView = arrivalPickerView
    }
    
    private func pickerViewConfig() {
        departurePickerView.delegate = self
        departurePickerView.dataSource = self
        arrivalPickerView.dataSource = self
        arrivalPickerView.delegate = self
    }
    //MARK: - Button Actions
    
    @IBAction func seeExpeditions(_ sender: UIButton) {
        let today = Date() // Get today's date

          if departureTextfield.text == "" || arrivalTextField.text == "" {
              UIAlertController.alertMessage(title: "Hata", message: "Binilen veya gidilecek yer girilmedi", vc: self)
          } else if arrivalTextField.text == departureTextfield.text {
              UIAlertController.alertMessage(title: "Hata", message: "Aynı şehirler arası gidemezsiniz", vc: self)
          } else if datePicker.date == datePicker.minimumDate {
              UIAlertController.alertMessage(title: "Hata", message: "Lütfen bir tarih seçin", vc: self)
          } else if datePicker.date < today || datePicker.date == today {
              UIAlertController.alertMessage(title: "Hata", message: "Geçmiş bir tarih seçtiniz, lütfen geçerli bir tarih seçin", vc: self)
          } else {
             // performSegue(withIdentifier: "toFindBusVC", sender: nil)
              print("To find bus vc")
          }
    }
}
//MARK: - PickerView Extensions
extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == departurePickerView {
            departureTextfield.text = cities[row]
        } else {
            arrivalTextField.text = cities[row]
        }
    }
    
}


