//
//  WetherResponse.swift
//  weather-test-AI
//
//  Created by Roman Mykitchak on 3/25/26.
//


import Foundation

// MARK: - Root
struct WeatherResponseNet: Codable {
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
    case typeUnspecified = "TYPE_UNSPECIFIED"

    case clear = "CLEAR"
    case mostlyClear = "MOSTLY_CLEAR"
    case partlyCloudy = "PARTLY_CLOUDY"
    case mostlyCloudy = "MOSTLY_CLOUDY"
    case cloudy = "CLOUDY"

    case windy = "WINDY"
    case windAndRain = "WIND_AND_RAIN"

    case lightRainShowers = "LIGHT_RAIN_SHOWERS"
    case chanceOfShowers = "CHANCE_OF_SHOWERS"
    case scatteredShowers = "SCATTERED_SHOWERS"
    case rainShowers = "RAIN_SHOWERS"
    case heavyRainShowers = "HEAVY_RAIN_SHOWERS"

    case lightToModerateRain = "LIGHT_TO_MODERATE_RAIN"
    case moderateToHeavyRain = "MODERATE_TO_HEAVY_RAIN"
    case rain = "RAIN"
    case lightRain = "LIGHT_RAIN"
    case heavyRain = "HEAVY_RAIN"
    case rainPeriodicallyHeavy = "RAIN_PERIODICALLY_HEAVY"

    case lightSnowShowers = "LIGHT_SNOW_SHOWERS"
    case chanceOfSnowShowers = "CHANCE_OF_SNOW_SHOWERS"
    case scatteredSnowShowers = "SCATTERED_SNOW_SHOWERS"
    case snowShowers = "SNOW_SHOWERS"
    case heavySnowShowers = "HEAVY_SNOW_SHOWERS"

    case lightToModerateSnow = "LIGHT_TO_MODERATE_SNOW"
    case moderateToHeavySnow = "MODERATE_TO_HEAVY_SNOW"
    case snow = "SNOW"
    case lightSnow = "LIGHT_SNOW"
    case heavySnow = "HEAVY_SNOW"

    case snowstorm = "SNOWSTORM"
    case snowPeriodicallyHeavy = "SNOW_PERIODICALLY_HEAVY"
    case heavySnowStorm = "HEAVY_SNOW_STORM"
    case blowingSnow = "BLOWING_SNOW"

    case rainAndSnow = "RAIN_AND_SNOW"

    case hail = "HAIL"
    case hailShowers = "HAIL_SHOWERS"

    case thunderstorm = "THUNDERSTORM"
    case thundershower = "THUNDERSHOWER"
    case lightThunderstormRain = "LIGHT_THUNDERSTORM_RAIN"
    case scatteredThunderstorms = "SCATTERED_THUNDERSTORMS"
    case heavyThunderstorm = "HEAVY_THUNDERSTORM"
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

//enum WindDirection: String, Codable {
//    case southSoutheast = "SOUTH_SOUTHEAST"
//    case eastSoutheast = "EAST_SOUTHEAST"
//    case north = "NORTH"
//    case northWest = "NORTHWEST"
//    case northNortheast = "NORTH_NORTHEAST"
//    case northNorthwest = "NORTH_NORTHWEST"
//    case westSouthwest = "WEST_SOUTHWEST"
//    
//    //    case north_West = "NORTH_WEST"
//}

enum WindDirection: String, Codable, CaseIterable {
    case north = "NORTH"
    case northNortheast = "NORTH_NORTHEAST"
    case northeast = "NORTHEAST"
    case eastNortheast = "EAST_NORTHEAST"

    case east = "EAST"
    case eastSoutheast = "EAST_SOUTHEAST"
    case southeast = "SOUTHEAST"
    case southSoutheast = "SOUTH_SOUTHEAST"

    case south = "SOUTH"
    case southSouthwest = "SOUTH_SOUTHWEST"
    case southwest = "SOUTHWEST"
    case westSouthwest = "WEST_SOUTHWEST"

    case west = "WEST"
    case westNorthwest = "WEST_NORTHWEST"
    case northwest = "NORTHWEST"
    case northNorthwest = "NORTH_NORTHWEST"
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
