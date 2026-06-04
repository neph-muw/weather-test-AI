//
//  PiecesNetworkService.swift
//  weather-test-AI
//
//  Created by Roman Mykitchak on 5/8/26.
//

import Foundation

protocol PiecesNetworkServiceProtocol {
    func fetchData() -> [InformationPieceModelNet]
}

class PiecesNetworkService: PiecesNetworkServiceProtocol {
    
    var pieces: [InformationPieceModelNet] = [
        InformationPieceModelNet(title: "In my head",
                                description: "Loading...",
                                image: "",
                                link: "",
                                sunshineDayInYourHead: true),
        InformationPieceModelNet(title: "Toronto TV",
                                 description: "Loading...",
                                 image: "",
                                 link: "",
                                 sunshineDayInYourHead: true)]

    
    func fetchData() -> [InformationPieceModelNet] {
        //Return await for pieces
        return pieces
    }
    
}
