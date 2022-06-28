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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setNavigationBar()
        layout()
    }
}

extension ReportWriteViewController {
    
    func style() {
        view.backgroundColor = UIColor(named: "background")
        
        reportWriteRegionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        view.addSubview(reportWriteRegionView)
        
        NSLayoutConstraint.activate([
            reportWriteRegionView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            reportWriteRegionView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: reportWriteRegionView.trailingAnchor, multiplier: 1)
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
