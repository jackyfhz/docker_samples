#!/bin/bash

sudo docker run -it --rm --network=bridge --cap-add NET_ADMIN --cap-add NET_RAW -e DISPLAY=$DISPLAY -v $PWD:$PWD -w $PWD net_test /bin/bash
