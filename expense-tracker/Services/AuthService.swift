//
//  AuthService.swift
//  expense-tracker
//
//  Created by Domen Perko on 20/03/2022.
//

import Foundation

class AuthService: ObservableObject {
    
    @Published var user:User?
    @Published var authError:String = ""
    let userKey:String = "user"
    
    init() {
        guard
            let data = UserDefaults.standard.data(forKey: "user"),
            let user:User = try? JSONDecoder().decode(User.self, from: data)
        else { return }
        self.user = user
    }
    
    
    func register(username:String, password:String) {
        guard let url = URL(string: "http://localhost:3000/auth/register") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        let body: [String: AnyHashable] = [
            "username": username,
            "password": password
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

        URLSession.shared.dataTask(with: request) { data,
            _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let response = try JSONDecoder().decode(User.self, from: data)
            } catch {
               print(error.localizedDescription)
            }
        }.resume()

    }
    
    func login(username:String, password:String) {
        guard let url = URL(string: "http://localhost:3000/auth/login") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        let body: [String: AnyHashable] = [
            "username": username,
            "password": password
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        URLSession.shared.dataTask(with: request) { data,
            _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let response = try JSONDecoder().decode(User.self, from: data)
                DispatchQueue.main.async {
                    self.user = response
                }
                
                if let userEncode = try? JSONEncoder().encode(response) {
                    UserDefaults.standard.set(userEncode,forKey: self.userKey)
                }
                
            } catch {
               print(error)
            }
        }.resume()

    }
    
    func logout() {
        self.user = nil
        UserDefaults.standard.removeObject(forKey: userKey)
    }
}
