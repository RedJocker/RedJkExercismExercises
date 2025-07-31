package letter

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(text string) FreqMap {
	frequencies := FreqMap{}
	for _, r := range text {
		frequencies[r]++
	}
	return frequencies
}

func countFreq(chars chan FreqMap, text string) {
	chars <- Frequency(text)
}

// ConcurrentFrequency counts the frequency of each rune in the given strings,
// by making use of concurrency.
func ConcurrentFrequency(texts []string) FreqMap {
	size := len(texts)
	chars := make(chan FreqMap, size)
	aggregate := FreqMap{}
	for _, text := range texts {
		go countFreq(chars, text)
	}

	for i := 0; i < size; i++ {
		freq := <-chars
		for ch, count := range freq {
			aggregate[ch] += count
		}
	}
	return aggregate
}
