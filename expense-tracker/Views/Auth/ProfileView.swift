//
//  ProfileView.swift
//  expense-tracker
//
//  Created by Domen Perko on 20/03/2022.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authService:AuthService
    
    var body: some View {
        VStack {
            HStack {
                Text("Hello")
                Text(authService.user?.username ?? "not logged in").font(.headline)
            }
            Button(action: logoutUser, label: {
                Text("Logout".uppercased())
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.headline)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            })
        }.padding()
       
    }
    
    func logoutUser() {
        authService.logout()
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AuthService())
    }
}
