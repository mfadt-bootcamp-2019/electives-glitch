// Create Two image variables, img2 and img2
PImage img1;
PImage img2;
// Create two empty arrays that are the same size as our images
int[] array1 = new int[800 * 600];
int[] array2 = new int[800 * 600];

// Our setup function
void setup() {
	// Set up the size of the canvas
	size(800, 600);
	// Declare img1,
	// 	// Put it on the canvas with the image(img2...) call,
	// Load the Pixels,
	// Put the loaded pixels into our empty array that is the same size as the pixel array.
	img1 = loadImage("img/cat.png");
	image(img1, 0, 0, width, height);
	loadPixels();
	arrayCopy(pixels, array1);
	// Declare img2,
	// Put it on the canvas with the image(img2...) call,
	// Load the Pixels,
	// Put the loaded pixels into our empty array that is the same size as the pixel array.
	img2 = loadImage("img/vapor.png");
	image(img2, 0, 0, width, height);
	loadPixels();
	arrayCopy(pixels, array2);
}

// Our draw function
void draw() {
	loadPixels();
	for (int x = 0; x < width; x++) {
		for (int y = 0; y < height; y++) {
			int flattenedNumber = x + (y * width);
			if (green(array1[flattenedNumber]) >= green(array2[flattenedNumber])) {
				pixels[flattenedNumber] = array1[flattenedNumber];
			} else {
				pixels[flattenedNumber] = array2[flattenedNumber];
			}
		}
	}
	updatePixels();
	noLoop();
}
