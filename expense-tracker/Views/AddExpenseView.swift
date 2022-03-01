//
//  AddExpenseView.swift
//  expense-tracker
//
//  Created by Domen Perko on 28/02/2022.
//

import SwiftUI

struct AddExpenseView: View {
    @State var title:String = "";
    @State var amount:String = "";
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .padding(.horizontal)
                .frame(height:55)
                .background(Color(red: 236/255, green: 234/255, blue: 236/255))
                .cornerRadius(10)
            TextField("Amount", text: $title)
                .padding(.horizontal)
                .frame(height:55)
                .background(Color(red: 236/255, green: 234/255, blue: 236/255))
                .cornerRadius(10)
        }.padding()
      
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
