//
//  weather_test_AITests.swift
//  weather-test-AITests
//
//  Created by Roman Mykitchak on 3/21/26.
//

import XCTest
import Foundation
import SwiftyJSON
@testable import weather_test_AI

@MainActor
final class WeatherTestAIBasicTests: XCTestCase {
    func testExamplePasses() throws {
        XCTAssertTrue(true)
    }
    
    func testWeatherInput() throws {
        
        let dateString = "2026-06-06T14:49:26.933103979Z"
        
        XCTAssertNoThrow(
                try Date(dateString, strategy: .iso8601), 
                "Error: can not parse the date"
            )
        let date = try Date(dateString, strategy: .iso8601)
        
        XCTAssertEqual(
                date.timeIntervalSince1970,
                1780757366.933104,
                accuracy: 0.000001
            )
        
        let weatherCondition = WeatherCondition(iconBaseUri: "https://maps.gstatic.com/weather/v1/partly_cloudy",
                                                description: WeatherDescription(text: "Partly sunny",
                                                                                languageCode: "en"),
                                                type: ConditionType(rawValue: "MOSTLY_CLOUDY")!)
        let temperature = MeasurementValue(degrees: 24.9, unit: TemperatureUnit.celsius)
        let wind = Wind(direction: Direction(degrees: 317,
                                             cardinal: WindDirection(rawValue: "NORTHWEST")!),
                        speed: Speed(value: 3, unit: SpeedUnit(rawValue: "KILOMETERS_PER_HOUR")!),
                        gust: Speed(value: 9, unit: SpeedUnit(rawValue: "KILOMETERS_PER_HOUR")!))
           
        let wetherResponceMock = WeatherResponseNet(currentTime: date,
                                                    timeZone: TimeZoneInfo(id: "Europe/Warsaw"),
                                                    isDaytime: true,
                                                    weatherCondition: weatherCondition,
                                                    temperature: temperature,
                                                    wind: wind)
        
        
        
        //comparableJSONs
        if let resourcePath = Bundle.main.resourcePath {
            do {
                let files = try FileManager.default.contentsOfDirectory(atPath: resourcePath)
                print(files)
            } catch {
                print(error)
            }
        }
        
        let testBundle = Bundle(for: WeatherTestAIBasicTests.self)
        guard let url = testBundle.url(forResource: "weather", withExtension: "json") else {
            fatalError("0 weather.json not found in test bundle")
        }
        print(Bundle.main.bundlePath)
            
        do {
            let data = try Data(contentsOf: url)
            let jsonFromFile = try JSON(data: data)
            print("From file: -------------------------------------------------")
            print(jsonFromFile)
            
            let wetherResponceData = try JSONEncoder().encode(wetherResponceMock)
            let jsonFromObject = try JSON(data: wetherResponceData)
            
            print("From object: -------------------------------------------------")
            print(jsonFromObject)

            XCTAssertEqual(jsonFromFile["timeZone"].string, jsonFromObject["timeZone"].string) //"Europe/Warsaw"
            XCTAssertEqual(jsonFromFile["weatherCondition"]["type"], jsonFromObject["weatherCondition"]["type"])
            XCTAssertEqual(jsonFromFile["temperature"]["unit"], jsonFromObject["temperature"]["unit"])
            XCTAssertEqual(jsonFromFile["temperature"]["degrees"].double, jsonFromObject["temperature"]["degrees"].double)
            print("file degrees: \(jsonFromFile["temperature"]["degrees"].double)")
            print("object degrees: \(jsonFromObject["temperature"]["degrees"].double)")
            
        } catch {
            print(error)
        }
    }
    
    func testMockToJSON() throws {
        // Build a sample WeatherResponseNet to encode
        let dateString = "2026-06-06T14:49:26.933103979Z"
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        let date = try XCTUnwrap(formatter.date(from: dateString))

        let weatherCondition = WeatherCondition(
            iconBaseUri: "https://maps.gstatic.com/weather/v1/partly_cloudy",
            description: WeatherDescription(text: "Partly sunny", languageCode: "en"),
            type: ConditionType(rawValue: "PARTLY_CLOUDY")!
        )
        let temperature = MeasurementValue(degrees: 22.9, unit: TemperatureUnit.celsius)
        let wind = Wind(
            direction: Direction(degrees: 317, cardinal: WindDirection(rawValue: "NORTHWEST")!),
            speed: Speed(value: 3, unit: SpeedUnit(rawValue: "KILOMETERS_PER_HOUR")!),
            gust: Speed(value: 9, unit: SpeedUnit(rawValue: "KILOMETERS_PER_HOUR")!)
        )
        let weather = WeatherResponseNet(
            currentTime: date,
            timeZone: TimeZoneInfo(id: "Europe/Warsaw"),
            isDaytime: true,
            weatherCondition: weatherCondition,
            temperature: temperature,
            wind: wind
        )
        
        let data = try JSONEncoder().encode(weather)
        XCTAssertFalse(data.isEmpty)
    }
}

