
Run the container like so...

docker run --rm -it -e DISPLAY=${hostname}:0 -v ${PWD}:/home elmer bash

Build the image like this:

docker build --tag=elmer --platform=linux/amd64 .

