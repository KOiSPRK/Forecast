//
//  BaseViewModel.swift
//  Forecast
//
//  Created by KOiSPRK on 10/22/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

class BaseViewModel: NSObject {

    @objc dynamic var weather = Weather()
    @objc dynamic var forecast:[Weather] = []
 
}
