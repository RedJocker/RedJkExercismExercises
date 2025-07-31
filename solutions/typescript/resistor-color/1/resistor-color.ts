export const colorCode = (color: string) : number => {
  return COLORS_MAP[color] ?? -1
}

type ColorMap = { 
    [id: string]: number; 
}

export const COLORS_MAP: ColorMap = {
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

export const COLORS = Object.keys(COLORS_MAP)
