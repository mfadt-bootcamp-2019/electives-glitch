// Declare the image variable
PImage img;

// Our setup function weeee!!!!
void setup() {
	size(720, 500);
	noStroke();
	img = loadImage("img/nimoy.png");
	// setting the image to fill up the whole canvas
    image(img, 0, 0, 720, 500);
    runPixelLoopOnce();
}

// Our draw function yayyyy!!!
// all we do here is constantly reload our pixels and update them,
// in case we make any changes (we are making changes in mouseReleased() below)
void draw() {
	loadPixels();
	updatePixels();
}

// Function we created to call once to show you all
// how to load pixel data and manipulate it
void runPixelLoopOnce() {
	// Built in processing function to load the pixels on the canvas to an array,
	// which gets called "pixels"
	loadPixels();
	for (int x = 0; x < width; x++) {
		for (int y = 0; y < height; y++) {
			// Find out the pixel number we are at
			int flattenedNumber = x + (y * width);
			// This code makes every 69th pixel yellow
			// we're just doing this for fun :)
			if (flattenedNumber % 17 == 0) {
				pixels[flattenedNumber] = color(255, 255, 10);
			}
			// We're printing out the value of calling pixels[flattenedNumber]
			// and the value of calling get(x, y)
			// (HOT TIP: THEY ARE THE SAME FUCKING THING!!!!!)
			println("Printing the value of pixels[",flattenedNumber,"]:", pixels[flattenedNumber]);
			println("Printing the value of get(",x,",",y,"):", get(x, y));
			// Print out the red, green, and blue values for each pixel
			println("Printing out the red, green, and blue values of pixel",flattenedNumber,red(flattenedNumber),green(flattenedNumber),blue(flattenedNumber));
		}
	}
	// Call to updatePixels (since we changed some to yellow)
	updatePixels();
}

// We want to draw a rectangle and fill it
// with the color of the pixel of where we click
void mouseReleased() {
	int flattenedNumber = mouseX + (mouseY * width);
	loadPixels();
	color c = pixels[flattenedNumber];
	fill(c);
	rect(width/2 - 100, height/2 - 100, 200, 200);
}
