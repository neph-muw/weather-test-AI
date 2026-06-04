//
//  Account.swift
//  weather-test-AI
//
//  Created by Roman Mykitchak on 5/16/26.
//

import Foundation
import Observation

@Observable class Account {
    var userName: String?
    
    init(userName: String? = nil) {
        self.userName = userName
    }
    
    func showLogin() {
        
    }
    
    func logOut() {
        userName = nil
    }
}
