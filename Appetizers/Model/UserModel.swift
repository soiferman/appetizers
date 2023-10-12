//
//  UserModel.swift
//  Appetizers
//
//  Created by Max Soiferman on 11/10/23.
//

import Foundation

struct UserModel: Codable {
    
   var firstName = ""
   var lastName = ""
   var email = ""
   var birthdate = Date()
   var extraNapkins = false
   var frequentRefill = false
    
}
