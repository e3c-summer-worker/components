import * as p5 from 'p5'

export class PolygonHelper {
    p: p5;
    constructor(p: p5) {
        this.p = p;
    }

    public draw(numberOfSides: number, width: number) {
        this.p.push();
        const angle = this.p.TWO_PI / numberOfSides;
        const radius = width / 2;
        this.p.beginShape();
        for (let a = 0; a < this.p.TWO_PI; a += angle) {
            let sx = this.p.cos(a) * radius;
            let sy = this.p.sin(a) * radius;
            this.p.vertex(sx, sy);
        }
        this.p.endShape(this.p.CLOSE);
        this.p.pop();
    }
}
