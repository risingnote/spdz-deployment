	#!/bin/bash

  docker run -it -u `id -u $USER` --rm -v $(pwd):/home/spdzuser/spdz/keys spdz/spdz-keymaterial