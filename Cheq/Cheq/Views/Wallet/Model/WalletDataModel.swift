//
//  WalletDataModel.swift
//  Cheq
//
//  Created by Danish Aziz on 23/2/20.
//  Copyright © 2020 Danish Aziz. All rights reserved.
//

import UIKit

class WalletDataModel: NSObject {
    
    let api: FirebaseAPI = FirebaseAPI()
    
    func getLivingExpense(response: @escaping (_ livingExpenses: LivingExpenses?) -> Void) {
        api.getLivingExpense { (living) in
            response(living)
        }
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
        
        var randomAmount = random()
        let january = TimeGraphData(id: 1, amount: "\(Int(randomAmount * 10))$", month: "JAN", percentage: randomAmount)
        randomAmount = random()
        let febraury = TimeGraphData(id: 2, amount: "\(Int(randomAmount * 10))$", month: "FEB", percentage: randomAmount)
        randomAmount = random()
        let march = TimeGraphData(id: 3, amount: "\(Int(randomAmount * 10))$", month: "MAR", percentage: randomAmount)
        randomAmount = random()
        let april = TimeGraphData(id: 4, amount: "\(Int(randomAmount * 10))$", month: "APR", percentage: randomAmount)
        randomAmount = random()
        let may = TimeGraphData(id: 5, amount: "\(Int(randomAmount * 10))$", month: "MAY", percentage: randomAmount)
        randomAmount = random()
        let june = TimeGraphData(id: 6, amount: "\(Int(randomAmount * 10))$", month: "JUN", percentage: randomAmount)
        
        return [january,febraury,march,april,may,june]
    }
    
    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    func random() -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF) * 100.0
    }
}
