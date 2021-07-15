import * as p5 from 'p5'
import { ColorHelper } from './ColorHelper'
import { PolygonHelper } from './PolygonHelper'

const sketch = (p: p5) => {
    // GLOBAL VARS & TYPES
    let numberOfShapesControl: p5.Element;
    const polygonHelper: PolygonHelper = new PolygonHelper(p);
    const colorHelper: ColorHelper = new ColorHelper(p);


    // P5 WILL AUTOMATICALLY USE GLOBAL MODE IF A DRAW() FUNCTION IS DEFINED
    p.setup = () => {
        console.log("🚀 - Setup initialized - P5 is running");

        p.createCanvas(p.windowWidth, p.windowHeight)
        p.rectMode(p.CENTER).noFill().frameRate(30);
        // NUMBER OF SHAPES SLIDER
        numberOfShapesControl = p.createSlider(1, 30, 15, 1).position(10, 10).style("width", "100px");
    }

    // p5 WILL AUTO RUN THIS FUNCTION IF THE BROWSER WINDOW SIZE CHANGES
    p.windowResized = () => {
        p.resizeCanvas(p.windowWidth, p.windowHeight);
    }

    // p5 WILL HANDLE REQUESTING ANIMATION FRAMES FROM THE BROWSER AND WIL RUN DRAW() EACH ANIMATION FROME
    p.draw = () => {

        // CLEAR BACKGROUND
        p.background(0);

        // CENTER OF SCREEN
        p.translate(p.width / 2, p.height / 2);

        const numberOfShapes = <number>numberOfShapesControl.value();
        const colours = colorHelper.getColorsArray(numberOfShapes);

        // CONSISTENT SPEED REGARDLESS OF FRAMERATE
        const speed = (p.frameCount / (numberOfShapes * 30)) * 2;

        // DRAW ALL SHAPES
        for (let i = 0; i < numberOfShapes; i++) {
            p.push()
            const lineWidth = 8;
            const spin = speed * (numberOfShapes - i);
            const numberOfSides = 3 + i;
            const width = 40 * i;
            p.strokeWeight(lineWidth);
            p.stroke(colours[i]);
            p.rotate(spin);
            polygonHelper.draw(numberOfSides, width)
            p.pop();
        }
    }
}



const Sketch = {
    initialize: function (node: HTMLElement) {
        new p5(sketch, node);
        console.log('Sketch started!')
    }
}


export default Sketch;