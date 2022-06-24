//
//  ForecastScoreChart.swift
//  StopMosquito
//
//  Created by 이서영 on 2022/06/24.
//

import Foundation
import UIKit

class ForecastScoreChart: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
        self.drawCircle(center: center, radius: 100, startAngle: 0, endAngle: CGFloat(.pi * 0.3), color: UIColor.red)
        self.drawCircle(center: center, radius: 100, startAngle: CGFloat(.pi * 0.25), endAngle: CGFloat(.pi * 0.2), color: UIColor.green)
//        self.drawCircle(center: center, radius: 100, startAngle: CGFloat(.pi * 0.9), endAngle: CGFloat(.pi * 0.0), color: UIColor.blue)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 200, height: 200)
//    }
}

extension ForecastScoreChart {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        
    }
    
    func drawCircle(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle:CGFloat, color: UIColor) {
        
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = color.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 50.0
        
        layer.addSublayer(shapeLayer)
        
    }
}
