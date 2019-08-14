// Declare the image variable
PImage img;
int counter;

// Our setup function weeee!!!!
void setup() {
	size(1440, 1000);
	noStroke();
	img = loadImage("img/nimoy.png");
	// setting the image to fill up the whole canvas
    image(img, 0, 0, width, height);
    // Hide the canvas! we don't care we just
    // want to save frames
    frame.setVisible( false );
}

// Our draw function yayyyy!!!
void draw() {
	loadPixels();
	for (int x = 0; x < width; x++) {
		for (int y = 0; y < height; y++) {
			// Find out the pixel number we are at
			int flattenedNumber = x + (y * width);
			pixels[flattenedNumber] *= map(counter, 0, 9, 0.9, 1.1);
		}
	}
	updatePixels();
	if (counter < 10) {
		String filename = "img/test-" + counter + ".jpg";
        save(filename);
	} else {
		exit();
	}
	counter++;
}
