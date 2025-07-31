export class InvalidInputError extends Error {
  constructor(message: string) {
    super()
    this.message = message || 'Invalid Input'
  }
}

const directions = ['north', 'east', 'south', 'west'] as const
type Direction = (typeof directions)[number]
const isDirection = (maybeDirection: any): maybeDirection is Direction => {
  return directions.includes(maybeDirection)
}
type Coordinates = [number, number]

export class Robot {

  private _bearing: Direction = 'north'
  private _coordinates: Coordinates = [0, 0]
  
  get bearing(): Direction {
    return this._bearing
  }

  get coordinates(): Coordinates {
    return this._coordinates
  }

  place({x, y, direction}: { x: number; y: number; direction: string}) {
    if (isDirection(direction)) {
      this._bearing = direction
    } else {
      throw new InvalidInputError("")
    }
    this._coordinates[0] = x
    this._coordinates[1] = y
  }

  evaluate(instructions: string) {
    [...instructions].forEach(this.move, this)
  }

  private move(ch: string) {
    switch(ch) {
      case "R":
	this.rotate(); break;
      case "L":
	this.revRotate(); break;
      case "A":
	this.forward(); break;
      default:
	throw new InvalidInputError("")
    }
  }

  private forward() {
    const moveX = this._bearing === 'east' ?
          1
      : this._bearing === 'west' ?
	  -1 : 0

    const moveY = this._bearing === 'north' ?
          1
      : this._bearing === 'south' ?
	  -1 : 0

    const [x, y] = this._coordinates
    this._coordinates = [x + moveX, y + moveY]
  }

  private rotate() {
    this.rotation(1)
  }

  private revRotate() {
    this.rotation(-1)
  }

  private rotation(n: number) {
    const i = directions.indexOf(this._bearing)
    this._bearing = directions[(i + n + 4) % 4]
  }
}
