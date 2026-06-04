//
//  InformationPieceModelNet.swift
//  weather-test-AI
//
//  Created by Roman Mykitchak on 5/8/26.
//

import Foundation
struct InformationPieceModelNet : Codable, Equatable {
    let title: String
    let description: String
    let image: String
    let link: String
    
    let sunshineDayInYourHead: Bool
}
