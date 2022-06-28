//
//  ReportWriteViewController.swift
//  StopMosquito
//
//  Created by 이서영 on 2022/06/28.
//

import Foundation
import UIKit

class ReportWriteViewController: UIViewController {
    
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
    }
    
    func layout() {
        
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
