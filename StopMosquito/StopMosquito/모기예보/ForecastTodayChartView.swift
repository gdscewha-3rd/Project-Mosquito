import UIKit
import Charts

class ForecastTodayChartView: UIView {
    
    @IBOutlet var contentView: ForecastTodayChartView!
    @IBOutlet var pieChartView: PieChartView!
    
    var dataEntry = PieChartDataEntry(value: 25, label: "")
    var numberOfDownoladsDataEntries = [PieChartDataEntry(value: 25), PieChartDataEntry(value: 25), PieChartDataEntry(value: 25), PieChartDataEntry(value: 25)]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 150)
    }
    
    private func commonInit() {
        let bundle = Bundle(for: ForecastTodayChartView.self)
        bundle.loadNibNamed("ForecastTodayChartView", owner: self, options: nil)
        addSubview(contentView)
        addSubview(pieChartView)
        
        contentView.backgroundColor = UIColor(named: "background")
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        pieChartView.translatesAutoresizingMaskIntoConstraints = false
        pieChartView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pieChartView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        pieChartView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        pieChartView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        setPieChartView()
    }
    
    private func setPieChartView() {
        pieChartView.noDataText = "데이터가 없습니다."
        pieChartView.noDataFont = .systemFont(ofSize: 20)
        pieChartView.noDataTextColor = .lightGray
        
        pieChartView.holeColor = nil
        pieChartView.transparentCircleColor = NSUIColor.white.withAlphaComponent(0.43)
        pieChartView.holeRadiusPercent = 0.58
        pieChartView.rotationEnabled = false
        pieChartView.highlightPerTapEnabled = false

        pieChartView.maxAngle = 180
        pieChartView.rotationAngle = 180
        pieChartView.centerTextOffset = CGPoint(x: 0, y: -20)
        
        pieChartView.legend.enabled = false
        
        updateChartData()
    }
    
    private func updateChartData() {
        let chartDataSet = PieChartDataSet(entries: numberOfDownoladsDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named: "customGreen"), UIColor.orange, UIColor.gray, UIColor.red]
        chartDataSet.colors = colors as! [NSUIColor]
        
        chartDataSet.drawValuesEnabled = false
        
        pieChartView.data = chartData
    }
}
