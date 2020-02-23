//
//  CardCollectionViewCell.swift
//  Cheq
//
//  Created by Danish Aziz on 20/2/20.
//  Copyright © 2020 Danish Aziz. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell, GraphRunningTimeView {
    
    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var graphStackView: UIStackView!
    @IBOutlet weak var indexStackView: UIStackView!
    
    let graphColor: UIColor = UIColor.white.withAlphaComponent(0.5)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    
    override func prepareForReuse() {
        
    }
    
    func setup() {
        gradientView.layer.cornerRadius = 10
    }
    
    func setCell(card: Card) {
        self.lblTitle.text = card.cardName
        self.gradientView.startColor = card.gradientColor1
        self.gradientView.endColor = card.gradientColor2
        self.updateInfo(runningTimeCollection: card.monthsData)
    }
    
    //MARK: Graph Support
    
    func removeGraphElements () {
        removeIndexElements()
        removeAllGraphElements()
    }
    
    func newGraphElement (timeGraphData: TimeGraphData) {
        addIndexElement(timeGraphData: timeGraphData)
        addGraphElement(timeGraphData: timeGraphData)
    }
    
    private func removeIndexElements () {
        for view in indexStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
    }
    
    private func removeAllGraphElements () {
        for view in graphStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
    }
    
    private func addIndexElement (timeGraphData: TimeGraphData) {
        let monthLabelHeight: CGFloat = 10.0
        
        let monthLabel = UILabel()
        monthLabel.text = timeGraphData.month
        monthLabel.font = UIFont.boldSystemFont(ofSize: monthLabelHeight)
        monthLabel.textAlignment = .center
        monthLabel.textColor = UIColor.white
        
        monthLabel.heightAnchor.constraint(equalToConstant: monthLabelHeight).isActive = true
        
        indexStackView.addArrangedSubview(monthLabel)
        indexStackView.translatesAutoresizingMaskIntoConstraints = false;
    }
    
    private func addGraphElement (timeGraphData: TimeGraphData) {
        
        let amountLabelFontSize: CGFloat = 9.0
        let amountLabelPadding: CGFloat = 15.0
        let height = heightPixelsDependOfPercentage(percentage: timeGraphData.percentage)
        let totalHeight = height + amountLabelPadding
        
        let verticalStackView: UIStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fill
        verticalStackView.spacing = 8.0
        
        let amountLabel = UILabel()
        amountLabel.text = timeGraphData.amount
        amountLabel.font = UIFont.boldSystemFont(ofSize: amountLabelFontSize)
        amountLabel.textAlignment = .center
        amountLabel.textColor = UIColor.white
        amountLabel.adjustsFontSizeToFitWidth = true
        amountLabel.heightAnchor.constraint(equalToConstant: amountLabelFontSize).isActive = true
        
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.borderColor = graphColor.cgColor
        view.layer.borderWidth = 2.0
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        verticalStackView.addArrangedSubview(amountLabel)
        verticalStackView.addArrangedSubview(view)
        
        verticalStackView.heightAnchor.constraint(equalToConstant: totalHeight).isActive = true
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false;
        
        graphStackView.addArrangedSubview(verticalStackView)
        graphStackView.translatesAutoresizingMaskIntoConstraints = false;
    }
    
    private func heightPixelsDependOfPercentage (percentage: Double) -> CGFloat {
        let maxHeigh: CGFloat = 90.0
        return (CGFloat(percentage) * maxHeigh) / 100
    }
    
    func updateInfo (runningTimeCollection: [TimeGraphData]){
        removeAllGraphElements()
        for timeGraphData in runningTimeCollection {
            newGraphElement(timeGraphData: timeGraphData)
        }
    }
}
