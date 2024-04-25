//
//  BusServicesViewController.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 25.04.2024.
//

import UIKit

final class BusServicesViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var departureLabel: UILabel! // Outletleri private yap!
    @IBOutlet private weak var arrivalLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //MARK: - Variables
    private var startedTime = String()
    private var finisihedTime = ["08:30","10:30","10:45","09:00","14:00","13:00"]
    private var price = Int()
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
    }
    
    private func prepareLabels(){
        departureLabel.text = departure
        arrivalLabel.text = arrival
        dateLabel.text = date
    }
    
    private func collectionViewRegister() {
        collectionView.register(UINib(nibName: RoutesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: RoutesCollectionViewCell.identifier)
    }
}

//MARK: - CollectionView Extensions
extension BusServicesViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        routes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoutesCollectionViewCell.identifier, for: indexPath) as? RoutesCollectionViewCell else {return UICollectionViewCell()}
        cell.config(routes[indexPath.item])
        return cell
    }
}
