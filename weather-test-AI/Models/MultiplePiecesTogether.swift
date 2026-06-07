//
//  MultiplePiecesTogether.swift
//  weather-test-AI
//
//  Created by Roman Mykitchak on 5/8/26.
//

import Foundation
import SwiftUI
import Combine

@Observable class MultiplePiecesTogether: ObservableObject {
    let objectWillChange: ObservableObjectPublisher
    
    var pieces: [InformationPieceModel]
    
    var count: Int { pieces.count }
    
    init(netPieces: [InformationPieceModelNet]) {
        self.pieces = netPieces.map() { netPiece in
            
            let piece = InformationPieceModel(id: UUID(),
                                           title: netPiece.title,
                                           description: netPiece.description,
                                           image: Image(systemName: netPiece.image),
                                           link: URL(string: netPiece.link) ?? URL(string: "Error URL is nil")!,
                                           sunshineDayInYourHead: false)
            
            return piece
        }
        self.objectWillChange = .init()
    }
}
