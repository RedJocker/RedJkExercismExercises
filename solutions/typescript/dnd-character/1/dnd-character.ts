export class DnDCharacter {

  hitpoints: number
  constitution: number
  strength: number
  dexterity: number
  intelligence: number
  wisdom: number
  charisma: number

  constructor() {
    this.constitution = DnDCharacter.generateAbilityScore()
    this.strength = DnDCharacter.generateAbilityScore()
    this.dexterity = DnDCharacter.generateAbilityScore()
    this.intelligence = DnDCharacter.generateAbilityScore()
    this.wisdom = DnDCharacter.generateAbilityScore()
    this.charisma = DnDCharacter.generateAbilityScore()
    this.hitpoints = 10 + DnDCharacter.getModifierFor(this.constitution)
  }
  
  public static generateAbilityScore(): number {
    return Array(4)
      .fill(0)
      .map((_: number) => 1 + Math.floor(Math.random() * 1000) % 6)
      .sort((a, b) => b - a)
      .slice(0, 3)
      .reduce((a, b) => a + b)
  }

  public static getModifierFor(abilityValue: number): number {
    return Math.floor((abilityValue - 10) / 2)
  }
}
