//
//  WeatherTableViewCell.swift
//  Forecast
//
//  Created by KOiSPRK on 10/25/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var highestTempLabel: UILabel!
    @IBOutlet weak var lowestTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with weather: Weather?) {
        self.highestTempLabel.text = String(Int(weather?.highestTemp ?? 0))
        self.lowestTempLabel.text = String(Int(weather?.lowestTemp ?? 0))
    }
    
}
