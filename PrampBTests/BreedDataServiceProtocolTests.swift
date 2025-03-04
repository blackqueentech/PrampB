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

    func test_BreedMockDataService_loadData_shouldBeEmpty() async {
        // Given
        let emptyMockService = BreedMockDataService(results: [])
        
        // When
        await emptyMockService.loadData()
        
        // Then
        XCTAssertTrue(emptyMockService.results.isEmpty, "Results should be empty")
    }
    
    func test_BreedMockDataService_loadData_shouldHaveMockData() async {
        // Given
        let mockBreed = Breed.mock
        let mockService = BreedMockDataService(results: [mockBreed])
        
        // Then
        await mockService.loadData()
        
        // When
        XCTAssertFalse(mockService.results.isEmpty, "Results should not be empty")
        XCTAssertEqual(mockService.results.count, 1, "Should have exactly one breed")
        XCTAssertEqual(mockService.results.first?.name, "Abyssinian", "Mock breed should be Abyssinian")
    }
    
    func test_JSONDecoder_decode_shouldDecodeBreedsData() throws {
        // Given
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
        
        // Then
        let jsonData = jsonString.data(using: .utf8)!
        let breeds = try JSONDecoder().decode([Breed].self, from: jsonData)
        
        // When
        XCTAssertEqual(breeds.count, 2, "Should decode 2 breeds")
        XCTAssertEqual(breeds[0].name, "Abyssinian", "First breed should be Abyssinian")
        XCTAssertEqual(breeds[1].name, "Bengal", "Second breed should be Bengal")
    }
}
