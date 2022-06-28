//
//  ReportWriteViewController.swift
//  StopMosquito
//
//  Created by 이서영 on 2022/06/28.
//

import Foundation
import UIKit

class ReportWriteViewController: UIViewController {
    
    var reportWriteRegionView = ReportWriteRegionView()
    var reportWriteContentView = ReportWriteContentView()
    var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDoneButton()
        style()
        setNavigationBar()
        layout()
    }
}

extension ReportWriteViewController {
    
    func setupDoneButton() {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "작성 완료"
        configuration.cornerStyle = .capsule
        configuration.baseBackgroundColor = UIColor(named: "customGreen")
        configuration.baseForegroundColor = .white
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
        
        doneButton = UIButton(configuration: configuration)
        doneButton.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func style() {
        view.backgroundColor = UIColor(named: "background")
        
        reportWriteRegionView.translatesAutoresizingMaskIntoConstraints = false
        reportWriteContentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        view.addSubview(reportWriteRegionView)
        view.addSubview(reportWriteContentView)
        view.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
            reportWriteRegionView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            reportWriteRegionView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: reportWriteRegionView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            reportWriteContentView.topAnchor.constraint(equalToSystemSpacingBelow: reportWriteRegionView.bottomAnchor, multiplier: 1),
            reportWriteContentView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: reportWriteContentView.trailingAnchor, multiplier: 1),
            doneButton.topAnchor.constraint(equalToSystemSpacingBelow: reportWriteContentView.bottomAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            doneButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: doneButton.trailingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: doneButton.bottomAnchor, multiplier: 2)
        ])
    }
}

extension ReportWriteViewController {
    func setNavigationBar() {
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(popVC))
        closeButton.tintColor = .black
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc func popVC() {
        self.dismiss(animated: true, completion: nil)
    }
}
