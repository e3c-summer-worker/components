import * as lanternSrc from './assets/lantern.png'
import { State } from './State';

const sketch = (node: HTMLElement) => (p5: p5) => {
    let state: State;

    let lanternImg: p5.Image;

    p5.preload = () => {
        // path must be relative to the html file loading the sketch
        // https://p5js.org/reference/#/p5/loadImage
        // since loading an image online is a bit tricky, we just resort to a base64 representation of the image lol
        // https://stackoverflow.com/a/51162033
        console.log('Loading images:', { lanternSrc });
        lanternImg = p5.loadImage(lanternSrc);
    }


    p5.setup = () => {
        const { width, height } = node.getBoundingClientRect()
        console.log({ width, height })
        p5.createCanvas(width, height);

        state = new State({ p5, lanternImg, width, height, speed: 0.5 });
    }


    p5.draw = () => {
        p5.clear();
        state.draw();
    }

}

// exporting the sketch to use it as a namespace
// In production, we'll use it as `TerrainSketch.sketch()`
// see webpack.common.js to change the `TerrainSketch` name
export { sketch };
