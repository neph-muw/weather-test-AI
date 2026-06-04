//
//  LogInOutView.swift
//  weather-test-AI
//
//  Created by Roman Mykitchak on 5/16/26.
//

import Foundation
import SwiftUI

struct LogInOutView : View {
    @Environment(Account.self) private var account
    
    var body: some View {
        if let name = account.userName {
            HStack {
                Text (name);
                Button("Log out") {
                    account.logOut()
                }
            }
        } else {
            Button("Login") { account.showLogin() }
        }
    }
}
