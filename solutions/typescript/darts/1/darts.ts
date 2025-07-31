export function score(x: number, y: number): number {
  const radius = Math.sqrt(x * x + y * y)
  return radius > 10 ?
    0 :
    radius > 5 ?
      1 :
      radius > 1 ?
	5 :
	10
}
