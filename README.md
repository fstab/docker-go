docker-go
=========

Test [go](https://golang.org) programs in a Linux container.

Run from Docker Hub
-------------------

The [fstab/go](https://registry.hub.docker.com/u/fstab/go) image contains a [go](https://golang.org) build environment and can be used to compile and run [go](https://golang.org) applications in a Linux container.

If the `GOPATH` environment variable is set correctly on the host system, [fstab/go](https://registry.hub.docker.com/u/fstab/go) can be run as follows:

```bash
docker run -v $GOPATH:/home/go -t -i fstab/go
```

This will launch a shell in the container, with the `go` command available and the `GOPATH` mapped to `/home/go`.

Build from Source
-----------------

1. Clone [fstab/docker-go](https://github.com/fstab/docker-go) from GitHub.

   ```bash
   git clone https://github.com/fstab/docker-go.git
   ```
2. Build the docker image

   ```bash
   cd docker-go
   docker build -t="fstab/go" .
   ```

3. Run with the same command as described above.

   ```bash
   docker run -v $GOPATH:/home/go -t -i fstab/go
   ```
