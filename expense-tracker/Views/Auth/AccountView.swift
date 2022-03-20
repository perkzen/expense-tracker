//
//  AccountView.swift
//  expense-tracker
//
//  Created by Domen Perko on 20/03/2022.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var authService:AuthService
    
    var body: some View {
        if authService.user == nil {
             LoginView()
        } else {
            ProfileView()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(AuthService())
    }
}
