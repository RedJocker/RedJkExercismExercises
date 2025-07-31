func dailyRateFrom(hourlyRate: Int) -> Double {
    return Double(8 * hourlyRate) 
}

func monthlyRateFrom(
  hourlyRate: Int,
  withDiscount discount: Double
) -> Double {
    return (22.0
      * dailyRateFrom(hourlyRate: hourlyRate)
      * (1 - (discount / 100)))
      .rounded()
}

func workdaysIn(
  budget: Double,
  hourlyRate: Int,
  withDiscount discount: Double
) -> Double {
    return (budget
      * (1 + (discount / 100))
      / dailyRateFrom(hourlyRate: hourlyRate))
      .rounded()
    
}

// monthlyRateFrom(hourlyRate: 77, withDiscount: 10.5)
