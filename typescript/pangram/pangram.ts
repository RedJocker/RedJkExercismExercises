export function isPangram(maybePangram: string): boolean {
  const histogram = Array(26).fill(0)
  for (let ch of maybePangram) {
    histogram[charIndex(ch)] = 1
  }
  return histogram.every((it) => it === 1)
}

function charIndex(ch: string): number {
  return ch.toLowerCase().charCodeAt(0) - 'a'.charCodeAt(0)
}
