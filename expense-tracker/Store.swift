//
//  Store.swift
//  expense-tracker
//
//  Created by Domen Perko on 04/03/2022.
//

import Foundation

class Store: ObservableObject {
  @Published var items:[ExpenseItem] = []
    
    init() {
    
    }
    
    func addItem (item:ExpenseItem) {
        items.append(item)
    }
}
