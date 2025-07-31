
export const reverseString = (str) => {
  const chars = str.split('');
  const middle = Math.floor(chars.length / 2);
  for (let i = 0; i < middle; i++) {
    const temp = chars[i];
    chars[i] = chars[chars.length - 1 - i];
    chars[chars.length - 1 - i] = temp;
  }
  return chars.join("");
};
