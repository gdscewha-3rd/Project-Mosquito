//
//  ReportWriteRegionView.swift
//  StopMosquito
//
//  Created by 이서영 on 2022/06/28.
//

import Foundation
import UIKit

class ReportWriteRegionView: UIView {
    
    var stackView = UIStackView()
    var titleLabel = UILabel()
    var regionTextField = UITextField()
    
    let regions = [
        "서울",
        "경기",
        "인천",
        "강원",
        "대전",
        "충남",
        "충북",
        "세종",
        "광주",
        "전남",
        "전북",
        "대구",
        "경북",
        "부산",
        "경남",
        "제주",
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setPickerView()
        dismissPickerView()
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

extension ReportWriteRegionView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(named: "background")
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "발견 지역"
        
        regionTextField.translatesAutoresizingMaskIntoConstraints = false
        regionTextField.placeholder = "지역을 선택해주세요."
        regionTextField.backgroundColor = .white
        regionTextField.borderStyle = .roundedRect
        regionTextField.tintColor = .clear
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(regionTextField)
        
        addSubview(stackView)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
    }
}

extension ReportWriteRegionView {
    func setPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        regionTextField.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let button = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(closePickerView))
        toolBar.setItems([spaceButton, button], animated: true)
        toolBar.isUserInteractionEnabled = true
        regionTextField.inputAccessoryView = toolBar
    }
    
    @objc func closePickerView() {
        endEditing(true)
    }
}

extension ReportWriteRegionView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return regions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        regionTextField.text = regions[row]
    }
}

extension ReportWriteRegionView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return regions.count
    }
    
    
}
