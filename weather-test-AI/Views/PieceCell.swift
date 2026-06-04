//
//  PieceCell.swift
//  weather-test-AI
//
//  Created by Roman Mykitchak on 5/8/26.
//

import Foundation
import SwiftUI

struct PieceCell: View {
    let piece: InformationPieceModel
    
    var body: some View {
        HStack {
            Spacer()
            ZStack
            {
                Color.black
                piece.image
                    .foregroundColor(.white)
            }
                
            Spacer()
            Text(piece.title + "\n" +
                piece.description)
                .font(.system(size: 20))
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .foregroundColor(.black)
                .frame(width: 130, alignment: .leading)
                .cornerRadius(5)
            Spacer()
        }
       
    }
}
