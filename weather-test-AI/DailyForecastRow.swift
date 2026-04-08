
/*
import SwiftUI

public struct DailyForecastRow: View {
    public let forecast: DailyForecast

    public init(forecast: DailyForecast) {
        self.forecast = forecast
    }

    private var symbol: String {
        switch forecast.condition.lowercased() {
        case let s where s.contains("clear"): return "sun.max"
        case let s where s.contains("cloud"): return "cloud"
        case let s where s.contains("fog"): return "cloud.fog"
        case let s where s.contains("rain"): return "cloud.rain"
        case let s where s.contains("snow"): return "snow"
        default: return "questionmark.circle"
        }
    }

    private var weekday: String {
        let df = DateFormatter()
        df.dateFormat = "EEEE"
        return df.string(from: forecast.date)
    }

    public var body: some View {
        HStack(spacing: 12) {
            Text(weekday)
                .font(.headline)
            Spacer()
            Image(systemName: symbol)
            Text(String(format: "%.1f° / %.1f°", forecast.minTemp, forecast.maxTemp))
                .monospacedDigit()
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    DailyForecastRow(
        forecast: DailyForecast(
            date: Date(),
            minTemp: 12.3,
            maxTemp: 21.8,
            condition: "Clear"
        )
    )
}

*/
