//
//  ForecastViewController.swift
//  StopMosquito
//
//  Created by 이서영 on 2022/06/24.
//

import Foundation
import UIKit

class ForecastViewController: UIViewController {
    
    let dateLabel = UILabel()
    let weatherStackView = UIStackView()
    let regionLabel = UILabel()
    let temperatureLabel = UILabel()
    let humidityLabel = UILabel()
    let forecastTodayChartView = ForecastTodayChartView()
    let forecastWeekChartView = ForecastWeekChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ForecastViewController {
    
    func style() {
        view.backgroundColor = UIColor(named: "background")
        
        // Date
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont.preferredFont(forTextStyle: .body)
        dateLabel.adjustsFontForContentSizeCategory = true
        dateLabel.text = "Date Test"
        
        // Weather
        regionLabel.translatesAutoresizingMaskIntoConstraints = false
        regionLabel.textAlignment = .right
        regionLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        regionLabel.adjustsFontForContentSizeCategory = true
        regionLabel.text = "Region"
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.textAlignment = .right
        temperatureLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        temperatureLabel.adjustsFontForContentSizeCategory = true
        temperatureLabel.text = "Temperature"
        
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.textAlignment = .right
        humidityLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        humidityLabel.adjustsFontForContentSizeCategory = true
        humidityLabel.text = "Humidity"
                
        weatherStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherStackView.axis = .horizontal
        weatherStackView.spacing = 4
        
        forecastTodayChartView.translatesAutoresizingMaskIntoConstraints = false
        forecastWeekChartView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dateLabel)
        
        weatherStackView.addArrangedSubview(regionLabel)
        weatherStackView.addArrangedSubview(temperatureLabel)
        weatherStackView.addArrangedSubview(humidityLabel)
        
        view.addSubview(weatherStackView)
        view.addSubview(forecastTodayChartView)
        view.addSubview(forecastWeekChartView)

    }
    
    func layout() {
        // Date and Weather
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 10),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherStackView.topAnchor.constraint(equalToSystemSpacingBelow: dateLabel.bottomAnchor, multiplier: 1),
            weatherStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Today Score Chart
        NSLayoutConstraint.activate([
            forecastTodayChartView.topAnchor.constraint(equalToSystemSpacingBelow: weatherStackView.bottomAnchor, multiplier: 4),
            forecastTodayChartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forecastTodayChartView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: forecastTodayChartView.trailingAnchor, multiplier: 2)
        ])
        
        // Week Score Chart
        NSLayoutConstraint.activate([
            forecastWeekChartView.topAnchor.constraint(equalToSystemSpacingBelow: forecastTodayChartView.bottomAnchor, multiplier: 5),
            forecastWeekChartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forecastWeekChartView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: forecastTodayChartView.trailingAnchor, multiplier: 2)
        ])
    }
}
