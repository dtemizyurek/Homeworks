//
//  Passanger.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 20.04.2024.
//

import Foundation

struct Passanger: GiveInformationProtocol {
    
    let name = ""
    let surname = ""
    let id = 0
    
    func printInformation() {
        print("Yolcu Adı: \(name) , Yolcu Soyadı\(surname), Yolcu id : \(id)")
    }
    
    
}
