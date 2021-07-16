// code from here:
// https://p5js.org/examples/simulate-particles.html

export class Particle {
    p: p5;
    x: number;
    y: number;
    r: number;
    xSpeed: number;
    ySpeed: number;


    // setting the co-ordinates, radius and the
    // speed of a particle in both the co-ordinates axes.
    constructor(p5: p5) {
        this.p = p5;
        this.x = p5.random(0, p5.width);
        this.y = p5.random(0, p5.height);
        this.r = 5;
        this.xSpeed = p5.random(-0.05, 0.05);
        this.ySpeed = p5.random(-0.2, -0.3);
    }

    // creation of a particle.
    createParticle = () => {
        // gradient from [this website](https://www.schemecolor.com/yellow-orange-gradient.php)
        const startYellow = this.p.color(255, 246, 0)
        // the end color is also transparent
        const endOrange = this.p.color(254, 129, 22, 0)
        this.p.fill(startYellow);
        this.p.circle(this.x, this.y, this.r);

        // glow effect using increasingly larger (and less opaque) circles
        // we fill from the outside in to prevent larger shapes from overloading the smaller ones
        const glowWidth = 15;
        for (let i = glowWidth; i > 0; i--) {
            const size = this.r + i;
            const alpha = (glowWidth + 5 - size) / (glowWidth + 5);
            const fillColor = this.p.lerpColor(endOrange, startYellow, alpha);
            this.p.fill(fillColor);
            this.p.circle(this.x, this.y, size);
        }
    }

    // setting the particle in motion.
    moveParticle = () => {
        if (this.x < 0 || this.x > this.p.width)
            // x is out of bounds. 
            this.reset()
        if (this.y + this.r < 0 || this.y > this.p.height)
            this.reset()
        this.x += this.xSpeed;
        this.y += this.ySpeed;

        // change the xspeed a bit
        this.xSpeed += this.p.random(-0.01, 0.01);
    }

    reset = () => {
        // moves to a random position at the bottom of the screen
        this.y = this.p.height - 10;
        this.x = this.p.random(5, this.p.width - 5);
        this.xSpeed = this.p.random(0, 0.05);
        this.ySpeed = this.p.random(-0.2, -0.3);
    }
}
