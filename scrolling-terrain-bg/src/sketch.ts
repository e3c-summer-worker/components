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

    p5.setup = () => {
        const { width, height } = node.getBoundingClientRect()
        console.log(width, height)
        p5.createCanvas(width, height);

        // first terrain (the furthest front, and lightest)
        terrainPoints1 = setupTerrain(width, height * 7 / 4, height / 4, 0.54);
        // a bit higher
        terrainPoints2 = setupTerrain(width, height, height / 4, 0.55);
        // Highest
        terrainPoints3 = setupTerrain(width, height * 3 / 4, height / 4, 0.56);

        // add particles

        for (let i = 0; i < 3; i++) {
            const terrainLanterns = []
            for (let j = 0; j < 5; j++) {
                terrainLanterns.push(new Lantern(p5));
            }
            lanterns.push(terrainLanterns)
        }
    }


    p5.draw = function () {
        p5.background(255);

        p5.noStroke()

        updateLanterns(0);
        p5.fill(0)
        drawTerrain(terrainPoints3, offsets[0]);

        updateLanterns(1);
        p5.fill(100)
        drawTerrain(terrainPoints2, offsets[1]);

        updateLanterns(2);
        p5.fill(200);
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