//
//  ContentViewTests.swift
//  PrampBTests
//
//  Created by Della Anjeh on 3/3/25.
//

import XCTest
@testable import PrampB

final class ContentViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Tests for the ContentView using dependency injection
        
    func testContentViewWithEmptyResults() {
        // Arrange
        let mockService = BreedMockDataService(results: [])
        
        // Act - Create ContentView with the mock service
        let contentView = ContentView(dataService: mockService)
        
        // We can test the view properties or behavior in SwiftUI previews
        // But in XCTest, we mainly verify it can be created with our mock
        XCTAssertNotNil(contentView)
    }
    
    func testContentViewWithMockResults() {
        // Arrange
        let mockBreed = Breed.mock
        let mockService = BreedMockDataService(results: [mockBreed])
        
        // Act - Create ContentView with the mock service
        let contentView = ContentView(dataService: mockService)
        
        // Assert it can be created
        XCTAssertNotNil(contentView)
    }
}
