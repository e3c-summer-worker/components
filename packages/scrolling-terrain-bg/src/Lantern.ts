// each lantern has one particle inside it
import { Particle } from './Particle';

export class Lantern {
    p: p5;
    particle: Particle;
    x: number;
    y: number;

    r: number;
    tint: p5.Color;
    width: number;
    height: number;

    xSpeed: number;
    ySpeed: number;
    img: p5.Image;


    /**
     * 
     * @param p5 the p5 object for us to use
     * @param lanternImg the lantern image 
     * @param depth (number, 0-2) the depth of the lantern. 0 is the furthest away, 2 is the closest
     */
    constructor(p5: p5, lanternImg: p5.Image, depth: number) {
        this.p = p5;

        // initialize speeds and position
        this.x = p5.random(0, p5.width);
        this.y = p5.random(0, p5.height);

        this.xSpeed = p5.random(-0.05, 0.05);
        this.ySpeed = p5.random(-0.2, -0.3);

        // setting size
        // closer ones are bigger
        this.r = 18 * (1 + depth * 0.12);
        // the larger the depth, the darker it is
        this.tint = p5.color(205 + depth * 25);
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
        this.p.tint(this.tint);
        this.p.image(this.img, this.x, this.y, this.r, this.r);
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