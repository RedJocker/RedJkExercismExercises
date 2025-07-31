/// <reference path="./global.d.ts" />
// @ts-check

export function cookingStatus(time) {
  if (time === 0)
    return 'Lasagna is done.';
  if (time > 0)
    return 'Not done, please wait.';
  else
    return 'You forgot to set the timer.';
}

export function preparationTime(layers, timePerLayer = 2) {
  return layers.length * timePerLayer;
}

export function quantities(layers) {
  return layers.reduce((acc, layer) => {
      if (layer === 'sauce')
        acc.sauce += 0.2;
      else if (layer === 'noodles')
        acc.noodles += 50;
      return acc; 
    }, {sauce: 0, noodles: 0}
  );
}

export function addSecretIngredient(friendIngredients, myIngredients) {
  myIngredients.push(friendIngredients[friendIngredients.length - 1]);
}

export function scaleRecipe(recipe, portions) {
  const scaledRecipe = {...recipe};
  for (const k in scaledRecipe) {
    scaledRecipe[k] *= portions / 2
  }
  return scaledRecipe;
}