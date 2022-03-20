//
//  ExpenseItemModel.swift
//  expense-tracker
//
//  Created by Domen Perko on 04/03/2022.
//

import Foundation


struct ExpenseItem:Identifiable,Hashable, Codable {
    var id:Int
    var text:String
    var amount:Int
    
    init(id:Int,text: String, amount:Int) {
        self.id = id
        self.text = text
        self.amount = amount
    }
    
}
