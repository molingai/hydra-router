VERSION_TAG=$(<VERSION)
cd ..
rm -rf node_modules
docker buildx build --platform=linux/amd64 -f Dockerfile.debug --no-cache=true --load -t hydra-router:$VERSION_TAG .


