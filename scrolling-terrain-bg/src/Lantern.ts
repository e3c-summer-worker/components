// each lantern has one particle inside it

import { Particle } from './Particle';

export class Lantern {
    p: p5;
    particle: Particle;
    x: number;
    y: number;
    r: number;
    width: number;
    height: number;
    xSpeed: number;
    ySpeed: number;

    constructor(p5: p5) {
        this.p = p5;

        // initialize speeds and position
        this.x = p5.random(0, p5.width);
        this.y = p5.random(0, p5.height);

        this.xSpeed = p5.random(-0.05, 0.05);
        this.ySpeed = p5.random(-0.2, -0.3);

        // setting size
        this.r = 20;
        this.width = 20;
        this.height = 30;

        // initialize particle
        this.particle = new Particle(p5, this.r);
    }

    // creation of a particle.
    draw = () => {
        const fillColor = this.p.color(254, 129, 22, 75)
        this.p.fill(fillColor);
        this.p.rectMode(this.p.CENTER);
        // draws a lantern skeleton
        this.p.rect(this.x, this.y, this.width, this.height, 8);

        this.particle.draw(this.x, this.y + 5);
    }

    // setting the particle in motion.
    move = () => {
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