//
//  UserModel.swift
//  expense-tracker
//
//  Created by Domen Perko on 20/03/2022.
//

import Foundation

struct User: Codable {
    var username:String
    var id: Int
    
    init(id:Int, username:String) {
        self.username = username
        self.id = id
    }
}




