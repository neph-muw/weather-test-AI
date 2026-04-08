import Combine
import Foundation


/*
 
 {
     "currentTime": "2026-03-22T12:43:27.206335812Z",
     "timeZone": {
         "id": "Europe/Warsaw"
     },
     "isDaytime": true,
     "weatherCondition": {
         "iconBaseUri": "https://maps.gstatic.com/weather/v1/cloudy",
         "description": {
             "text": "Cloudy",
             "languageCode": "en"
         },
         "type": "CLOUDY"
     },
     "temperature": {
         "degrees": 13.2,
         "unit": "CELSIUS"
     },
     "feelsLikeTemperature": {
         "degrees": 12,
         "unit": "CELSIUS"
     },
     "dewPoint": {
         "degrees": -1,
         "unit": "CELSIUS"
     },
     "heatIndex": {
         "degrees": 13.2,
         "unit": "CELSIUS"
     },
     "windChill": {
         "degrees": 12,
         "unit": "CELSIUS"
     },
     "relativeHumidity": 37,
     "uvIndex": 0,
     "precipitation": {
         "probability": {
             "percent": 10,
             "type": "RAIN"
         },
         "snowQpf": {
             "quantity": 0,
             "unit": "MILLIMETERS"
         },
         "qpf": {
             "quantity": 0,
             "unit": "MILLIMETERS"
         }
     },
     "thunderstormProbability": 0,
     "airPressure": {
         "meanSeaLevelMillibars": 1022.45
     },
     "wind": {
         "direction": {
             "degrees": 121,
             "cardinal": "EAST_SOUTHEAST"
         },
         "speed": {
             "value": 11,
             "unit": "KILOMETERS_PER_HOUR"
         },
         "gust": {
             "value": 23,
             "unit": "KILOMETERS_PER_HOUR"
         }
     },
     "visibility": {
         "distance": 16,
         "unit": "KILOMETERS"
     },
     "cloudCover": 94,
     "currentConditionsHistory": {
         "temperatureChange": {
             "degrees": 3,
             "unit": "CELSIUS"
         },
         "maxTemperature": {
             "degrees": 12.9,
             "unit": "CELSIUS"
         },
         "minTemperature": {
             "degrees": 0.9,
             "unit": "CELSIUS"
         },
         "snowQpf": {
             "quantity": 0,
             "unit": "MILLIMETERS"
         },
         "qpf": {
             "quantity": 0,
             "unit": "MILLIMETERS"
         }
     }
 }
 
 */

/*

public struct DailyForecast: Identifiable, Codable, Hashable {
    public let id: UUID
    public let date: Date
    public let minTemp: Double
    public let maxTemp: Double
    public let condition: String

    public init(id: UUID = UUID(), date: Date, minTemp: Double, maxTemp: Double, condition: String) {
        self.id = id
        self.date = date
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.condition = condition
    }
}

import Foundation

// MARK: - Root
struct WeatherResponse: Codable {
    let currentTime: String
    let timeZone: TimeZoneInfo
    let isDaytime: Bool
    let weatherCondition: WeatherCondition
    let temperature: MeasurementValue
    let feelsLikeTemperature: MeasurementValue
    let dewPoint: MeasurementValue
    let heatIndex: MeasurementValue
    let windChill: MeasurementValue
    let relativeHumidity: Int
    let uvIndex: Int
    let precipitation: Precipitation
    let thunderstormProbability: Int
    let airPressure: AirPressure
    let wind: Wind
    let visibility: Distance
    let cloudCover: Int
    let currentConditionsHistory: CurrentConditionsHistory
}

// MARK: - TimeZone
struct TimeZoneInfo: Codable {
    let id: String
}

// MARK: - WeatherCondition
struct WeatherCondition: Codable {
    let iconBaseUri: String
    let description: Description
    let type: String
}

struct Description: Codable {
    let text: String
    let languageCode: String
}

// MARK: - MeasurementValue
struct MeasurementValue: Codable {
    let degrees: Double
    let unit: String
}

// MARK: - Precipitation
struct Precipitation: Codable {
    let probability: Probability
    let snowQpf: Quantity
    let qpf: Quantity
}

struct Probability: Codable {
    let percent: Int
    let type: String
}

// MARK: - Quantity
struct Quantity: Codable {
    let quantity: Double
    let unit: String
}

// MARK: - AirPressure
struct AirPressure: Codable {
    let meanSeaLevelMillibars: Double
}

// MARK: - Wind
struct Wind: Codable {
    let direction: Direction
    let speed: Speed
    let gust: Speed
}

struct Direction: Codable {
    let degrees: Int
    let cardinal: String
}

struct Speed: Codable {
    let value: Double
    let unit: String
}

// MARK: - Distance
struct Distance: Codable {
    let distance: Double
    let unit: String
}

// MARK: - History
struct CurrentConditionsHistory: Codable {
    let temperatureChange: MeasurementValue
    let maxTemperature: MeasurementValue
    let minTemperature: MeasurementValue
    let snowQpf: Quantity
    let qpf: Quantity
}






/*
 https://weather.googleapis.com/v1/currentConditions:lookup?key=AIzaSyCstuTTuo-n68To1-PsrPxcx4ynnUzlLZY&location.latitude=LATITUDE&location.longitude=LONGITUDE
 */

@MainActor
public final class WeatherService: ObservableObject {
    @Published private(set) var forecast: WeatherResponse = .init(currentTime: "2026-03-22T12:43:27.206335812Z", timeZone: TimeZoneInfo(id: "Europe/Warsaw"), isDaytime: true, weatherCondition: WeatherCondition(iconBaseUri: "https://maps.gstatic.com/weather/v1/cloudy", description: Description(text: "Cloudy", languageCode: "en"), type: "CLOUDY"), temperature: MeasurementValue(degrees: 0.0, unit: ""), feelsLikeTemperature: MeasurementValue(degrees: 0.0, unit: ""), dewPoint: MeasurementValue(degrees: 0.0, unit: ""), heatIndex: MeasurementValue(degrees: 0.0, unit: ""), windChill: MeasurementValue(degrees: 0.0, unit: ""), relativeHumidity: 0, uvIndex: 0, precipitation: Precipitation(probability: Probability(percent: 0, type: ""), snowQpf: Quantity(quantity: 0.0, unit: ""), qpf: Quantity(quantity: 0.0, unit: "")), thunderstormProbability: 0, airPressure: AirPressure(meanSeaLevelMillibars: 0.0), wind: Wind(direction: Direction(degrees: 0, cardinal: ""), speed: Speed(value: 0.0, unit: ""), gust: Speed(value: 0.0, unit: "")), visibility: Distance(distance: 0.0, unit: ""), cloudCover: 0, currentConditionsHistory: CurrentConditionsHistory(temperatureChange: MeasurementValue(degrees: 0.0, unit: ""), maxTemperature: MeasurementValue(degrees: 0.0, unit: ""), minTemperature: MeasurementValue(degrees: 0.0, unit: ""), snowQpf: Quantity(quantity: 0.0, unit: ""), qpf: Quantity(quantity: 0.0, unit: "")))

    public init() {}

    public func fetchSevenDayForecast(latitude: Double, longitude: Double) async throws {
        // Read API key from WeatherConfig.plist
//        let apiKey: String? = {
//            guard let url = Bundle.main.url(forResource: "WeatherConfig", withExtension: "plist"),
//                  let data = try? Data(contentsOf: url),
//                  let plist = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] else {
//                return nil
//            }
//            return plist["GOOGLE_WEATHER_API_KEY"] as? String
//        }()
//        guard let apiKey, !apiKey.isEmpty else {
//            throw NSError(domain: "WeatherService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Missing GOOGLE_WEATHER_API_KEY in Info.plist"])
//        }

        // Google Weather API (example endpoint; ensure your project has access)
        // Docs: https://developers.google.com/maps/documentation/weather
        // Example endpoint pattern:
        // https://weather.googleapis.com/v1/location/lat,lon:forecast?daily=weather&key=API_KEY
//        let urlString = "https://weather.googleapis.com/v1/location/\(latitude),\(longitude):forecast?daily=weather&key=\(apiKey)"
        let urlString = "https://weather.googleapis.com/v1/currentConditions:lookup?key=AIzaSyCstuTTuo-n68To1-PsrPxcx4ynnUzlLZY&location.latitude=\(latitude)&location.longitude=\(longitude)"
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "WeatherService", code: -2, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw NSError(domain: "WeatherService", code: -3, userInfo: [NSLocalizedDescriptionKey: "Server error"])
        }

        // Define minimal decoding structs matching expected Google response
        struct Root: Decodable {
            let daily: WeatherResponse
            /*
            [Day]
            struct Day: Decodable {
                let date: String
                let temperatureMin: Double
                let temperatureMax: Double
                let condition: String?
            }
            */
        }

        // Attempt to decode; if schema differs, provide a friendly error.
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let root: Root
        do {
            root = try decoder.decode(Root.self, from: data)
        } catch {
            throw NSError(domain: "WeatherService", code: -4, userInfo: [NSLocalizedDescriptionKey: "Unexpected response format"])
        }

        let df = DateFormatter()
        df.calendar = Calendar(identifier: .gregorian)
        df.dateFormat = "yyyy-MM-dd"

        let mapped: WeatherResponse = root.daily.prefix(7).compactMap { day in
            guard let d = df.date(from: day.date) else { return nil }
            return WeatherResponse(date: d,
                                 minTemp: day.temperatureMin,
                                 maxTemp: day.temperatureMax,
                                 condition: day.condition ?? "Unknown")
        }

        self.forecast = mapped
    }
}

*/

import Foundation
import Combine

protocol WeatherServiceProtocol {
    func fetchCurrentWeather(lat: Double, lon: Double) -> AnyPublisher<WeatherResponse, Error>
}

final class WeatherService: WeatherServiceProtocol {
    
    private var session: URLSession
    private let decoder: JSONDecoder
    private let baseURL: URL
    
    
    init(
        session: URLSession? /*= URLSession.shared*/,
        baseURL: URL = URL(string: "https://weather.googleapis.com/v1/currentConditions:lookup")!

//        baseURL: URL = URL(string: "https://weather.googleapis.com/v1/currentConditions:lookup?key=AIzaSyCstuTTuo-n68To1-PsrPxcx4ynnUzlLZY&location.latitude=\(52.2297)&location.longitude=\(21.0122)")!
    ) {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = [
            "Content-Type": "application/json"
        ]
        self.session = URLSession(configuration: config)
        
        print(String.init(describing: self.session))
        
//        self.session.configuration.httpAdditionalHeaders.contentType = "application/json"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        self.decoder = decoder
        
        self.baseURL = baseURL
    }
    
    func fetchCurrentWeather(lat: Double, lon: Double) -> AnyPublisher<WeatherResponse, Error> {
        do {
            let url = try makeURL(lat: lat, lon: lon)
            
            return session.dataTaskPublisher(for: url)
                .tryMap { output in
                    try self.validate(output.response)
                    return output.data
                }
                .decode(type: WeatherResponse.self, decoder: decoder)
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
            
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}

// MARK: - Helpers
private extension WeatherService {
    
    func makeURL(lat: Double, lon: Double) throws -> URL {
        print("BASE-URL = \(baseURL)")
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
//        components?.path = "/weather/current"
//        components?.path = "/v1/currentConditions:lookup"
        components?.queryItems = [
            URLQueryItem(name: "key", value: "AIzaSyCstuTTuo-n68To1-PsrPxcx4ynnUzlLZY"),
            URLQueryItem(name: "location.latitude", value: "\(lat)"),
            URLQueryItem(name: "location.longitude", value: "\(lon)")
        ]
        
        
        guard let url = components?.url else {
            throw URLError(.badURL)
        }
        return url
    }
    
    func validate(_ response: URLResponse) throws {
        guard let http = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...299).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
    }
}
