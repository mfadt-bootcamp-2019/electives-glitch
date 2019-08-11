int numLayers = 4; // smaller values = bigger blobs
int speed = 30; // smaller values = faster animation
int standardWidth = 800;
int standardHeight = 600;
PImage img1;
PImage img2;
int[] array1 = new int[standardWidth*standardHeight];
int[] array2 = new int[standardWidth*standardHeight];

void setup() {
	size(800, 600);
	img1 = loadImage("img/cat.png");
	image(img1, 0, 0, width, height);
	loadPixels();
	arrayCopy(pixels, array1);
	img2 = loadImage("img/vapor.png");
	image(img2, 0, 0, width, height);
	loadPixels();
	arrayCopy(pixels, array2);
}

void draw() {
	float layerHeight = 1.0/numLayers;
	loadPixels();
	for (int y=0; y<height; y++) {
		for (int x=0; x<width; x++) {
			float noiseVal = noise(x*.015, y*.015);
			color color0 = color(array1[(y*width)+x]);
			color color1 = color(array2[(y*width)+x]);
			color thisColor = color0;
			float noiseBump = lerp(0, layerHeight, (frameCount % speed)/(1.0*speed));
			int whichColor = int((noiseVal+noiseBump)/layerHeight);
			int startingColor = (((frameCount/speed) % 2) == 0) ? 0 : 1;
			if (((whichColor+startingColor) % 2) == 0) {
				thisColor = color0;
			} else {
				thisColor = color1;
			}
			pixels[(y*width)+x] = thisColor;
		}
	}
	updatePixels();
}
