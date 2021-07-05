/*
  width and height are the overall width and height we have to work with, displace is
  the maximum deviation value. This stops the terrain from going out of bounds if we choose
  code from this article: https://somethinghitme.com/2013/11/11/simple-2d-terrain-with-midpoint-displacement/
*/

function setupTerrain(width, height, displace, roughness){
    const points = [];
    // Gives us a power of 2 based on our width
    const power = Math.pow(2, Math.ceil(Math.log(width) / (Math.log(2))));

    // Set the initial left and right point 
    // we want them to be equal so we can wrap the terrain
    // const randHeight = height/2 + (Math.random()*displace*2) - displace;
    points[0] = height/2;
    points[power] = height/2;
    displace *= roughness;

    // Increase the number of segments
    for(let i = 1; i < power; i *=2){
        // Iterate through each segment calculating the center point
        for(let j = (power/i)/2; j < power; j+= power/i){
            points[j] = ((points[j - (power / i) / 2] + points[j + (power / i) / 2]) / 2);
            points[j] += (Math.random()*displace*2) - displace
        }
        // reduce our random range
        displace *= roughness;
    }
  
    console.log(points.length)
    return points;
}