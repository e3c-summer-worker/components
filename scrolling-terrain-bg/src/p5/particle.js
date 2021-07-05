// code from here:
// https://p5js.org/examples/simulate-particles.html

class Particle {
    // setting the co-ordinates, radius and the
    // speed of a particle in both the co-ordinates axes.
    constructor() {
        this.x = random(0, width);
        this.y = random(0, height);
        this.r = 5; // although it changes based on the mouse
        this.xSpeed = random(-0.05, 0.05);
        this.ySpeed = random(-0.2, -0.3);
    }

    // creation of a particle.
    createParticle() {
        fill('rgb(254, 222, 23)');
        circle(this.x, this.y, this.r);

        // glow effect using increasingly larger (and less opaque) circles
        for (let i = 0; i < 10; i++) {
            const size = this.r + i;
            const alpha = (15 - size) / 15;

            fill(`rgba(254, 222, 23, ${alpha})`);
            circle(this.x, this.y, size);
        }
    }

    // setting the particle in motion.
    moveParticle() {
        if (this.x < 0 || this.x > width)
            // x is out of bounds. 
            this.reset()
        if (this.y < 0 || this.y > height)
            this.reset()
        this.x += this.xSpeed;
        this.y += this.ySpeed;
    }

    reset() {
        // moves to a random position at the bottom of the screen
        this.y = height - 10;
        this.x = random(5, width - 5);
        this.xSpeed = random(0, 0.05);
        this.ySpeed = random(-0.2, -0.3);
    }
}