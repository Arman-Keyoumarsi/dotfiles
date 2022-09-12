# Build new image

docker login --username=rmaan
docker pull
docker images
docker image build -t rmaan/dotfiles:v1.2.0 . --no-cache
docker push rmaan/dotfiles:v1.2.0
