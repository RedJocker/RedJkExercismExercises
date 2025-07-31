package blackjack

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
	var value int

	switch card {
	case "ace":
		value = 11
	case "king", "queen", "jack", "ten":
		value = 10
	case "nine":
		value = 9
	case "eight":
		value = 8
	case "seven":
		value = 7
	case "six":
		value = 6
	case "five":
		value = 5
	case "four":
		value = 4
	case "three":
		value = 3
	case "two":
		value = 2
	default:
		value = 0
	}
	return value
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
	value1 := ParseCard(card1)
	value2 := ParseCard(card2)
	valueSum := value1 + value2
	valueD := ParseCard(dealerCard)

	var ret string
	if valueSum == 22 {
		ret = "P"
	} else if valueSum == 21 && valueD >= 10 {
		ret = "S"
	} else if valueSum == 21 {
		ret = "W"
	} else if valueSum >= 17 {
		ret = "S"
	} else if valueSum >= 12 && valueD >= 7 {
		ret = "H"
	} else if valueSum >= 12 {
		ret = "S"
	} else {
		ret = "H"
	}
	return ret
}
