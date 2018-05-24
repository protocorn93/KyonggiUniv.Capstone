//
//  CategoryCell + Gesture.swift
//  CapstoneProject
//
//  Created by 이동건 on 2018. 4. 25..
//  Copyright © 2018년 이동건. All rights reserved.
//

import UIKit

extension CategoryCell {
    func setupGesture(){
        self.itemsCollectionView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleRemoveItem)))
    }
    
    @objc func handleRemoveItem(gesture: UILongPressGestureRecognizer){
        guard let keyWindow = UIApplication.shared.keyWindow else {return}
        let location = gesture.location(in: self.itemsCollectionView)
        guard let indexPath = itemsCollectionView.indexPathForItem(at: location) else {return}
        
        let alert:UIAlertController!
        switch category {
        case .Card:
            let item = UserData.default.cards[indexPath.row]
            alert = UIAlertController(title: nil, message: "Remove \(item.name)?", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (_) in
                UserData.default.cards.remove(at: indexPath.row)
                self.itemsCollectionView.deleteItems(at: [indexPath])
            }))
            alert.addAction(UIAlertAction(title: "Cencel", style: .cancel, handler: nil))
            keyWindow.rootViewController?.present(alert, animated: true, completion: nil)
        case .Brand:
            let item = UserData.default.brands[indexPath.row]
            alert = UIAlertController(title: nil, message: "Remove \(item.name)?", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (_) in
                UserData.default.brands.remove(at: indexPath.row)
                self.itemsCollectionView.deleteItems(at: [indexPath])
            }))
            alert.addAction(UIAlertAction(title: "Cencel", style: .cancel, handler: nil))
            keyWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}
