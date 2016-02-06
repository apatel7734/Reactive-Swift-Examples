//
//  User.swift
//  ReactiveDemo
//
//  Created by Patel, Ashish on 2/5/16.
//  Copyright © 2016 Patel, Ashish. All rights reserved.
//

import Foundation

class User{
    var userId: String!
    var hashedPassword: String!
    var phoneNumber: String!
    
    init(userId: String,password: String,phoneNumber: String){
        self.userId = userId
        self.hashedPassword = String(password.hash)
        self.phoneNumber = phoneNumber;
    }
    
}
