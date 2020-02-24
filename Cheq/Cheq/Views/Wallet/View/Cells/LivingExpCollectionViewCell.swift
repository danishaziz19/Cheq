//
//  LivingExpCollectionViewCell.swift
//  Cheq
//
//  Created by Danish Aziz on 23/2/20.
//  Copyright © 2020 Danish Aziz. All rights reserved.
//

import UIKit

class LivingExpCollectionViewCell: UICollectionViewCell, PiechartDelegate {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var piechart: Piechart!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(livingExpense: LivingExpense) {
       
        icon.image = UIImage(named: livingExpense.icon)
        
        var pieChartSlise = Piechart.Slice()
        pieChartSlise.value = livingExpense.value
        pieChartSlise.color = livingExpense.color
        pieChartSlise.text = livingExpense.title
        
        piechart.delegate = self
        piechart.title = livingExpense.title
        piechart.activeSlice = 0
        piechart.slices = [pieChartSlise]
        piechart.total = 100
        
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowRadius = 4
        
        lblTitle.text = livingExpense.expenseType
    }
    
    func setSubtitle(_ total: CGFloat, slice: Piechart.Slice) -> String {
        return "\(Int(slice.value))%"
    }

    func setInfo(_ total: CGFloat, slice: Piechart.Slice) -> String {
        return ""
    }

}
