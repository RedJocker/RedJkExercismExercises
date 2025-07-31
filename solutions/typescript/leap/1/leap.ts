export function isLeap(year: number): boolean {
  const mod = (div: number) => year % div == 0
  return mod(400) || (!mod(100) && mod(4))
}
