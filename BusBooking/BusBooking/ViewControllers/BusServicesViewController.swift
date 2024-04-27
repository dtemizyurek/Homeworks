//
//  BusServicesViewController.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 25.04.2024.
//

import UIKit

final class BusServicesViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var departureLabel: UILabel!
    @IBOutlet private weak var arrivalLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //MARK: - Variables
    private var startedTime = String()
    private var finisihedTime = ["08:30","10:30","10:45","09:00","14:00","13:00"]
    private var price = [700,800,900,1000,1200,1300]
    var routes = [Routes]()
    var departure = String()
    var arrival = String()
    var date = String()
    static let identifier = "BusServicesViewController"
    
   //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewRegister()
        prepareLabels()
        routesAppend()
    }
    
    private func prepareLabels(){
        departureLabel.text = departure
        arrivalLabel.text = arrival
        dateLabel.text = date
    }
    
    private func collectionViewRegister() {
        collectionView.register(UINib(nibName: RoutesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RoutesCollectionViewCell.identifier)
    }
    
    private func routesAppend() {
        routes =
        [.init(companyName: "Has Turizm", companyImage: "has", timeLabel: "06:00", dateLabel: date, price: price[1], departurePoint: departure, arrivalPoint: arrival),
         .init(companyName: "Çayırağası Turizm", companyImage: "cayiragasi", timeLabel: "08:00", dateLabel: date, price: price[3], departurePoint: departure, arrivalPoint: arrival),
         .init(companyName: "Öz Diyarbakır Turizm", companyImage: "diyarbakır", timeLabel: "10:00", dateLabel: date, price: price[1], departurePoint: departure, arrivalPoint: arrival),
         .init(companyName: "Seç Turizm", companyImage: "sec", timeLabel: "12:00", dateLabel: date, price: price[3], departurePoint: departure, arrivalPoint: arrival),
         .init(companyName: "Lüks Adana Turizm", companyImage: "adana", timeLabel: "13:00", dateLabel: date, price: price[3], departurePoint: departure, arrivalPoint: arrival),
         .init(companyName: "Lider Muş Tur Turizm", companyImage: "mus", timeLabel: "14:00", dateLabel: date, price: price[2], departurePoint: departure, arrivalPoint: arrival),
         .init(companyName: "Metro Turizm", companyImage: "metro", timeLabel: "16:00", dateLabel: date, price: price[1], departurePoint: departure, arrivalPoint: arrival),
         .init(companyName: "Kamil Koç Turizm", companyImage: "kamilkoc", timeLabel: "17:00", dateLabel: date, price: price[2], departurePoint: departure, arrivalPoint: arrival),
         .init(companyName: "Varan Turizm", companyImage: "varan", timeLabel: "18:00", dateLabel: date, price: price[2], departurePoint: departure, arrivalPoint: arrival),
         .init(companyName: "Ben Turizm", companyImage: "ben", timeLabel: "20:00", dateLabel: date, price: price[2], departurePoint: departure, arrivalPoint: arrival),
         .init(companyName: "Kamil Koç Turizm", companyImage: "kamilkoc", timeLabel: "22:00", dateLabel: date, price: price[2], departurePoint: departure, arrivalPoint: arrival),
         .init(companyName: "Metro Turizm", companyImage: "metro", timeLabel: "00:00", dateLabel: date, price: price[1], departurePoint: departure, arrivalPoint: arrival),
        ]
    }
}

//MARK: - CollectionView Extensions
extension BusServicesViewController: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        routes.count
    }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoutesCollectionViewCell.identifier, for: indexPath) as? RoutesCollectionViewCell else { return UICollectionViewCell() }
        
        cell.config(with: routes[indexPath.item])
        return cell
        
    }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let cellWidth: CGFloat = collectionView.frame.width - 20
           let cellHeight: CGFloat = 130
           
           return CGSize(width: cellWidth, height: cellHeight)
       }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectSeatVC = SelectSeatsViewController(nibName: SelectSeatsViewController.identifier, bundle: nil)
        navigationController?.pushViewController(selectSeatVC, animated: true)
//        selectSeatVC.arrivalText = self.arrival
//        selectSeatVC.departureText = self.departure
        print("Select Seat VC")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
}
