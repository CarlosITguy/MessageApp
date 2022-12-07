//
//  MesageModel.swift
//  Messenger
//
//  Created by Consultant on 12/4/22.
//

import Foundation


struct message : Decodable{
    var UID : String
    var body : String
    var timestamp : String
    var username : String
    
}

struct user {
    var UID : String
    var email : String
    var password : String
    var username : String
    
}
