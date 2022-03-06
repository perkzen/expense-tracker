//
//  ListRowView.swift
//  expense-tracker
//
//  Created by Domen Perko on 06/03/2022.
//

import SwiftUI

struct ListRowView: View {
    var item:ExpenseItem
    
    var body: some View {
        HStack {
            Rectangle().frame(width: 10, height: 50).foregroundColor(item.amount > 0 ? .green : .red)
            Text(item.title).padding(.horizontal)
            Spacer()
            Text("\(item.amount)").padding(.horizontal)
        }
    
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item:ExpenseItem(title: "School", amount: 100)).previewLayout(.sizeThatFits).padding()
        ListRowView(item:ExpenseItem(title: "Kebab", amount: -100)).previewLayout(.sizeThatFits).padding()
    }
}
