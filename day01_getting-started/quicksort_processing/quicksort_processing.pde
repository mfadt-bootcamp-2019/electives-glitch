// Declare the image variable
PImage img;
int counter = 0;

// Set the canvas size, load the pixels, etc.
void setup() {
	size(720, 500);
	img = loadImage("img/nimoy.png");
    image(img, 0, 0, 720, 500);
    loadPixels();
}

// Do nothing here
void draw() {
	
}

// This is where me make calls to do anything,
// if we never click the mouse nothing happens
void mouseReleased() {
	float x = constrain(mouseX, 1, width);
    float y = constrain(mouseY, 1, height);
    int jumpValue = floor(sqrt(y * width + x));
    glitchIt(jumpValue);
}

// When we press the enter key,
// take a photo of the screen and save it
void keyReleased() {
    if (key == ENTER || key == RETURN) {
        String filename = "img/quicksort-" + counter + ".jpg";
        save(filename);
        counter++;
    }
}

// This is the function where we we make calls to quicksort
// up until the size of our "jump"
void glitchIt(int jump) {
    image(img, 0, 0, 1200, 800);
    loadPixels();
    float maxPixels = (width * height) - (jump+  1);
    for (int x = 0; x < maxPixels; x += jump) {
        quicksort(pixels, x, x + jump);
    }
    updatePixels();
}

// Quicksort is a common sorting algorithm
// https://en.wikipedia.org/wiki/Quicksort
void quicksort(int x[], int left, int right) {
    int index = partition(x, left, right);
    if (left < index - 1) {
        quicksort(x, left, index - 1);
    }
    if (index < right) {
        quicksort(x, index, right);
    }
}

// This is a helper function for quicksort
int partition(int x[], int left, int right) {
    int i = left;
    int j = right;
    int temp;
    int pivot = x[(left + right)/2];
    while (i <= j) {
        while (x[i] < pivot) {
            i++;
        }
        while (x[j] > pivot) {
            j--;
        }
        if (i <= j) {
            temp = x[i];
            x[i] = x[j];
            x[j] = temp;
            i++;
            j--;
        }
    }
    return i;
}
