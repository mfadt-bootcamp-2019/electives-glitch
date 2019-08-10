// Declare the image variable
PImage img;

void setup() {
	size(720, 500);
	img = loadImage("img/nimoy.png");
    image(img, 0, 0, 720, 500);
}

void draw() {
	// Built in processing function to load the pixels to an array,
	// which gets called "pixels"
	loadPixels();
	for (int i = 0; i < pixels.length; i++) {
		if (i % 17 == 0) {
			pixels[i] = color(255, 255, 10);
		}
		println(pixels[i]);
	}
	updatePixels();
	noLoop();
}
