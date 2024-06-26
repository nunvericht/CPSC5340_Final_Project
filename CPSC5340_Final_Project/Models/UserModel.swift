//
//  UserModel.swift
//  CPSC5340_Final_Project
//
//  Created by Nicholl Unvericht on 4/18/24.
//

import Foundation


struct UserModel : Codable {
    
    let uid: String?
    let email: String?
    let name: String?
    
    init(uid: String?, email: String?, name: String?) {
        self.uid = uid
        self.email = email
        self.name = name
    }
}
