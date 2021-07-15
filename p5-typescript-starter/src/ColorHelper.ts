export class ColorHelper {
    p: p5;
    constructor(p: p5) {
        this.p = p;
    }

    private getColorVector(c: p5.Color) {
        return this.p.createVector(
            this.p.red(c),
            this.p.green(c),
            this.p.blue(c)
        );
    }

    public rainbowColorBase() {
        return [
            this.p.color('red'),
            this.p.color('orange'),
            this.p.color('yellow'),
            this.p.color('green'),
            this.p.color(38, 58, 150), // blue
            this.p.color('indigo'),
            this.p.color('violet')
        ];
    }

    public getColorsArray(total: number, baseColorArray: p5.Color[] = null): p5.Color[] {

        if (baseColorArray == null) {
            baseColorArray = this.rainbowColorBase();
        }
        const rainbowColors = baseColorArray.map(x => this.getColorVector(x));;

        const colours = new Array<p5.Color>();
        for (let i = 0; i < total; i++) {
            const colorPosition = i / total;
            const scaledColorPosition = colorPosition * (rainbowColors.length - 1);

            const colorIndex = Math.floor(scaledColorPosition);
            const colorPercentage = scaledColorPosition - colorIndex;

            const nameColor = this.getColorByPercentage(rainbowColors[colorIndex], rainbowColors[colorIndex + 1], colorPercentage);

            colours.push(this.p.color(nameColor.x, nameColor.y, nameColor.z))
        }

        return colours;
    }

    private getColorByPercentage(firstColor: p5.Vector, secondColor: p5.Vector, percentage: number) {
        // assumes colors are p5js vectors
        const firstColorCopy = firstColor.copy();
        const secondColorCopy = secondColor.copy();

        const deltaColor = secondColorCopy.sub(firstColorCopy);
        const scaledDeltaColor = deltaColor.mult(percentage);
        return firstColorCopy.add(scaledDeltaColor);
    }
}