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
    
    init() {
    
    }
    
    func addItem (item:ExpenseItem) {
        items.append(item)
        balance += item.amount
    }
    
    func deleteItem (indexSet: IndexSet) {
        balance = balance - items[indexSet.count - 1].amount
        items.remove(atOffsets: indexSet)
    }
}
