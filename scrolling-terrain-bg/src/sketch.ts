import { Lantern } from './Lantern';
import { Particle } from './Particle';
import { setupTerrain } from './terrain'
import * as lanternBgSrc from './assets/lantern-bg.jpeg'
import * as lanternSrc from './assets/lantern.png'
import { State } from './State';

const sketch = (node: HTMLElement) => (p5: p5) => {
    let state: State;

    let lanternImg: p5.Image;
    let lanternBg: p5.Image;

    p5.preload = () => {
        // path must be relative to the html file loading the sketch
        // https://p5js.org/reference/#/p5/loadImage
        // since loading an image online is a bit tricky, we just resort to a base64 representation of the image lol
        // https://stackoverflow.com/a/51162033
        console.log('Loading: ', lanternSrc, lanternBgSrc);
        lanternImg = p5.loadImage(lanternSrc);
        lanternBg = p5.loadImage(lanternBgSrc);
    }


    p5.setup = () => {
        const { width, height } = node.getBoundingClientRect()
        console.log({ width, height })
        p5.createCanvas(width, height);

        state = new State({ p5, lanternImg, lanternBg, width, height, speed: 0.5 });
    }


    p5.draw = function () {
        state.draw();
    }

}

// Namespace
// we'll use it as PolygonSketch.sketch
// see webpack.common.js to change the PolygonSketch name
export { sketch };
