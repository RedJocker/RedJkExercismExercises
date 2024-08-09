export function valid(digits) {
    const numbers = digits.split("")
        .filter((it) => !it.match("\\s"))
        .map((it) => Number(it) ?? -1)
        .reverse();
    return numbers.reduce((acc, cur, i) => {
        if (cur === -1)
            return -1;
        else if (i % 2 === 0)
            return acc + cur;
        const double = cur * 2;
        return double > 9 ? acc + double - 9 : acc + double;
    }) % 10 == 0 && numbers.length > 1;
}
