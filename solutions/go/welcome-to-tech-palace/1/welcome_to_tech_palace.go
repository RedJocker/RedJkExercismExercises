package techpalace

import (
	"strings"
)

func WelcomeMessage(customer string) string {
	return "Welcome to the Tech Palace, " + strings.ToUpper(customer)
}

func AddBorder(welcomeMsg string, numStarsPerLine int) string {
	bannerRow := strings.Repeat("*", numStarsPerLine)
	return bannerRow + "\n" + welcomeMsg + "\n" + bannerRow
}

func CleanupMessage(oldMsg string) string {
	return strings.Trim(strings.Split(oldMsg, "\n")[1], " *")
}
