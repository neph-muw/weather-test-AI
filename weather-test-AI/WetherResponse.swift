//
//  WetherResponse.swift
//  weather-test-AI
//
//  Created by Roman Mykitchak on 3/25/26.
//


import Foundation

// MARK: - Root
struct WeatherResponse: Codable {
    let currentTime: Date
    let timeZone: TimeZoneInfo
    let isDaytime: Bool
    let weatherCondition: WeatherCondition
    let temperature: MeasurementValue
//    let feelsLikeTemperature: MeasurementValue
//    let dewPoint: MeasurementValue
//    let heatIndex: MeasurementValue
//    let windChill: MeasurementValue
//    let relativeHumidity: Int
//    let uvIndex: Int
//    let precipitation: Precipitation
//    let thunderstormProbability: Int
//    let airPressure: AirPressure
    let wind: Wind
//    let visibility: Distance
//    let cloudCover: Int
//    let currentConditionsHistory: CurrentConditionsHistory
}

// MARK: - TimeZone
struct TimeZoneInfo: Codable {
    let id: String
}

// MARK: - WeatherCondition
struct WeatherCondition: Codable {
    let iconBaseUri: String
    let description: WeatherDescription
    let type: ConditionType
}

struct WeatherDescription: Codable {
    let text: String
    let languageCode: String
}

enum ConditionType: String, Codable {
    case cloudy = "CLOUDY"
    // extend with others if needed
}

// MARK: - Measurement
struct MeasurementValue: Codable {
    let degrees: Double
    let unit: TemperatureUnit
}

enum TemperatureUnit: String, Codable {
    case celsius = "CELSIUS"
}

// MARK: - Precipitation
struct Precipitation: Codable {
    let probability: Probability
    let snowQpf: Quantity
    let qpf: Quantity
}

struct Probability: Codable {
    let percent: Int
    let type: PrecipitationType
}

enum PrecipitationType: String, Codable {
    case rain = "RAIN"
}

// MARK: - Quantity
struct Quantity: Codable {
    let quantity: Double
    let unit: QuantityUnit
}

enum QuantityUnit: String, Codable {
    case millimeters = "MILLIMETERS"
}

// MARK: - AirPressure
struct AirPressure: Codable {
    let meanSeaLevelMillibars: Double
}

// MARK: - Wind

/*
"wind": {
        "direction": {
            "degrees": 8,
            "cardinal": "NORTH"
        },
        "speed": {
            "value": 14,
            "unit": "KILOMETERS_PER_HOUR"
        },
        "gust": {
            "value": 25,
            "unit": "KILOMETERS_PER_HOUR"
        }
    },
*/
struct Wind: Codable {
    let direction: Direction
    let speed: Speed
    let gust: Speed
}

struct Direction: Codable {
    let degrees: Int
    let cardinal: WindDirection
}

enum WindDirection: String, Codable {
    case eastSoutheast = "EAST_SOUTHEAST"
    case north = "NORTH"
    case northNortheast = "NORTH_NORTHEAST"
    case northWest = "NORTH_WEST"
    case northNorthwest = "NORTH_NORTHWEST"
    case westSouthwest = "WEST_SOUTHWEST"
}

// MARK: - Speed
struct Speed: Codable {
    let value: Double
    let unit: SpeedUnit
}

enum SpeedUnit: String, Codable {
    case kilometersPerHour = "KILOMETERS_PER_HOUR"
}

// MARK: - Distance
struct Distance: Codable {
    let distance: Double
    let unit: DistanceUnit
}

enum DistanceUnit: String, Codable {
    case kilometers = "KILOMETERS"
}

// MARK: - History
struct CurrentConditionsHistory: Codable {
    let temperatureChange: MeasurementValue
    let maxTemperature: MeasurementValue
    let minTemperature: MeasurementValue
    let snowQpf: Quantity
    let qpf: Quantity
}
