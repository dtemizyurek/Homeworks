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
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Variables
    var departure = String()
    var arrival = String()
    var date = String()
    var selectedSeats = [Int]()
    static let identifier = "PassengerInfoViewController"
    
    //MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLabels()
        NIBRegister()
    }
    
    //MARK: - Private functions
    private func prepareLabels() {
        departureLabel.text = departure
        arrivalLabel.text = arrival
        dateLabel.text = date
    }
    
    private func NIBRegister() {
        collectionView.register(UINib(nibName: PassengerCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PassengerCollectionViewCell.identifier)
    }
}
//MARK: - CollectionView Extensions

extension PassengerInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedSeats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PassengerCollectionViewCell.identifier, for: indexPath) as? PassengerCollectionViewCell else {return .init()}
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = collectionView.frame.width - 20
        let cellHeight: CGFloat = 190
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}
