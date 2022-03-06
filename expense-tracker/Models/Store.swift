//
//  Store.swift
//  expense-tracker
//
//  Created by Domen Perko on 04/03/2022.
//

import Foundation

class Store: ObservableObject {
    @Published var items:[ExpenseItem] = []
    @Published var balance:Int = 0
    @Published var income:Int = 0
    @Published var expenses:Int = 0
    
    init() {
    
    }
    
    func addItem (item:ExpenseItem) {
        items.append(item)
        balance += item.amount
        
        if item.amount > 0 {
            income += item.amount
        } else {
            expenses += item.amount
        }
        
    }
    
    func deleteItem (indexSet: IndexSet) {
        let index = indexSet[indexSet.startIndex]
        let amount = items[index].amount
        balance = balance - amount
        
        if amount > 0 {
            income = income - amount
        }else{
           expenses = expenses - amount
        }
        
        items.remove(atOffsets: indexSet)
    }
    

}
