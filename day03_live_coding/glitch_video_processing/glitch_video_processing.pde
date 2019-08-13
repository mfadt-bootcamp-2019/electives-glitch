// We're importing the VIDEO library from processing
import processing.video.*;
// Declare a Movie variable, called movie
Movie movie;

// Our setup!
void setup() {
	size(640, 480);
	movie = new Movie(this, "video.mp4");
	movie.loop();
}

// Our draw!
void draw() {
	background(255);
	if (movie.available()) {    
		movie.read();  
	}
	// Load the pixels of our movie file!
	movie.loadPixels();
	for (int x = 0; x < width; x++) {
		for (int y = 0; y < height; y++) {
			// Get the Flattened Number
			int flattenedNumber = x + (y * width);
			// Apply some random glitch to the pixels!
			movie.pixels[flattenedNumber] *= 1.002;
		}
	}
	// Call update, to remind processing to update the pixels in movie
	movie.updatePixels();
	// Draw movie to the screen!
	image(movie, 0, 0);
}
