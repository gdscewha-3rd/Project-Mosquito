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
    var writeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension ReportViewController {
    
    private func setup() {
        view.backgroundColor = UIColor(named: "background")
        setupTableView()
        setupWriteButton()
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
    
    private func setupWriteButton() {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "제보하기"
        configuration.image = UIImage(systemName: "plus")
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        configuration.imagePadding = 8
        configuration.buttonSize = .small
        configuration.background.cornerRadius = 16
        configuration.baseBackgroundColor = .white
        configuration.baseForegroundColor = .black
        
        writeButton = UIButton(configuration: configuration)
        writeButton.translatesAutoresizingMaskIntoConstraints = false
        
        writeButton.layer.borderWidth = 1
        writeButton.layer.borderColor = UIColor.systemGray5.cgColor
        writeButton.layer.cornerRadius = 16
        
        view.addSubview(writeButton)
        
        NSLayoutConstraint.activate([
            writeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: writeButton.bottomAnchor, multiplier: 4)
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
