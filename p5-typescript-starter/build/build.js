var numberOfShapesControl,ColorHelper=function(){function u(){}return u.getColorVector=function(o){return createVector(red(o),green(o),blue(o))},u.rainbowColorBase=function(){return[color("red"),color("orange"),color("yellow"),color("green"),color(38,58,150),color("indigo"),color("violet")]},u.getColorsArray=function(o,r){for(var e=this,n=(r=null==(r=void 0===r?null:r)?u.rainbowColorBase():r).map(function(o){return e.getColorVector(o)}),t=new Array,i=0;i<o;i++){var l=i/o*(n.length-1),a=Math.floor(l),a=this.getColorByPercentage(n[a],n[a+1],l-a);t.push(color(a.x,a.y,a.z))}return t},u.getColorByPercentage=function(o,r,e){return o=o.copy(),e=r.copy().sub(o).mult(e),o.add(e)},u}(),PolygonHelper=function(){function o(){}return o.draw=function(o,r){push();var e=TWO_PI/o,n=r/2;beginShape();for(var t=0;t<TWO_PI;t+=e){var i=cos(t)*n,l=sin(t)*n;vertex(i,l)}endShape(CLOSE),pop()},o}();function setup(){console.log("🚀 - Setup initialized - P5 is running"),createCanvas(windowWidth,windowHeight),rectMode(CENTER).noFill().frameRate(30),numberOfShapesControl=createSlider(1,30,15,1).position(10,10).style("width","100px")}function windowResized(){resizeCanvas(windowWidth,windowHeight)}function draw(){background(0),translate(width/2,height/2);for(var o=numberOfShapesControl.value(),r=ColorHelper.getColorsArray(o),e=frameCount/(30*o)*2,n=0;n<o;n++){push();var t=e*(o-n),i=3+n,l=40*n;strokeWeight(8),stroke(r[n]),rotate(t),PolygonHelper.draw(i,l),pop()}}