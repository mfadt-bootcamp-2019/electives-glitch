// We're importing the VIDEO library from processing
import processing.video.*;
// Declare a Movie variable, called movie
Movie movie;
Capture video;

int[] movieArray = new int[640 * 480];
int[] videoArray = new int[640 * 480];

// Our setup!
void setup() {
	size(640, 480);
	movie = new Movie(this, "video.mp4");
	movie.loop();
	video = new Capture(this, 640, 480);
	video.start();
}

// void captureEvent(Capture video) {
//   video.read();
// }

// Our draw!
void draw() {
	background(255);
	loadPixels();
	if (movie.available()) {    
		movie.read();  
	}
	if (video.available()) {
		video.read();
	}
	// Load the pixels of our movie file!
	movie.loadPixels();
	arrayCopy(movie.pixels, movieArray);
	// Load the pixels of our video file!
	video.loadPixels();
	arrayCopy(video.pixels, videoArray);
	for (int x = 0; x < width; x++) {
		for (int y = 0; y < height; y++) {
			// Get the Flattened Number
			int flattenedNumber = x + (y * width);
			// If the current pixel in our movie (the mp4)
			// is greater than that in the video (our webcam)
			// than display the movie pixel,
			// otherwise display the video pixel
			if (movieArray[flattenedNumber] >= videoArray[flattenedNumber]) {
				pixels[flattenedNumber] = movieArray[flattenedNumber];
			} else {
				pixels[flattenedNumber] = videoArray[flattenedNumber];
			}
			// Glitch every single pixel
			pixels[flattenedNumber] *= 1.05;
		}
	}
	// Call update, to remind processing to update the pixels in movie
	movie.updatePixels();
	video.updatePixels();
	updatePixels();
}
