export class InvalidInputError extends Error {
    constructor(message) {
        super();
        this.message = message || 'Invalid Input';
    }
}
const directions = ['north', 'east', 'south', 'west'];
const isDirection = (maybeDirection) => {
    return directions.includes(maybeDirection);
};
export class Robot {
    _bearing = 'north';
    _coordinates = [0, 0];
    get bearing() {
        return this._bearing;
    }
    get coordinates() {
        return this._coordinates;
    }
    place({ x, y, direction }) {
        if (isDirection(direction)) {
            this._bearing = direction;
        }
        else {
            throw new InvalidInputError("");
        }
        this._coordinates[0] = x;
        this._coordinates[1] = y;
    }
    evaluate(instructions) {
        [...instructions].forEach(this.move, this);
    }
    move(ch) {
        switch (ch) {
            case "R":
                this.rotate();
                break;
            case "L":
                this.revRotate();
                break;
            case "A":
                this.forward();
                break;
            default:
                throw new InvalidInputError("");
        }
    }
    forward() {
        const moveX = this._bearing === 'east' ?
            1
            : this._bearing === 'west' ?
                -1 : 0;
        const moveY = this._bearing === 'north' ?
            1
            : this._bearing === 'south' ?
                -1 : 0;
        const [x, y] = this._coordinates;
        this._coordinates = [x + moveX, y + moveY];
    }
    rotate() {
        this.rotation(1);
    }
    revRotate() {
        this.rotation(-1);
    }
    rotation(n) {
        const i = directions.indexOf(this._bearing);
        this._bearing = directions[(i + n + 4) % 4];
    }
}
