// code from here:
// https://p5js.org/examples/simulate-particles.html

class Particle {
    // setting the co-ordinates, radius and the
    // speed of a particle in both the co-ordinates axes.
    constructor(p5) {
        this.p5 = p5;
        this.x = p5.random(0, p5.width);
        this.y = p5.random(0, p5.height);
        this.r = 5;
        this.xSpeed = p5.random(-0.05, 0.05);
        this.ySpeed = p5.random(-0.2, -0.3);
    }

    // creation of a particle.
    createParticle() {
        // gradient from [this website](https://www.schemecolor.com/yellow-orange-gradient.php)
        const startYellow = this.p5.color(255, 246, 0)
        // the end color is also transparent
        const endOrange = this.p5.color(254, 129, 22, 0)
        this.p5.fill(startYellow);
        this.p5.circle(this.x, this.y, this.r);

        // glow effect using increasingly larger (and less opaque) circles
        // we fill from the outside in to prevent larger shapes from overloading the smaller ones
        const glowWidth = 15;
        for (let i = glowWidth; i > 0; i--) {
            const size = this.r + i;
            const alpha = (glowWidth + 5 - size) / (glowWidth + 5);
            const fillColor = this.p5.lerpColor(endOrange, startYellow, alpha);
            this.p5.fill(fillColor);
            this.p5.circle(this.x, this.y, size);
        }
    }

    // setting the particle in motion.
    moveParticle() {
        if (this.x < 0 || this.x > p5.width)
            // x is out of bounds. 
            this.reset()
        if (this.y < 0 || this.y > p5.height)
            this.reset()
        this.x += this.xSpeed;
        this.y += this.ySpeed;

        // change the xspeed a bit
        this.xSpeed += this.p5.random(-0.01, 0.01);
    }

    reset() {
        // moves to a random position at the bottom of the screen
        this.y = p5.height - 10;
        this.x = this.p5.random(5, p5.width - 5);
        this.xSpeed = this.p5.random(0, 0.05);
        this.ySpeed = this.p5.random(-0.2, -0.3);
    }
}