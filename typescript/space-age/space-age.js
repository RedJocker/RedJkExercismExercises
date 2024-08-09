function toEarthYears(seconds) {
    return seconds / 31557600;
}
const TO_PLANET_YEARS = {
    "mercury": 0.2408467,
    "venus": 0.61519726,
    "earth": 1.0,
    "mars": 1.8808158,
    "jupiter": 11.862615,
    "saturn": 29.447498,
    "uranus": 84.016846,
    "neptune": 164.79132,
};
function round2f(num) {
    return Math.round(100 * num) / 100;
}
export function age(planet, seconds) {
    return round2f(toEarthYears(seconds) / TO_PLANET_YEARS[planet.toLowerCase()]);
}
