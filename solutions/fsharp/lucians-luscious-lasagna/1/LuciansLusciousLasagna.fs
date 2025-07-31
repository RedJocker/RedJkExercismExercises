module LuciansLusciousLasagna


let expectedMinutesInOven = 40

let remainingMinutesInOven ovenTime =
    expectedMinutesInOven - ovenTime

let preparationTimeInMinutes layers = 2 * layers

let elapsedTimeInMinutes layers ovenTime =
    preparationTimeInMinutes layers + ovenTime