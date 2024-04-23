//
//  Ticket.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 20.04.2024.
//

import Foundation

struct Ticket: GiveInformationProtocol {
    
    static var shared = Ticket()
    
    var passenger: Passanger?
    var date: String?
    var time: String?
    var seat: [Int]?
    var reservedSeat = 0
    
    
    // İki biletin koltuklarını karşılaştıran özel bir fonksiyon
    private func compareTickets(otherTicket: Ticket) -> Bool {
        guard let thisTicketSeats = seat else {
            print("The seats for this ticket are still empty. No comparison can be made.")
            return false
        }
        
        
        guard let otherTicketSeats = otherTicket.seat else {
            print("The seats for the other ticket have not yet been assigned. No comparison can be made.")
            return false
        }
        
        for seatNumber in thisTicketSeats {
            if otherTicketSeats.contains(seatNumber) {
                return true
            }
        }
        return false
    }
    
    // Koltuk rezervasyonu yapan fonksiyon
    private mutating func reserveSeat(seatNumber: Int) {
        if self.reservedSeat < 5 && self.reservedSeat + seatNumber <= 5{
            self.reservedSeat += seatNumber
        } else if self.reservedSeat > 5 {
            print("Rezervasyon sınırına ulaşıldı")
        } else {
            print("Unknown reserved seat \(self.reservedSeat)")
        }
    }
    
    // Koltuk ekleme işlemini gerçekleştiren fonksiyon
    mutating func addSeat(seatNumber: Int) {
        guard seatNumber > 0 && seatNumber <= 45 else {
            print("Seat number should be between 1 and 45")
            return
        }
        seat?.append(seatNumber)
    }
    
    
    
    func printInformation() {
        print("Passengers:")
        for passenger in passenger {
            print("- \(passenger.name)")
        }

        print("Date: \(date)")
        print("Time: \(time)")
        
        if let seat = seat {
            print("Reserved Seat Numbers: \(seat)")
        } else {
            print("No seats reserved yet.")
        }
        
    }
}
