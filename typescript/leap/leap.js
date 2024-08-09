export function isLeap(year) {
    const mod = (div) => year % div === 0;
    return mod(400) || (!mod(100) && mod(4));
}
