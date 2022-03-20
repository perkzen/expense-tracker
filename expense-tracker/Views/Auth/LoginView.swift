//
//  LoginView.swift
//  expense-tracker
//
//  Created by Domen Perko on 20/03/2022.
//

import SwiftUI

struct LoginView: View {
    @State var username:String = ""
    @State var password:String = ""
    @EnvironmentObject var authService:AuthService

    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $username)
                    .autocapitalization(.none)
                    .padding(.horizontal)
                    .frame(height:55)
                    .background(Color(red: 236/255, green: 234/255, blue: 236/255))
                    .cornerRadius(10)
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .padding(.horizontal)
                    .frame(height:55)
                    .background(Color(red: 236/255, green: 234/255, blue: 236/255))
                    .cornerRadius(10)
                HStack {
                    Text("Don't have a account?")
                    NavigationLink("Register here", destination: RegisterView())
                        .foregroundColor(.accentColor)
                }
                Button(action: login, label: {
                    Text("Login".uppercased())
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.headline)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                })
        
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
     
    
    func login() {
        authService.login(username: username, password: password)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
