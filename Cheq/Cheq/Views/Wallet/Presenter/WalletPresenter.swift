//
//  WalletPresenter.swift
//  Cheq
//
//  Created by Danish Aziz on 23/2/20.
//  Copyright © 2020 Danish Aziz. All rights reserved.
//

import UIKit

protocol WalletPresenterDelegate: NSObjectProtocol {
    func reload()
}

class WalletPresenter: NSObject {

    private let dataModel: WalletDataModel = WalletDataModel()
    private var livingExpenses: LivingExpenses = []
    private var cards: Cards = []
    
    weak var delegate: WalletPresenterDelegate?
    
    func getMonths() -> [String] {
        return ["January", "Febuary", "March", "Apirl", "May", "June", "July", "August", "September", "Octobar", "November", "December"]
    }
    
    func loadLivingExpenses() {
        self.livingExpenses = dataModel.getLivingExpenses()
        self.delegate?.reload()
    }
    
    func loadCards() {
        self.cards = dataModel.getCards()
        self.delegate?.reload()
    }
    
    func getLivingExpenseCount() -> Int {
        return self.livingExpenses.count
    }
    
    func getCardCount() -> Int {
        return self.cards.count
    }
    
    func getLivingExpense(row: Int) -> LivingExpense {
        return self.livingExpenses[row]
    }
    
    func getCard(row: Int) -> Card {
        return self.cards[row]
    }
}
