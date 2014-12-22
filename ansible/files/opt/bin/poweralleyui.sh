#!/bin/bash

source /opt/mono-3.2.8/env.rc
fastcgi-mono-server4 /applications=/power:/opt/poweralleyui/ /socket=tcp:127.0.0.1:8877 /verbose
