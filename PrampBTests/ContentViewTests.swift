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
        
    func test_ContentView_init_shouldInitViewWithEmptyData() {
        // Given
        let mockService = BreedMockDataService(results: [])
        
        // Then
        let contentView = ContentView(dataService: mockService)
        
        // When
        XCTAssertNotNil(contentView)
    }
    
    func test_ContentView_init_shouldInitViewWithMockData() {
        // Given
        let mockBreed = Breed.mock
        let mockService = BreedMockDataService(results: [mockBreed])
        
        // Then
        let contentView = ContentView(dataService: mockService)
        
        // When
        XCTAssertNotNil(contentView)
    }
}
