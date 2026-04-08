//
//  ContentView.swift
//  weather-test-AI
//
//  Created by Roman Mykitchak on 3/21/26.
//

import SwiftUI

struct ContentView: View {
    //    @StateObject private var service = WeatherService()
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    private let latitude: Double = 52.2297
    private let longitude: Double = 21.0122
    
    var body: some View {
        NavigationStack {
            Group {
                WeatherView()
            }
        }
    }
}
                /*
                
                if let errorMessage {
                    VStack(spacing: 12) {
                        Text("Failed to load forecast")
                            .font(.headline)
                        Text(errorMessage)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        Button("Retry") { Task { await load() } }
                            .buttonStyle(.borderedProminent)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if isLoading && service.forecast.isEmpty {
                    ProgressView("Loading forecast…")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List(service.forecast) { day in
                        DailyForecastRow(forecast: day)
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("7-Day Forecast")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task { await load(force: true) }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                    .disabled(isLoading)
                }
            }
            .task { await load() }
            .refreshable { await load(force: true) }
        }
    }

    @MainActor
    private func load(force: Bool = false) async {
        guard !isLoading || force else { return }
        isLoading = true
        errorMessage = nil
        do {
            try await service.fetchSevenDayForecast(latitude: latitude, longitude: longitude)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
                 */

#Preview {
    ContentView()
}
