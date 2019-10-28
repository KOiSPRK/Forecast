//
//  UITableViewExtension.swift
//  Forecast
//
//  Created by KOiSPRK on 10/22/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerNib(tableViewCell:UITableViewCell.Type){
        self.register(UINib.init(nibName: String(describing: tableViewCell), bundle: nil), forCellReuseIdentifier: String(describing: tableViewCell))
    }
    
    func registerNibs(tableViewCells:[UITableViewCell.Type]) {
        tableViewCells.forEach { (tableViewCell) in
            self.registerNib(tableViewCell: tableViewCell)
        }
    }
    
    func dequeueCell<T:UITableViewCell>(of type: T.Type ,for indexPath:IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.identifier(), for: indexPath ) as! T
    }
    
}
