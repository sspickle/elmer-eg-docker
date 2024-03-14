ElmerGUI Docker
---------------

I tried to use [elmerfem-docker](https://github.com/ElmerCSC/elmerfem-docker) to run a dockerized version of Elmer on my Mac but I ran into various problems, so I cooked up this Dockerfile. It seems that the ubunutu packages work best on AMD64, so I specified that in the docker build. Anyway, this is working for me to run ElmerGUI

Run the container like so...

1. Launch XQuartz
2. Run `xhost + ${hostname}`
3. docker run --rm -it -e DISPLAY=${hostname}:0 -v ${PWD}:/home elmer bash

Then you'll be in the `/home` directory of the ubuntu container, but the contents of the current directory on the mac will be mapped there.

You can run `pyelmer` files by activating the virtual environment:

1. `. ~/venv/bin/activate`
2. `python pyelmer_example.py`

Build the image like this:

docker build --tag=elmer --platform=linux/amd64 .

