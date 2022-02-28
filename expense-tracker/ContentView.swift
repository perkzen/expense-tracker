//
//  ContentView.swift
//  expense-tracker
//
//  Created by Domen Perko on 28/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            ExpenseListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Home")
                }
            AddExpenseView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Add expense")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
