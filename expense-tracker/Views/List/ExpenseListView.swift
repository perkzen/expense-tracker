//
//  ExpenseListView.swift
//  expense-tracker
//
//  Created by Domen Perko on 28/02/2022.
//

import SwiftUI

struct ExpenseListView: View {
    @EnvironmentObject var expenseService:ExpenseService
    @EnvironmentObject var authService:AuthService
    
    var body: some View {
        VStack{
            Text("History").font(.largeTitle)
            VStack {
                Text("Balance: \(getBalance())$").font(.headline)
                HStack {
                    Text("Income: \(getIncome())$").font(.headline)
                    Text("Expenses: \(getExpenses())$").font(.headline)
                }
            }
            
            if authService.user != nil {
                List{
                    ForEach(expenseService.items) { item in
                       ListRowView(item: item)
                   
                    }.onDelete(perform: expenseService.deleteItem)
                }
            } else {
                Spacer()
                Text("Please login to view items")
                    .font(.title)
                    .bold()
                Spacer()
                
            }
           
            
        }.onAppear {
            expenseService.fetchItems()
        }
       
    }
    func getBalance() ->Int {
        var balance = 0
        for item in expenseService.items {
            balance += item.amount
        }
        return balance
    }
    
    func getIncome()->Int {
        var income = 0
        for item in expenseService.items {
            if item.amount > 0 {
                income += item.amount
            }
        }
        return income
    }
    
    func getExpenses()->Int {
        var expense = 0
        for item in expenseService.items {
            if item.amount < 0 {
                expense += item.amount
            }
        }
        return expense
    }

}

                                             
                                             
                                
struct ExpenseListView_Previews: PreviewProvider {
    static var previews: some View {
        TabView{
            ExpenseListView()
        }.environmentObject(ExpenseService())
            .environmentObject(AuthService())
   
    }
}
