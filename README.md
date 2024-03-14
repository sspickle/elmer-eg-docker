ElmerGUI Docker
---------------

This project contains a Dockerfile and instructions that support running `ElmerGUI` in a docker container with the X11 GUI running on the host (e.g., X-Quartz on MacOS (ARM or Intel?). While it hasn't been tested, it should also work on Windows or Linux.

I tried to use [elmerfem-docker](https://github.com/ElmerCSC/elmerfem-docker) to run a dockerized version of Elmer on my Mac but I ran into various problems, so I cooked up this Dockerfile. It seems that the ubunutu packages work best on AMD64, so I specified that in the docker build. Anyway, this is working for me to run ElmerGUI

Run the container like so...

    1. Launch XQuartz
    2. export HOSTNAME=`hostname`
    3. Run xhost + ${HOSTNAME}
    3. docker run --rm -it -e DISPLAY=${HOSTNAME}:0 -v ${PWD}:/home elmer-eg bash

Then you'll be in the `/home` directory of the ubuntu container, but the contents of the current directory on the mac will be mapped there.

You can run `pyelmer` and `circuitbuilder` python modules by activating the prepared virtual environbment, e.g.:

    1. `. ~/venv/bin/activate`
    2. `python pyelmer_example.py`

Build the image like this:

    docker build --tag=elmer-eg --platform=linux/amd64 .

The elmer ubuntu packages don't see to work on ARM yet, so I specify amd.

You can also use the docker-compose.yml file. Make sure you `export HOSTNAME=...` first!

