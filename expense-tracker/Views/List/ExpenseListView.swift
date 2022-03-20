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
                Text("Balance: \(expenseService.balance)$").font(.headline)
                HStack {
                    Text("Income: \(expenseService.income)$").font(.headline)
                    Text("Expenses: \(expenseService.expenses)$").font(.headline)
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
}

                                             
                                             
                                
struct ExpenseListView_Previews: PreviewProvider {
    static var previews: some View {
        TabView{
            ExpenseListView()
        }.environmentObject(ExpenseService())
            .environmentObject(AuthService())
   
    }
}
