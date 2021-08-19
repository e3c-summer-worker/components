import { Lantern } from './Lantern';
import { Particle } from './Particle';
import { setupTerrain } from './terrain'

const sketch = (node: HTMLElement) => (p5: p5) => {
    const speed = 0.5;
    let terrainPoints1: number[] = [];
    let terrainPoints2: number[] = [];
    let terrainPoints3: number[] = [];
    let offsets = [0, 0, 0]; // using an array since the terrains should move at different speeds

    // this is actually going to be a 2D list (3x5) - we have 5 lanterns behind each terrain
    let lanterns: Lantern[][] = []

    // retrieving a reference to the lantern image because loading it during the setup() function takes time
    // and we might get an error making the `img` undefined
    // this also prevents each of the lanterns from 
    let lanternImg: p5.Image;

    p5.preload = () => {
        // path must be relative to the html file loading the sketch
        // https://p5js.org/reference/#/p5/loadImage
        // since loading an image online is a bit tricky, we just resort to a base64 representation of the image lol
        // https://stackoverflow.com/a/51162033
        const imageSrc = 'data:image/png;base64,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'
        lanternImg = p5.loadImage(imageSrc);
    }


    p5.setup = () => {
        const { width, height } = node.getBoundingClientRect()
        console.log({ width, height })
        p5.createCanvas(width, height);

        // first terrain (the furthest front, and lightest)
        terrainPoints1 = setupTerrain(width, height * 7 / 4, height / 4, 0.54);
        // a bit higher
        terrainPoints2 = setupTerrain(width, height, height / 4, 0.55);
        // Highest
        terrainPoints3 = setupTerrain(width, height * 3 / 4, height / 4, 0.56);

        // add particles
        const numLanterns = Math.round(width / 150);
        for (let i = 0; i < 3; i++) {
            const terrainLanterns = []
            for (let j = 0; j < numLanterns; j++) {
                terrainLanterns.push(new Lantern(p5, lanternImg));
            }
            lanterns.push(terrainLanterns)
        }
    }


    p5.draw = function () {
        p5.background(255);

        p5.noStroke()

        updateLanterns(0);
        p5.fill(23, 34, 62); // darkest
        drawTerrain(terrainPoints3, offsets[0]);

        updateLanterns(1);
        p5.fill(25, 32, 100);
        drawTerrain(terrainPoints2, offsets[1]);

        updateLanterns(2);
        p5.fill(23, 62, 145); // lightest
        drawTerrain(terrainPoints1, offsets[2]);

        updateOffsets()

        //noLoop();
    }

    const drawTerrain = (points: number[], offset: number) => {
        p5.beginShape();
        // bottom left corner - to ensure we shade in the shape correctly
        p5.vertex(0, p5.height);
        for (let x = offset; x < points.length + offset; x++) {
            p5.vertex(x - offset, points[Math.floor(x % points.length)]);
        }
        // bottom right corner - ensures we fill in the shape correctly
        p5.vertex(p5.width, p5.height);
        p5.endShape();
    }

    // can I use a for-loop? maybe put the terrainPoints in an array?
    // nah I'm too small brain B)
    const updateOffsets = () => {
        offsets[0] = (offsets[0] + speed * 0.5) % terrainPoints1.length
        offsets[1] = (offsets[1] + speed * 1) % terrainPoints2.length
        offsets[2] = (offsets[2] + speed * 1.5) % terrainPoints3.length
    }

    const updateLanterns = (idx: number) => {
        for (let i = 0; i < lanterns[idx].length; i++) {
            lanterns[idx][i].move();
            lanterns[idx][i].draw();
        }
    }
}

// Namespace
// we'll use it as PolygonSketch.sketch
// see webpack.common.js to change the PolygonSketch name
export { sketch };
