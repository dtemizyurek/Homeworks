//
//  Time.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 20.04.2024.
//

import Foundation

struct Time: GiveInformationProtocol {
    
    let hour = 0
    let minute = 0
    
    func printInformation() {
        print("The hour is : \(hour):\(minute)")
    }
}
