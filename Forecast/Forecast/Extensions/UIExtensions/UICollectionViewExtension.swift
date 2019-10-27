//
//  UICollectionViewExtension.swift
//  Forecast
//
//  Created by KOiSPRK on 10/22/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerNib(collectionViewCell:UICollectionViewCell.Type){
        self.register(UINib.init(nibName: String(describing: collectionViewCell), bundle: nil), forCellWithReuseIdentifier: String(describing: collectionViewCell))
    }
    
    func registerNibs(collectionViewCells:[UICollectionViewCell.Type]) {
        collectionViewCells.forEach { (collectionViewCell) in
            self.registerNib(collectionViewCell: collectionViewCell)
        }
    }
    
    
    func registerNib(forSupplementaryViewOfKind kind:String, classType:UICollectionReusableView.Type) {
        self.register(UINib.init(nibName: String(describing: classType), bundle: nil), forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: classType))
    }
    
    func registerNibs(forSupplementaryViewOfKind kind:String, classTypes:[UICollectionReusableView.Type]) {
        classTypes.forEach { (collectionViewCell) in
            self.registerNib(forSupplementaryViewOfKind: kind, classType: collectionViewCell)
        }
    }
   
    func dequeueCell<T:UICollectionViewCell>(of type: T.Type ,for indexPath:IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.identifier(), for: indexPath ) as! T
    }

    func dequeueReusableCell<T: UICollectionReusableView>(ofKind kind: String, withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError("Couldn't find UICollectionReusableView for \(String(describing: name))")
        }
        return cell
    }
}
