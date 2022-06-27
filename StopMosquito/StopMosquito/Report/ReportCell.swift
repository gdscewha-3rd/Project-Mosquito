//
//  ReportCell.swift
//  StopMosquito
//
//  Created by 이서영 on 2022/06/27.
//

import Foundation
import UIKit

class ReportCell: UITableViewCell {
    
    var titleStackView = UIStackView()
    var regionLabel = UILabel()
    var regionTitleLabel = UILabel()
    var contentLabel = UILabel()
    var dateLabel = UILabel()
    
    static let reuseID = "ReportCell"
    static let rowHeight: CGFloat = 120
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8.0, left: 16, bottom: 8, right: 16))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        selectionStyle = .none
        
        if selected {
            contentView.layer.backgroundColor = UIColor.systemGray5.cgColor
        } else {
            contentView.layer.backgroundColor = UIColor.white.cgColor
        }
    }
}

extension ReportCell {
    private func setup() {
        backgroundColor = UIColor(named: "background")
        contentView.layer.backgroundColor = UIColor.white.cgColor
        contentView.layer.cornerRadius = 8
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
        contentView.layer.borderWidth = 1
        
        regionLabel.translatesAutoresizingMaskIntoConstraints = false
        if let regionDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .title3).withSymbolicTraits(.traitBold) {
            
            regionLabel.font = UIFont(descriptor: regionDescriptor,
                                      size: 0.0)
        }
        regionLabel.adjustsFontForContentSizeCategory = true
        regionLabel.text = "지역"
        
        regionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        regionTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        regionTitleLabel.adjustsFontForContentSizeCategory = true
        regionTitleLabel.text = "에서 모기 발견!"
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.font = UIFont.preferredFont(forTextStyle: .body)
        contentLabel.adjustsFontForContentSizeCategory = true
        contentLabel.text = "내용"
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        dateLabel.adjustsFontForContentSizeCategory = true
        dateLabel.text = "0000년 00월 00일"
        
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.axis = .horizontal
        
    }
    
    private func layout() {
        titleStackView.addArrangedSubview(regionLabel)
        titleStackView.addArrangedSubview(regionTitleLabel)
        
        contentView.addSubview(titleStackView)
        contentView.addSubview(contentLabel)
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
            titleStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            contentLabel.topAnchor.constraint(equalTo: titleStackView.bottomAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: regionLabel.leadingAnchor),
            dateLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentLabel.bottomAnchor, multiplier: 2),
            dateLabel.leadingAnchor.constraint(equalTo: regionLabel.leadingAnchor),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: dateLabel.bottomAnchor, multiplier: 2)
        ])
    }
}
