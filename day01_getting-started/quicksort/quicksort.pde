// Declare the image variable
PImage img;

void setup() {
	size(720, 500);
	img = loadImage("img/nimoy.png");
    image(img, 0, 0, 720, 500);
    loadPixels();
}

void draw() {
	
}
