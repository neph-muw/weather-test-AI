//
//  WeatherView.swift
//  weather-test-AI
//
//  Created by Roman Mykitchak on 3/25/26.
//


import SwiftUI

struct WeatherView: View {
    
    @StateObject private var vm = WeatherViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            
            if vm.isLoading {
                ProgressView()
            }
            
            Text(vm.temperatureText)
                .font(.system(size: 64, weight: .bold))
            
            Text(vm.descriptionText)
                .foregroundColor(.gray)
            
            HStack(spacing: 30) {
//                InfoView(title: "Humidity", value: vm.humidityText)
                InfoView(title: "Wind", value: vm.windText)
            }
            
            if let error = vm.error {
                Text(error)
                    .foregroundColor(.red)
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            vm.load(lat: 52.2297, lon: 21.0122)
        }
    }
}

struct InfoView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
        }
    }
}
