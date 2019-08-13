// Create Two image variables, img2 and img2
PImage img1;
PImage img2;
// Create two empty arrays that are the same size as our images
int[] array1 = new int[800 * 500];
int[] array2 = new int[800 * 500];

// Our setup function
void setup() {
	// Set up the size of the canvas
	size(800, 500);
	// Declare img1,
	// 	// Put it on the canvas with the image(img2...) call,
	// Load the Pixels,
	// Put the loaded pixels into our empty array that is the same size as the pixel array.
	img1 = loadImage("img/cats1.jpg");
	image(img1, 0, 0, width, height);
	loadPixels();
	arrayCopy(pixels, array1);
	// Declare img2,
	// Put it on the canvas with the image(img2...) call,
	// Load the Pixels,
	// Put the loaded pixels into our empty array that is the same size as the pixel array.
	img2 = loadImage("img/cats2.jpg");
	image(img2, 0, 0, width, height);
	loadPixels();
	arrayCopy(pixels, array2);
}

// Our draw function
void draw() {
	// We load the pixels currently on the screen,
	// because we want to change these
	loadPixels();
	// Loop through every pixel on our canvas
	for (int x = 0; x < width; x++) {
		for (int y = 0; y < height; y++) {
			// Get the "flattened number", the location in our pixel arrays
			// where the (x, y) position we're currently at is located
			int flattenedNumber = x + (y * width);
			// If the green value at our current pixel is greater in array1 than array2
			// we set the pixel in the canvas equal to the pixel in array1
			if (green(array1[flattenedNumber]) >= green(array2[flattenedNumber])) {
				pixels[flattenedNumber] = array1[flattenedNumber];
			} else { // otherwise we set the pixel in the canvas equal to the pixel in array2
				pixels[flattenedNumber] = array2[flattenedNumber];
				pixels[flattenedNumber] *= 1.05;
			}
		}
	}
	updatePixels();
	noLoop();
}
