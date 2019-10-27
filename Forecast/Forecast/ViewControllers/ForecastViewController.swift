//
//  ForecastViewController.swift
//  Forecast
//
//  Created by KOiSPRK on 10/25/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

class ForecastViewController: BaseViewController {
    
    var viewModel = WeatherForecastViewModel()
    var observers = [NSKeyValueObservation]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configureView() {
        self.tableView.registerNibs(tableViewCells: [WeatherTableViewCell.self])
        self.tableView.tableFooterView = UIView()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.registerNibs(collectionViewCells: [ForecastCollectionViewCell.self])
        self.configureCollectionViewCell()
        self.observeModel()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.getWeatherForecast()
    }
    
    // MARK: Private

     fileprivate func observeModel() {
        self.observers = [
            viewModel.observe(\.forecast, options: [.initial, .new]) { (model, change) in
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    self.tableView.reloadData()
                }
            }
        ]
    }

    fileprivate func configureCollectionViewCell() {
        let cellSize = CGSize(width: 90, height: 100)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        self.collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
}

// MARK: - UITableView

extension ForecastViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
}

extension ForecastViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.getWeather().temp == nil ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(of: WeatherTableViewCell.self, for: indexPath)
        cell.configure(with: DataManager.shared.getWeather())
        return cell
    }
    
}


// MARK: - UICollectionView

extension ForecastViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.forecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(of: ForecastCollectionViewCell.self, for: indexPath)
        cell.configure(with: self.viewModel.forecast[indexPath.row])
        return cell
    }
}

extension ForecastViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}
