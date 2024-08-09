export class DnDCharacter {
    hitpoints;
    constitution;
    strength;
    dexterity;
    intelligence;
    wisdom;
    charisma;
    constructor() {
        this.constitution = DnDCharacter.generateAbilityScore();
        this.strength = DnDCharacter.generateAbilityScore();
        this.dexterity = DnDCharacter.generateAbilityScore();
        this.intelligence = DnDCharacter.generateAbilityScore();
        this.wisdom = DnDCharacter.generateAbilityScore();
        this.charisma = DnDCharacter.generateAbilityScore();
        this.hitpoints = 10 + DnDCharacter.getModifierFor(this.constitution);
    }
    static generateAbilityScore() {
        return Array(4)
            .fill(0)
            .map((_) => 1 + Math.floor(Math.random() * 1000) % 6)
            .sort((a, b) => b - a)
            .slice(0, 3)
            .reduce((a, b) => a + b);
    }
    static getModifierFor(abilityValue) {
        return Math.floor((abilityValue - 10) / 2);
    }
}
