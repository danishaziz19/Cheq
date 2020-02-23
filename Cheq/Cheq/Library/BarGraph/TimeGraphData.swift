//
//  TimeGraphData.swift
//  Cheq
//
//  Created by Danish Aziz on 21/2/20.
//  Copyright © 2020 Danish Aziz. All rights reserved.
//

import Foundation

struct TimeGraphData {
    var id: Int
    var amount: String
    var month: String
    var percentage: Double
    
    init (id: Int, amount: String, month: String, percentage: Double) {
        self.id = id
        self.amount = amount
        self.month = month
        self.percentage = percentage
    }
}

typealias TimeGraphDataArray = [TimeGraphData]
