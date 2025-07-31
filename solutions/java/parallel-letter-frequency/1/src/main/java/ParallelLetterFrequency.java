import java.util.Arrays;
import java.util.Map;
import java.util.stream.Collectors;

class ParallelLetterFrequency {

    private final Map<Character, Integer> histogram;

    ParallelLetterFrequency(String[] texts) {

        histogram = Arrays.stream(texts)
                .parallel()
                .flatMap(word -> word.chars().boxed())
                .filter(Character::isAlphabetic)
                .map(Character::toLowerCase)
                .map(codePoint -> Character.toString(codePoint).charAt(0))
                .collect(Collectors.groupingBy(
                        b -> b,
                        Collectors.reducing(0, e -> 1, Integer::sum)
                ));
    }

    Map<Character, Integer> countLetters() {
        return histogram;
    }
}
