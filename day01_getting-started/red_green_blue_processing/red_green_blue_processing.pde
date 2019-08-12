PImage img;

void setup() {
	size(720, 500);
	noStroke();
	img = loadImage("img/nimoy.png");
	// setting the image to fill up the whole canvas
    image(img, 0, 0, 720, 500);
    runPixelLoopOnce();
}

void draw() {
	loadPixels();
	updatePixels();
}

void runPixelLoopOnce() {
	loadPixels();
	for (int x = 0; x < width; x++) {
		for (int y = 0; y < height; y++) {
			// Find out the pixel number we are at
			int flattenedNumber = x + (y * width);
			// This code makes every 69th pixel yellow
			// we're just doing this for fun :)
			if (red(pixels[flattenedNumber]) >= 200) {
				pixels[flattenedNumber] *= 0.25;
			} else if (green(pixels[flattenedNumber]) >= 200) {
				pixels[flattenedNumber] *= 0.5;
			} else if (blue(pixels[flattenedNumber]) >= 200) {
				pixels[flattenedNumber] *= 0.75;
			}
		}
	}
	// Call to updatePixels (since we changed some to yellow)
	updatePixels();
}
