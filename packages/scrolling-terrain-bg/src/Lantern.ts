import { getRandom } from './Misc';

export class Lantern {
    p: p5;
    x: number;
    y: number;

    r: number;
    tint: p5.Color;
    width: number;
    height: number;

    xSpeed: number;
    ySpeed: number;
    img: p5.Image;
    depth: number;


    /**
     * 
     * @param p5 the p5 object for us to use
     * @param lanternImg the lantern image 
     * @param depth (number, 0-2) the depth of the lantern. 0 is the furthest away, 2 is the closest
     */
    constructor(p5: p5, lanternImg: p5.Image, depth: number) {
        this.p = p5;

        // initialize speeds and position
        // using Math.random() is usually better than using p5.random
        // https://github.com/processing/p5.js/issues/1512
        this.x = getRandom(0, p5.width);
        this.y = getRandom(0, p5.height);

        this.xSpeed = getRandom(-0.05, 0.05);
        this.ySpeed = getRandom(-0.2, -0.3);

        // setting size
        // closer ones are bigger
        this.r = 18 * (1 + depth * 0.12);
        // the larger the depth, the darker it is
        this.tint = p5.color(205 + depth * 25);
        this.width = 20;
        this.height = 30;
        this.depth = depth;

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

        // unfortunately got some magic numbers here
        // `0.8` is the baseline size
        // `0.75` is how much the size increases/decreases for the depth.
        this.x += this.xSpeed * (0.8 + this.depth * 0.75);
        this.y += this.ySpeed * (0.8 + this.depth * 0.75);

        // change the xspeed a bit
        this.xSpeed += getRandom(-0.025, 0.025);
    }

    reset = () => {
        // moves to a random position at the bottom of the screen
        this.y = this.p.height - 10;
        this.x = getRandom(5, this.p.width - 5);
        this.xSpeed = getRandom(0, 0.05);
        this.ySpeed = getRandom(-0.2, -0.3);
    }
}