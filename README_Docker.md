### Docker CE
If one has already installed the docker version shipped with the standard ubuntu package repositories, please de-install.

First of all the correct docker version has to be installed, to do this, follow the following step by step instructions:

1. Install curl (if not already done)
```bash
$ sudo apt install curl
```
2. Install the docker repositroy key: 
```bash
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
3. Install the repository:
```bash
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable"
```

4. Update repositories and install docker_ce:
```bash
$ sudo apt update
$ sudo apt install docker-ce
```

After that, you need to install NVIDIA Docker 2.

### NVIDIA Docker (2)

Note: This requires to have the current NVIDIA driver installed, ubuntu is not updating major versions, check your 
package manager for the latest main package of the driver. When this document was written (30.11.2018) the latest version
in the standard ubuntu package repositories was: nvidia-driver-390

The following script (or each command by copying it to a terminal) can be used to install the nvidia docker 2. Original Repo and installation instructions can be found
here: https://github.com/NVIDIA/nvidia-docker

```bash
# Add the package repositories
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt update && sudo apt install nvidia-container-toolkit
sudo systemctl restart docker
```

### Restart and convenience 
Before restarting the machine (which is recommandet since the kernel modules have to be properly loaded), you should add yourself to the docker group, so you can run docker commands without being root.
```bash
$ sudo adduser $(id -un) docker
```

Finally restart your machine to make sure everything is up and running correctly. Now you are ready to use docker! ;)

### Using DFKI registry
If you want to use the image generated by the docker build from this repository, you can also use the already build image from the DFKI registry server.

This has three prerequisites:
1. install the docker credential helper:
```bash
$ sudo apt install golang-docker-credential-helpers
```
(For ubuntu 16.04 and older this is not a package and has to be grabbed from https://github.com/docker/docker-credential-helpers/releases, install the bin in /usr/bin using the one containing "secretservice" in it's name.)

2. Set up docker to use the credential helper:
Open the file ~/.docker/config.json (or create it if it doesn't exist), and put the following content in it:
```json
{
        "credsStore": "secretservice"
}
```
3. Now login to the DFKI registry server via:
```bash
$ docker login d-reg.hb.dfki.de
```
Now you can pull this image from the docker registry by using the following in your Dockerfile:
```bash
FROM d-reg.hb.dfki.de/rosbasic/16.04:latest
```

To directly generate a container with this image, by downloading it from the Registry (not necessary to build it
yourself) just download the "docker-run.sh" script from this repository and execute it. As minimal parameter it takes
as a first argument the path to the shared folder (used as workspace in the container) on your host.