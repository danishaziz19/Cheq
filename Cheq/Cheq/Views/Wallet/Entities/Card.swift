//
//  Card.swift
//  Cheq
//
//  Created by Danish Aziz on 23/2/20.
//  Copyright © 2020 Danish Aziz. All rights reserved.
//

import Foundation
import UIKit

struct Card {
    var id: Int
    var cardName: String
    var gradientColor1: UIColor
    var gradientColor2: UIColor
    var monthsData: TimeGraphDataArray
}

typealias Cards = [Card]
