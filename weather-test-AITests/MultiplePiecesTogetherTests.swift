import XCTest
@testable import weather_test_AI
import Foundation
import SwiftUI
import Combine

// Mock model that mirrors the properties used by MultiplePiecesTogether in the app.
struct MockInformationPieceModelNet: Equatable, Identifiable {
    let id: UUID
    var title: String
    var description: String
    var image: String
    var link: String
    var sunshineDayInYourHead: Bool

    init(id: UUID = UUID(), title: String, description: String = "", image: String = "", link: String = "", sunshineDayInYourHead: Bool = false) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.link = link
        self.sunshineDayInYourHead = sunshineDayInYourHead
    }
}


@Observable class MockMultiplePiecesTogether: ObservableObject {
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



final class MultiplePiecesTogetherTests: XCTestCase {

    // Helper to bridge the mock to the app's expected type if available.
    // If the app's InformationPieceModelNet is internal to the module, adjust access control or replicate initializer here.
    private func makeRealPiece(from mock: MockInformationPieceModelNet) -> InformationPieceModelNet {
        // Assuming your app model has a matching initializer.
        return InformationPieceModelNet(title: mock.title,
                                        description: mock.description,
                                        image: mock.image,
                                        link: mock.link,
                                        sunshineDayInYourHead: mock.sunshineDayInYourHead)
    }

    func testInitWithPieces() {
        let mocks = [
            InformationPieceModelNet(title: "In my head", description: "", image: "", link: "", sunshineDayInYourHead: true),
            InformationPieceModelNet(title: "Toronto TV", description: "", image: "", link: "", sunshineDayInYourHead: true),
        ]
        let sut = MockMultiplePiecesTogether(pieces: mocks)
        XCTAssertEqual(sut.pieces.count, 2)
        XCTAssertEqual(sut.pieces.first?.title, "In my head")
        XCTAssertEqual(sut.pieces[1].title, "Toronto TV")
    }

//    func testAddPieceIncreasesCount() {
//        let sut = MultiplePiecesTogether(pieces: [])
//        let newMock = MockInformationPieceModelNet(title: "New Piece", sunshineDayInYourHead: false)
//        let newReal = makeRealPiece(from: newMock)
//        // Assuming MultiplePiecesTogether exposes a way to add a piece; if not, we append directly to its public var.
//        var mutableSut = sut
//        mutableSut.pieces.append(newReal)
//        XCTAssertEqual(mutableSut.pieces.count, 1)
//        XCTAssertEqual(mutableSut.pieces[0].title, "New Piece")
//    }
//
//    func testRemovePieceDecreasesCount() {
//        let initial = [
//            MockInformationPieceModelNet(title: "A"),
//            MockInformationPieceModelNet(title: "B")
//        ].map(makeRealPiece)
//        var sut = MultiplePiecesTogether(pieces: initial)
//        sut.pieces.remove(at: 0)
//        XCTAssertEqual(sut.pieces.count, 1)
//        XCTAssertEqual(sut.pieces[0].title, "B")
//    }
//
//    func testFindByTitle() {
//        let initial = [
//            MockInformationPieceModelNet(title: "Alpha"),
//            MockInformationPieceModelNet(title: "Beta")
//        ].map(makeRealPiece)
//        let sut = MultiplePiecesTogether(pieces: initial)
//        let found = sut.pieces.first { $0.title == "Beta" }
//        XCTAssertNotNil(found)
//        XCTAssertEqual(found?.title, "Beta")
//    }
}
