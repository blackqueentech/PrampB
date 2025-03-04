//
//  BreedDataServiceProtocolTests.swift
//  PrampBTests
//
//  Created by Della Anjeh on 3/3/25.
//

import XCTest
@testable import PrampB

final class BreedDataServiceProtocolTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Test with empty dataset
    func testEmptyDataset() async {
        // Arrange
        let emptyMockService = BreedMockDataService(results: [])
        
        // Act
        await emptyMockService.loadData()
        
        // Assert
        XCTAssertTrue(emptyMockService.results.isEmpty, "Results should be empty")
    }
    
    // Test with mock data
    func testMockDataLoading() async {
        // Arrange
        let mockBreed = Breed.mock
        let mockService = BreedMockDataService(results: [mockBreed])
        
        // Act
        await mockService.loadData()
        
        // Assert
        XCTAssertFalse(mockService.results.isEmpty, "Results should not be empty")
        XCTAssertEqual(mockService.results.count, 1, "Should have exactly one breed")
        XCTAssertEqual(mockService.results.first?.name, "Abyssinian", "Mock breed should be Abyssinian")
    }
    
    // Test actual JSON decoding with a mock JSON file
    func testJSONDecoding() throws {
        // This simulates the JSON response from the API
        let jsonString = """
        [
            {
                "name": "Abyssinian",
                "origin": "Egypt",
                "description": "The Abyssinian is easy to care for, and a joy to have in your home.",
                "wikipedia_url": "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
                "reference_image_id": "0XYvRd7oD"
            },
            {
                "name": "Bengal",
                "origin": "United States",
                "description": "Bengals are a lot of fun to live with.",
                "wikipedia_url": "https://en.wikipedia.org/wiki/Bengal_cat",
                "reference_image_id": "O3btzLlsO"
            }
        ]
        """
        
        // Convert the string to Data
        let jsonData = jsonString.data(using: .utf8)!
        
        // Decode the data
        let breeds = try JSONDecoder().decode([Breed].self, from: jsonData)
        
        // Assert
        XCTAssertEqual(breeds.count, 2, "Should decode 2 breeds")
        XCTAssertEqual(breeds[0].name, "Abyssinian", "First breed should be Abyssinian")
        XCTAssertEqual(breeds[1].name, "Bengal", "Second breed should be Bengal")
    }
}
