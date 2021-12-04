/**
 * Generates a random number between min and max
 * 
 * @param min The minimum number
 * @param max The maximum number
 * @returns A random number between min and max
 */
export const getRandom = (min: number, max: number) => {
    return Math.random() * (max - min) + min;
}