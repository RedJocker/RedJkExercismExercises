module LuciansLusciousLasagna (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes) where

expectedMinutesInOven = 40

preparationTimeInMinutes = (*) 2

elapsedTimeInMinutes layersAmount ovenMinutes =
  (+) (preparationTimeInMinutes layersAmount) (expectedMinutesInOven - ovenMinutes)
