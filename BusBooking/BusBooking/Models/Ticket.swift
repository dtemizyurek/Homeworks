//
//  Ticket.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 20.04.2024.
//

import Foundation

struct Ticket: GiveInformationProtocol {
    
    let passenger: [Passanger]
    let ticket: [Ticket]
    let time: [Time]
    let date: [Date]
    var seat: [Int]?
    let reservedSeat = 0
    
    // İki biletin koltuklarını karşılaştıran özel bir fonksiyon
    private func compareTickets(otherTicket: Ticket) -> Bool {
        guard let thisTicketSeats = seat else {
            print("The seats for this ticket are still empty. No comparison can be made.")
        }
        
        guard let otherTicketSeats = otherTicket.seat else {
            print("The seats for the other ticket have not yet been assigned. No comparison can be made.")
        }
        
        for seatNumber in thisTicketSeats {
            if otherTicketSeats.contains(seatNumber) {
                return true
            }
        }
        return false
    }
    // Koltuk rezervasyonu yapanl fonksiyon
    private func reserveSeat(seat: Int) -> [Int] {
        if reservedSeat > 0 {
           return self.seat!
        }else {
            let tempArray = repeatElement(0, count: seat)
            let tempIntArray = tempArray.map {(Int($0))}
            return tempIntArray
        }
    }

    // Koltuk ekleme işlemini gerçekleştiren fonksiyon
    mutating func addSeat(willReserveSeat: Int) {
        seat!.append(willReserveSeat)
    }
    
    
    
    func printInformation() {
        <#code#>
    }
    
}
