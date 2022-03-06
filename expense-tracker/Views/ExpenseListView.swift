//
//  ExpenseListView.swift
//  expense-tracker
//
//  Created by Domen Perko on 28/02/2022.
//

import SwiftUI

struct ExpenseListView: View {
    @EnvironmentObject var store:Store
    
    var body: some View {
        VStack{
            Text("Expenses").font(.largeTitle)
            Text("Balance: \(store.balance)$").font(.headline)
            List{
                ForEach(store.items) { item in
                   ListRowView(item: item)
               
                }.onDelete(perform: store.deleteItem)
            }
        }
       
    }
}

struct ExpenseListView_Previews: PreviewProvider {
    static var previews: some View {
        TabView{
            ExpenseListView()
        }.environmentObject(Store())
   
    }
}
