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
    
    init(pieces: [InformationPieceModelNet]) {
        self.pieces = pieces.map() { netPiece in
            let piece = InformationPieceModel(title: netPiece.title,
                                              description: netPiece.description)
            piece.image =  Image(netPiece.image)
            piece.link = URL(string: netPiece.link) ?? URL(string: "Error URL is nil")!
            
            return piece
        }
        self.objectWillChange = .init()
    }
}
