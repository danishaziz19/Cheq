//
//  FirebaseAPI.swift
//  Cheq
//
//  Created by Danish Aziz on 24/2/20.
//  Copyright © 2020 Danish Aziz. All rights reserved.
//

import UIKit
import Firebase

class FirebaseAPI: NSObject {
    
    lazy var db = Firestore.firestore()
    
    func getLivingExpense(response: @escaping (_ livingExpenses: LivingExpenses?) -> Void) {
        let docReference = db.collection(DBTables.livingExpenses.rawValue)
        docReference.addSnapshotListener(includeMetadataChanges: false) { (querySnapshot, err) in
            var livingExpenses: LivingExpenses = []
            if let err = err {
                print("Error getting documents: \(err)")
                response(nil)
            } else {
                if let documents = querySnapshot?.documents {
                    print("documents: \(documents)")
                    for (index, document) in documents.enumerated() {
                        let value = document.data()["value"] as? CGFloat ?? 0.0
                        let title = document.data()["title"] as? String ?? ""
                        let colorString = document.data()["color"] as? String ?? ""
                        let expenseType = document.data()["expenseType"] as? String ?? ""
                        let icon = document.data()["icon"] as? String ?? ""
                        
                        let color: UIColor = self.getColor(color: colorString)
                        livingExpenses.append(LivingExpense(id: index, value: value, title: title, color: color, expenseType: expenseType, icon: icon))
                    }
                }
            }
            response(livingExpenses)
        }
    }
    
    func getColor(color: String) -> UIColor {
        switch color {
        case "blue":
            return UIColor.blue
        case "green":
            return UIColor.green
        case "orange":
            return UIColor.orange
        case "purple":
            return UIColor.purple
        default:
            return UIColor.white
        }
    }
}
