//
//  PassengerInfoViewController.swift
//  BusBooking
//
//  Created by Doğukan Temizyürek on 28.04.2024.
//

import UIKit

final class PassengerInfoViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    //MARK: - Variables
    var departure = String()
    var arrival = String()
    var date = String()
    static let identifier = "PassengerInfoViewController"
   //MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLabels()
    }
    
    //MARK: - Private functions
    private func prepareLabels() {
        departureLabel.text = departure
        arrivalLabel.text = arrival
        dateLabel.text = date
    }
    
    
}
//MARK: - CollectionView Extensions

extension PassengerInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PassengerCollectionViewCell.identifier, for: indexPath) as? PassengerCollectionViewCell else {return .init()}
        
        return cell
    }
    
    
}
