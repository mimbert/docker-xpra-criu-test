Test of checkpointing a container running an xpra server
========================================================

Steps of the test
-----------------

* enable docker experimental features

* `make build`

  Builds the image

* `make start`

  Starts the container

* `make connect`

  Connect to xpra: The xpra client runs directly on workstation and
  connects through tcp to the xpra server inside the container. Enter
  some numbers in xcalc...

* `make checkpoint`

  Checkpoints and stops the container.
  
* `make restart`

  Restarts the container from the checkpoint

* `make connect`

  Should find xcalc in the same state we left it in.

* `make logs`

  Show the container logs
