// Package weather provides tools for anouncing the current weather forecast on readable format.
package weather

// CurrentCondition holds a string with the last weather condition broadcast. Associated with CurrentLocation. 
var CurrentCondition string

// CurrentLocation holds a string with the last location broadcast. Associated with CurrentCondition. 
var CurrentLocation string

// Forecast anounces the weather condition for a particular location on readable format.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
