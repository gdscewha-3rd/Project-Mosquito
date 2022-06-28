//
//  ReportWriteContentView.swift
//  StopMosquito
//
//  Created by 이서영 on 2022/06/29.
//
import Foundation
import UIKit

class ReportWriteContentView: UIView {
    
    var stackView = UIStackView()
    var titleLabel = UILabel()
    var contentTextView = UITextView(frame: CGRect(x: 20.0, y: 90.0, width: 250.0, height: 100.0))
    
    let textViewPlaceHolder = "하고 싶은 말을 자유롭게 써 보아요."
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
    }
}

extension ReportWriteContentView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(named: "background")
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        titleLabel.text = "모기에게 한 마디 🤬"
        titleLabel.adjustsFontForContentSizeCategory = true
        
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        contentTextView.backgroundColor = .white
        contentTextView.text = textViewPlaceHolder
        contentTextView.layer.borderWidth = 1
        contentTextView.layer.borderColor = UIColor.systemGray5.cgColor
        contentTextView.layer.masksToBounds = true
        contentTextView.layer.cornerRadius = 8
        contentTextView.textContainerInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        contentTextView.font = UIFont.preferredFont(forTextStyle: .body)
        contentTextView.textColor = .systemGray3
        contentTextView.delegate = self
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(contentTextView)
        
        addSubview(stackView)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}

extension ReportWriteContentView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .systemGray3
        }
    }
}
