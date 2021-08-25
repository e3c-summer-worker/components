import p5 = require('p5');
import { Lantern } from './Lantern'
import { setupTerrain } from './terrain';

/**
 * State Class
 * 
 * This class encapsulates the logic of our application
 * 
 */

// TYPES

export type StateType = 'static' | 'dynamic';


// always initialize to the static type
export interface InitData {
    p5: p5;
    lanternImg: p5.Image;
    lanternBg: p5.Image;
    zapIcon: p5.Image;
    pictureIcon: p5.Image;

    width: number;
    height: number;
    speed: number;
}


// Static image or the dynamic lanterns
// although this is in essence a sum type between the static and dynamic types
// we have to store the info of both types.
export class State {
    p5: p5;
    stateType: StateType;

    // DATA FOR DYNAMIC TYPE
    lanternImg: p5.Image;
    speed: number;
    terrainPoints1: number[];
    terrainPoints2: number[];
    terrainPoints3: number[];

    offsets: number[];
    lanterns: Lantern[][];

    // DATA FOR STATIC TYPE
    bgImage: p5.Image;

    // window data
    width: number;
    height: number;

    // state toggle button
    zapIcon: p5.Image;
    pictureIcon: p5.Image;

    // location of the button
    readonly buttonX: number;
    readonly buttonY: number;

    constructor({ p5, lanternImg, lanternBg, width, height, speed, zapIcon, pictureIcon }: InitData) {
        this.p5 = p5;

        const lanterns: Lantern[][] = [];
        // add particles
        // particles depend on the width of the screen
        const numLanterns = Math.round(width / 150);
        for (let i = 0; i < 3; i++) {
            const terrainLanterns = []
            for (let j = 0; j < numLanterns; j++) {
                terrainLanterns.push(new Lantern(p5, lanternImg));
            }
            lanterns.push(terrainLanterns)
        }

        this.stateType = 'static';

        // DYNAMIC TYPE
        this.lanternImg = lanternImg;
        this.speed = speed;
        // first terrain (the furthest front, and lightest)
        this.terrainPoints1 = setupTerrain(width, height * 7 / 4, height / 4, 0.54);
        this.terrainPoints2 = setupTerrain(width, height, height / 4, 0.55);
        this.terrainPoints3 = setupTerrain(width, height * 3 / 4, height / 4, 0.56);
        this.lanterns = lanterns;
        this.offsets = [0, 0, 0]; // using an array since the terrains should move at different speeds

        // STATIC TYPE
        this.bgImage = lanternBg;

        // window data
        this.width = width;
        this.height = height;

        // state toggle button
        this.zapIcon = zapIcon;
        this.pictureIcon = pictureIcon;

        // location of the button
        this.buttonX = this.width / 2;
        this.buttonY = this.height * 3 / 4;

    }

    draw = (): void => {
        if (this.stateType === 'static') {
            // fill top level to be white
            // so we can see the navigation in spite of the darker background
            this.p5.background(255, 0);
            this.p5.strokeWeight(0);
            this.p5.fill(255);

            // once the width reaches less than 640px, the logo shrinks to 83px high.
            const height = this.width < 640 ? 83 : 100;
            this.p5.rect(0, 0, this.width, height);

            this.drawButton()
        } else {
            this.p5.background(255);

            this.p5.noStroke()

            this.updateLanterns(0);
            this.p5.fill(23, 34, 62); // darkest
            this.drawTerrain(this.terrainPoints3, this.offsets[0]);

            this.updateLanterns(1);
            this.p5.fill(25, 32, 100);
            this.drawTerrain(this.terrainPoints2, this.offsets[1]);

            this.updateLanterns(2);
            this.p5.fill(23, 62, 145); // lightest
            this.drawTerrain(this.terrainPoints1, this.offsets[2]);

            this.updateOffsets()

            this.drawButton()
        }
    }

    mousePressed = () => {
        if (this.p5.dist(this.p5.mouseX, this.p5.mouseY, this.buttonX, this.buttonY) < 50) {
            if (this.stateType === 'static') {
                this.stateType = 'dynamic';
            } else {
                this.stateType = 'static';
            }
        }
    }

    private drawTerrain = (points: number[], offset: number): void => {
        this.p5.beginShape();
        // bottom left corner - to ensure we shade in the shape correctly
        this.p5.vertex(0, this.p5.height);
        for (let x = offset; x < points.length + offset; x++) {
            this.p5.vertex(x - offset, points[Math.floor(x % points.length)]);
        }
        // bottom right corner - ensures we fill in the shape correctly
        this.p5.vertex(this.p5.width, this.p5.height);
        this.p5.endShape();
    }

    // can I use a for-loop? maybe put the terrainPoints in an array?
    // nah I'm too small brain B)
    private updateOffsets = (): void => {
        this.offsets[0] = (this.offsets[0] + this.speed * 0.5) % this.terrainPoints1.length
        this.offsets[1] = (this.offsets[1] + this.speed * 1) % this.terrainPoints2.length
        this.offsets[2] = (this.offsets[2] + this.speed * 1.5) % this.terrainPoints3.length
    }

    private updateLanterns = (idx: number): void => {
        for (let i = 0; i < this.lanterns[idx].length; i++) {
            this.lanterns[idx][i].move();
            this.lanterns[idx][i].draw();
        }
    }

    private drawButton = (): void => {
        this.p5.rectMode(this.p5.CENTER);
        this.p5.imageMode(this.p5.CENTER);

        // centered horizontally, 3/4 of the way down

        this.p5.fill(255);
        this.p5.circle(this.buttonX, this.buttonY, 50);

        switch (this.stateType) {
            case 'dynamic':
                this.p5.image(this.zapIcon, this.buttonX, this.buttonY);
                break;
            case 'static':
                this.p5.image(this.pictureIcon, this.buttonX, this.buttonY);
                break;
        }

        this.p5.imageMode(this.p5.CORNER);
        this.p5.rectMode(this.p5.CORNER);
    }
}




