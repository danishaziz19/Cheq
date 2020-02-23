//
//  WalletDataModel.swift
//  Cheq
//
//  Created by Danish Aziz on 23/2/20.
//  Copyright © 2020 Danish Aziz. All rights reserved.
//

import UIKit

class WalletDataModel: NSObject {
    
    func getLivingExpenses() -> LivingExpenses {
        return []
    }
    
    func getCards() -> Cards {
        
        var cards: Cards = []
        
        cards.append(Card(id: 0, cardName: "ANZ", gradientColor1: UIColor.red, gradientColor2: UIColor.systemBlue, monthsData: getTimeGraphData()))
        cards.append(Card(id: 1, cardName: "Westpac", gradientColor1: UIColor.systemOrange, gradientColor2: UIColor.red, monthsData: getTimeGraphData()))
        cards.append(Card(id: 2, cardName: "CommBank", gradientColor1: UIColor.systemYellow, gradientColor2: UIColor.black, monthsData: getTimeGraphData()))
        cards.append(Card(id: 3, cardName: "NAB", gradientColor1: UIColor.red, gradientColor2: UIColor.black, monthsData: getTimeGraphData()))
        
        return cards
    }
    
    private func getTimeGraphData() -> [TimeGraphData] {
        
        let january = TimeGraphData(id: 1, amount: "100$", month: "JAN", percentage: 10.0)
        let febraury = TimeGraphData(id: 2, amount: "200$", month: "FEB", percentage: 20.0)
        let march = TimeGraphData(id: 3, amount: "300$", month: "MAR", percentage: 30.0)
        let april = TimeGraphData(id: 4, amount: "400$", month: "APR", percentage: 40.0)
        let may = TimeGraphData(id: 5, amount: "500$", month: "MAY", percentage: 50.0)
        let june = TimeGraphData(id: 6, amount: "600$", month: "JUN", percentage: 60.0)
        
        return [january,febraury,march,april,may,june]
    }
}
