//
//  RegisterView.swift
//  expense-tracker
//
//  Created by Domen Perko on 20/03/2022.
//

import SwiftUI

struct RegisterView: View {
    @State var username:String = ""
    @State var password1:String = ""
    @State var password2:String = ""
    @EnvironmentObject var authService:AuthService
    
    
    var body: some View {
        VStack {
            Text("Register").font(.largeTitle)
            TextField("Username", text: $username)
                .autocapitalization(.none)
                .padding(.horizontal)
                .frame(height:55)
                .background(Color(red: 236/255, green: 234/255, blue: 236/255))
                .cornerRadius(10)
            SecureField("Password", text: $password1)
                .autocapitalization(.none)
                .padding(.horizontal)
                .frame(height:55)
                .background(Color(red: 236/255, green: 234/255, blue: 236/255))
                .cornerRadius(10)
            SecureField("Confirm password", text: $password2)
                .autocapitalization(.none)
                .padding(.horizontal)
                .frame(height:55)
                .background(Color(red: 236/255, green: 234/255, blue: 236/255))
                .cornerRadius(10)
            Button(action: register, label: {
                Text("Submit".uppercased())
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.headline)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }).padding(.vertical)
    
        }.padding()
    }
    
    func register () {
        if password1 == password2 {
            authService.register(username: username, password: password1)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
