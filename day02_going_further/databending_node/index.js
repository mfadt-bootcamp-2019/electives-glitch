'use strict';

// Require FS, which is node filesystem
const fs = require('fs');

class DataBend {
	constructor(path, fileName, incrementer) {
		// Make the output directory if it isn't there yet
		if (!fs.existsSync('output')){
			fs.mkdirSync('output');
		}
		fs.readFile(`${path}/${fileName}`, (err, buf) => {
			if (err) throw err;
			for (let i = 0; i < 100; i++) {
				let chunkSize = incrementer + 1;
				let ranByte1 = Math.floor(Math.random() * buf.length);
				let ranByte2 = Math.floor(Math.random() * buf.length);
				for (let j = 0; j < chunkSize; j++) {
					let temp = buf[ranByte1 + j];
					buf[ranByte1 + j] = buf[ranByte2 + j];
					buf[ranByte2 + j] = temp;
				}
			}
			fs.writeFileSync(`output/${incrementer}-${fileName}`, buf, (err) => {
				if (err) throw err;
			});
		});
	}
}

for (let i = 0; i < 100; i++) {
	new DataBend('img', 'bob.jpg', i);
}
