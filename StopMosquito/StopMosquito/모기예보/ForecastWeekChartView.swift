//
//  ForecastWeekChartView.swift
//  StopMosquito
//
//  Created by 이서영 on 2022/06/27.
//

import Foundation
import UIKit
import Charts

class ForecastWeekChartView: UIView {
    
    @IBOutlet var barChartView: BarChartView!
    
    var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]
    var unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setBarChartView(dataPoints: months, values: unitsSold)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 250)
    }
    
    private func commonInit() {
        let bundle = Bundle(for: ForecastWeekChartView.self)
        bundle.loadNibNamed("ForecastWeekChartView", owner: self, options: nil)
        addSubview(barChartView)

        barChartView.translatesAutoresizingMaskIntoConstraints = false
        barChartView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        barChartView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        barChartView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        barChartView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        initBarChartView()
    }
    
    private func initBarChartView() {
        barChartView.noDataText = "데이터가 없습니다."
        barChartView.noDataFont = .systemFont(ofSize: 20)
        barChartView.noDataTextColor = .lightGray
        
        // 그리드 및 범주 숨김
        barChartView.leftAxis.enabled = false
        barChartView.rightAxis.enabled = false
//        barChartView.xAxis.enabled = false
        barChartView.legend.enabled = false
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.drawAxisLineEnabled = false
        barChartView.xAxis.drawLabelsEnabled = true
        
        // X축 레이블 위치 조정
        barChartView.xAxis.labelPosition = .bottom
        // X축 레이블 포맷 지정
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
    }
    
    private func setBarChartView(dataPoints: [String], values: [Double]) {
        // 데이터 생성
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "판매량")

        // 차트 컬러
        chartDataSet.colors = [UIColor(named: "customGreen")!]
        
        chartDataSet.valueFont = UIFont.preferredFont(forTextStyle: .caption2)
        
        // 데이터 삽입
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        
        // 선택 안되게
        chartDataSet.highlightEnabled = false
        // 줌 안되게
        barChartView.doubleTapToZoomEnabled = false
        
        //기본 애니메이션
        barChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
        
    }
}
