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
    private mutating func reserveSeat(seatCount: Int) {
        if seatCount > 0 && self.seat == nil {
            seat = Array(repeating: 0, count: seatCount)
        } else if seatCount > 0 {
            print("Seats are already allocated")
        } else {
            self.seat = nil
        }
    }

    // Koltuk ekleme işlemini gerçekleştiren fonksiyon
    mutating func addSeat(seatNumber: Int) {
        guard seatNumber > 0 && seatNumber > 45 else {
            print("Seat number should be between 1 and 45")
            return
        }
        seat?.append(seatNumber)
    }
    
    
    
    func printInformation() {
        <#code#>
    }
    
}
