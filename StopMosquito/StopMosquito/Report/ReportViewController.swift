//
//  ReportViewController.swift
//  StopMosquito
//
//  Created by 이서영 on 2022/06/27.
//

import Foundation
import UIKit

class ReportViewController: UIViewController {
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension ReportViewController {
    
    private func setup() {
        view.backgroundColor = UIColor(named: "background")
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = UIColor(named: "background")
                
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ReportCell.self, forCellReuseIdentifier: ReportCell.reuseID)
        tableView.rowHeight = ReportCell.rowHeight
        tableView.tableFooterView = UIView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.separatorColor = .clear

        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ReportViewController: UITableViewDelegate {
    
}

extension ReportViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReportCell.reuseID, for: indexPath) as! ReportCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
    }
    
}
