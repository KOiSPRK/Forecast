//
//  CurrentViewController.swift
//  Forecast
//
//  Created by KOiSPRK on 10/22/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

enum Unit: String {
    case fahrenheit = "imperial"
    case celsius = "metric"
}

class CurrentViewController: BaseViewController {
    
    let viewModel = CurrentViewModel()
    var observers = [NSKeyValueObservation]()
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var unitButton: UIButton!
    @IBOutlet weak var highestTempLabel: UILabel!
    @IBOutlet weak var lowestTempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var weatherView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var bgImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func configureView() {
        super.configureView()
        self.observeModel()
        self.dateLabel.text = self.viewModel.getDate()
        self.setupSearchViewController()
    }

    // MARK: Private

    fileprivate func observeModel() {
        self.observers = [
            viewModel.observe(\.weather, options: [.initial, .new]) { (model, change) in
                DispatchQueue.main.async {
                    self.updateInfo()
                }
            }
        ]
    }
    
    fileprivate func updateInfo() {
        self.locationLabel.text = self.viewModel.getCityName()
        self.tempLabel.text = self.viewModel.getTemp()
        self.humidityLabel.text = self.viewModel.getHumidity()
        self.highestTempLabel.text = self.viewModel.getHighestTemp()
        self.lowestTempLabel.text = self.viewModel.getLowestTemp()
        
        self.unitButton.isEnabled = self.viewModel.weather.temp != nil
        guard self.viewModel.weather.temp != nil else {
            return
        }
        let tempUnitTxt = "C° / F°"
        let unit = self.viewModel.weather.unit == .fahrenheit ? "F°" : "C°"
        let text = tempUnitTxt.getAttributedBoldString(boldTxt: unit)
        self.unitButton.setAttributedTitle(text, for: .normal)
    }
    
    fileprivate func setupSearchViewController() {
        self.searchController.searchBar.placeholder = "Search"
        self.searchController.searchBar.tintColor = .black
        self.searchController.searchBar.delegate = self
        self.definesPresentationContext = true
        
        self.tabBarController?.navigationItem.searchController = searchController
    }
    
    // MARK: Actions
    
    @IBAction func didTapUnitButton(_ sender: UIButton) {
        self.viewModel.weather.unit = self.viewModel.weather.unit != .fahrenheit ? .fahrenheit : .celsius
        self.viewModel.getWeather()
    }
    
}

extension CurrentViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            return
        }
        
        let keys = searchText.components(separatedBy: ",")
        DataManager.shared.city = keys[0]
        if keys.count > 1 {
            DataManager.shared.countryCode = keys[1]
        }
        
        self.viewModel.getWeather()
        self.searchController.searchBar.text = ""
        self.searchController.dismiss(animated: true, completion: nil)
    }

}
