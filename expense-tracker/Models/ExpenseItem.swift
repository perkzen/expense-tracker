//
//  ExpenseItemModel.swift
//  expense-tracker
//
//  Created by Domen Perko on 04/03/2022.
//

import Foundation


struct ExpenseItem:Identifiable,Hashable, Codable {
    var id:String
    var title:String
    var amount:Int
    
    init(title: String, amount:Int) {
        self.id =  UUID().uuidString
        self.title = title
        self.amount = amount
    }
    
}
