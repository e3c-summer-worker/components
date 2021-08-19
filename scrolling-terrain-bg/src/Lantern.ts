// each lantern has one particle inside it

import p5 = require('p5');
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
    img: p5.Image;


    constructor(p5: p5, lanternImg: p5.Image) {
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
        // this.particle = new Particle(p5, this.r);

        // initialize image
        this.img = lanternImg;
    }

    // creation of a particle.
    draw = () => {
        // draw lantern
        this.p.image(this.img, this.x, this.y, 20, 20);
    }

    // setting the particle in motion.
    move = () => {
        // Check if x of y is out of bounds
        const xOutOfBounds = this.x < 0 || this.x > this.p.width;
        const yOutOfBounds = this.y + this.r < 0 || this.y > this.p.height;
        if (xOutOfBounds || yOutOfBounds) {
            this.reset()
            return;
        }

        this.x += this.xSpeed;
        this.y += this.ySpeed;

        // change the xspeed a bit
        this.xSpeed += this.p.random(-0.025, 0.025);
    }

    reset = () => {
        // moves to a random position at the bottom of the screen
        this.y = this.p.height - 10;
        this.x = this.p.random(5, this.p.width - 5);
        this.xSpeed = this.p.random(0, 0.05);
        this.ySpeed = this.p.random(-0.2, -0.3);
    }
}