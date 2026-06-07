//
//  ViewModel.swift
//  weather-test-AI
//
//  Created by Roman Mykitchak on 3/25/26.
//

import Foundation
import Combine

final class WeatherViewModel: ObservableObject {
    
    @Published var weather: WeatherResponseNet?
    @Published var isLoading = false
    @Published var error: String?
    
    private let service: WeatherServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(service: WeatherServiceProtocol = WeatherService(session: URLSession.shared)) {
        self.service = service
    }
    
    func load(lat: Double, lon: Double) {
        isLoading = true
        error = nil
        
        service.fetchCurrentWeather(lat: lat, lon: lon)
            .sink { [weak self] completion in
                guard let self else { return }
                self.isLoading = false
                
                if case let .failure(err) = completion {
                    self.error = err.localizedDescription
                    print(String.init(describing: error))
                }
            } receiveValue: { [weak self] response in
                self?.weather = response
            }
            .store(in: &cancellables)
    }
}

// MARK: - UI Helpers
extension WeatherViewModel {
    
    var temperatureText: String {
        guard let temp = weather?.temperature.degrees else { return "--" }
        return "\(Int(temp))°"
    }
    
    var descriptionText: String {
        weather?.weatherCondition.description.text ?? "--"
    }
    
//    var humidityText: String {
//        guard let h = weather?.relativeHumidity else { return "--" }
//        return "\(h)%"
//    }
//    
//    var windText: String {
//        guard let wind = weather?.wind.speed.value else { return "--" }
//        return "\(Int(wind)) km/h"
//    }
    
    var windText: String {
        guard let wind = weather?.wind.speed.value else { return "--" }
        return "\(Int(wind)) km/h"
    }
}
