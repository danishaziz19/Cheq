//
//  LivingExpense.swift
//  Cheq
//
//  Created by Danish Aziz on 23/2/20.
//  Copyright © 2020 Danish Aziz. All rights reserved.
//

import Foundation
import UIKit

struct LivingExpense {
    var id: Int
    var value: CGFloat
    var title: String
    var color: UIColor
    var expenseType: String
    var icon: String
}

typealias LivingExpenses = [LivingExpense]
