//
//  AddExpenseView.swift
//  expense-tracker
//
//  Created by Domen Perko on 28/02/2022.
//

import SwiftUI

struct AddExpenseView: View {
    @State private var title:String = ""
    @State private var amount:Int = 0;
    @State private var alertTitle:String = ""
    @State private var showAlert:Bool = false
    @EnvironmentObject var store:ExpenseService
    @EnvironmentObject var authService:AuthService
    
    

    
    var body: some View {
        VStack {
            VStack (alignment: .leading) {
                Text("Title")
                TextField("Title", text: $title)
                    .padding(.horizontal)
                    .frame(height:55)
                    .background(Color(red: 236/255, green: 234/255, blue: 236/255))
                    .cornerRadius(10)
                Text("Amount ($)")
                TextField("Amount" ,value: $amount, formatter: NumberFormatter())
                    .padding(.horizontal)
                    .frame(height:55)
                    .background(Color(red: 236/255, green: 234/255, blue: 236/255))
                    .cornerRadius(10)
            }.padding(.vertical)
            Button(action: saveButtonPressed, label: {
                Text("Add".uppercased())
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.headline)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            })
        }.padding().alert(isPresented: $showAlert, content: getAlert)
      
    }
    
    func saveButtonPressed () {
        if checkInput() {
            store.addItem(amount: amount, text: title)
            title = ""
            amount = 0
        }
     
    }
    
    func checkInput () -> Bool {
        
        if authService.user == nil {
            alertTitle = "Please login to save expense item."
            showAlert.toggle()
            return false
        }
        
        if title.count < 1  && amount == 0 {
            alertTitle = "Please enter title and amount."
            showAlert.toggle()
            return false
        }
        
        return true
    }
    
    func getAlert () -> Alert {
        return Alert(title: Text(alertTitle))
    }
}



struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView().environmentObject(AuthService())
            .environmentObject(ExpenseService())
    }
}
