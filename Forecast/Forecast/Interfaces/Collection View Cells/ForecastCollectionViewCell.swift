//
//  ForecastCollectionViewCell.swift
//  Forecast
//
//  Created by KOiSPRK on 10/25/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with weather: Weather) {
        self.timeLabel.text = weather.dateTime?.toString(withFormat: "h a")
        guard let temp = weather.temp else {
            return
        }
        self.tempLabel.text = String(Int(temp)) + "°"
    }

}
