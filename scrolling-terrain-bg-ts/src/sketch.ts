import { Particle } from './Particle';
import { setupTerrain } from './terrain'

const sketch = (node: HTMLElement) => (p5: p5) => {
    const speed = 0.5;
    let terrainPoints1: number[] = [];
    let terrainPoints2: number[] = [];
    let terrainPoints3: number[] = [];
    let offsets = [0, 0, 0]; // using an array since the terrains should move at different speeds

    // I use 'particles' instead of lanterns because I can't draw lanterns LOL
    // this is actually going to be a 2D list (3x5) - we have 5 lanterns behind each terrain
    let particles: Particle[][] = []

    p5.setup = () => {
        const { width, height } = node.getBoundingClientRect()
        p5.createCanvas(width, height);

        // first terrain (the furthest front, and lightest)
        terrainPoints1 = setupTerrain(width, height * 7 / 4, height / 4, 0.54);
        // a bit higher
        terrainPoints2 = setupTerrain(width, height, height / 4, 0.55);
        // Highest
        terrainPoints3 = setupTerrain(width, height * 3 / 4, height / 4, 0.56);

        // add particles

        for (let i = 0; i < 3; i++) {
            const terrainParticles = []
            for (let j = 0; j < 5; j++) {
                terrainParticles.push(new Particle(p5));
            }
            particles.push(terrainParticles)
        }
    }


    p5.draw = function () {
        p5.background(255);

        p5.noStroke()

        updateParticles(0);
        p5.fill(0)
        drawTerrain(terrainPoints3, offsets[0]);

        updateParticles(1);
        p5.fill(100)
        drawTerrain(terrainPoints2, offsets[1]);

        updateParticles(2);
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
        offsets[0] = (offsets[0] + speed * 0.8) % terrainPoints1.length
        offsets[1] = (offsets[1] + speed * 1) % terrainPoints1.length
        offsets[2] = (offsets[2] + speed * 1.2) % terrainPoints1.length
    }

    const updateParticles = (idx: number) => {
        for (let i = 0; i < particles[idx].length; i++) {
            particles[idx][i].createParticle();
            particles[idx][i].moveParticle();
        }
    }
}

// Namespace
// we'll use it as PolygonSketch.sketch
// see webpack.common.js to change the PolygonSketch name
export { sketch };