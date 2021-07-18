// code from here:
// https://p5js.org/examples/simulate-particles.html

export class Particle {
    p: p5;
    readonly innerRadius: number;
    readonly glowRadius: number;

    // setting the co-ordinates, radius and the
    // speed of a particle in both the co-ordinates axes.
    constructor(p5: p5, r: number) {
        this.p = p5;

        this.innerRadius = Math.round(r / 4);
        this.glowRadius = r - this.innerRadius;
    }

    // creation of a particle.
    draw = (x: number, y: number) => {
        // gradient from [this website](https://www.schemecolor.com/yellow-orange-gradient.php)
        const startYellow = this.p.color(255, 246, 0)
        // the end color is also transparent
        const endOrange = this.p.color(254, 129, 22, 0)
        this.p.fill(startYellow);
        this.p.circle(x, y, this.innerRadius);

        // glow effect using increasingly larger (and less opaque) circles
        // we fill from the outside in to prevent larger shapes from overloading the smaller ones
        for (let i = this.glowRadius; i > 0; i--) {
            const size = this.innerRadius + i;
            const alpha = (this.glowRadius + this.innerRadius - size) / (this.glowRadius + this.innerRadius);
            const fillColor = this.p.lerpColor(endOrange, startYellow, alpha);
            this.p.fill(fillColor);
            this.p.circle(x, y, size);
        }
    }
}
