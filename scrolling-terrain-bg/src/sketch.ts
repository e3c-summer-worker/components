import * as lanternBgSrc from './assets/lantern-bg.jpeg'
import * as lanternSrc from './assets/lantern.png'
import * as zapIconSrc from './assets/zap-icon.svg'
import * as pictureIconSrc from './assets/picture-icon.svg'
import { State } from './State';

const sketch = (node: HTMLElement) => (p5: p5) => {
    let state: State;

    let lanternImg: p5.Image;
    let lanternBg: p5.Image;

    // svg icons
    let zapIcon: p5.Image;
    let pictureIcon: p5.Image;

    p5.preload = () => {
        // path must be relative to the html file loading the sketch
        // https://p5js.org/reference/#/p5/loadImage
        // since loading an image online is a bit tricky, we just resort to a base64 representation of the image lol
        // https://stackoverflow.com/a/51162033
        console.log('Loading images:', { lanternSrc, lanternBgSrc, zapIconSrc, pictureIconSrc });
        lanternImg = p5.loadImage(lanternSrc);
        lanternBg = p5.loadImage(lanternBgSrc);

        zapIcon = p5.loadImage(zapIconSrc);
        pictureIcon = p5.loadImage(pictureIconSrc);
    }


    p5.setup = () => {
        const { width, height } = node.getBoundingClientRect()
        console.log({ width, height })
        p5.createCanvas(width, height);

        state = new State({ p5, lanternImg, lanternBg, zapIcon, pictureIcon, width, height, speed: 0.5 });
    }


    p5.draw = () => {
        p5.clear();
        state.draw();
    }

}

// Namespace
// we'll use it as PolygonSketch.sketch
// see webpack.common.js to change the PolygonSketch name
export { sketch };
