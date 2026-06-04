//
//  InformationPiece.swift
//  weather-test-AI
//
//  Created by Roman Mykitchak on 5/8/26.
//

import Foundation
import SwiftUI
import Combine

@Observable class InformationPieceModel: ObservableObject, Identifiable {
    let objectWillChange: ObservableObjectPublisher
    
    let id: UUID
    let title: String
    let description: String
    var image: Image
    var link: URL
    
    let sunshineDayInYourHead: Bool
//    let todayRealWeatherDay: WeatherViewModel

    init(id: UUID = UUID(),
         title: String,
         description: String,
         image: Image = Image(systemName: "sun.max"),
         link: URL = URL(string: "") ?? URL(string: "Error URL is nil")!,
         sunshineDayInYourHead: Bool = false) {
        
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.link = link
        self.sunshineDayInYourHead = sunshineDayInYourHead
        self.objectWillChange = .init()
    }
}
