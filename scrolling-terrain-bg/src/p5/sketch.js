// 1D Terrain Generation using Midpint Displacement
const speed = 0.5;
let terrainPoints1 = [];
let terrainPoints2 = [];
let terrainPoints3 = [];
let offsets = [0, 0, 0]; // using an array since the terrains should move at different speeds

// I use 'particles' instead of lanterns because I can't draw lanterns LOL
// this is actually going to be a 2D list (3x5) - we have 5 lanterns behind each terrain
let particles = []

function setup() {
    // figure out the width and height of the thumbnail, and then set the canvas to the same size
    const thumbnail = document.getElementById('thumbnail');
    const rect = thumbnail.getBoundingClientRect();
    console.log({ rect });
    const myCanvas = createCanvas(rect.width, rect.height);

    // before we set the parent, remove the image behind the figure
    const img = document.querySelector("#thumbnail > img");
    img.remove();
    myCanvas.parent('thumbnail');

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
            terrainParticles.push(new Particle());
        }
        particles.push(terrainParticles)
    }
}

function draw() {
    background(255);

    noStroke()

    updateParticles(0);
    fill(0)
    drawTerrain(terrainPoints3, offsets[0]);

    updateParticles(1);
    fill(100)
    drawTerrain(terrainPoints2, offsets[1]);

    updateParticles(2);
    fill(200);
    drawTerrain(terrainPoints1, offsets[2]);

    updateOffsets()

    //noLoop();
}

function drawTerrain(points, offset) {
    beginShape();
    // bottom left corner - to ensure we shade in the shape correctly
    vertex(0, height);
    for (let x = offset; x < points.length + offset; x++) {
        vertex(x - offset, points[Math.floor(x % points.length)]);
    }
    // bottom right corner - ensures we fill in the shape correctly
    vertex(width, height);
    endShape();
}

// can I use a for-loop? maybe put the terrainPoints in an array?
// nah I'm too small brain B)
function updateOffsets() {
    offsets[0] = (offsets[0] + speed * 0.8) % terrainPoints1.length
    offsets[1] = (offsets[1] + speed * 1) % terrainPoints1.length
    offsets[2] = (offsets[2] + speed * 1.2) % terrainPoints1.length
}

function updateParticles(idx) {
    for (let i = 0; i < particles[idx].length; i++) {
        particles[idx][i].createParticle();
        particles[idx][i].moveParticle();
    }
}