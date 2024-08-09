const COLORS_MAP: Record<string, number> = {
  "black": 0,
  "brown": 1,
  "red": 2,
  "orange": 3,
  "yellow": 4,
  "green": 5,
  "blue": 6,
  "violet": 7,
  "grey": 8,
  "white": 9,
}

const UNIT_MAP: Record<number, string> = {
  1: "",
  1000: "kilo",
  1000000: "mega",
  1000000000: "giga"
}


export function decodedResistorValue(colors: Array<string>): string {
  const first = COLORS_MAP[colors[0]]
  const second = COLORS_MAP[colors[1]]
  const third = COLORS_MAP[colors[2]]

  let resNum : number = (first * 10 + second) * Math.pow(10, third);
  let resExp = 1;
  while (resNum >= 1000 && resExp < 1000000000) {
    resExp *= 1000;
    resNum /= 1000;
  }
  return `${resNum} ${UNIT_MAP[resExp]}ohms`
}
