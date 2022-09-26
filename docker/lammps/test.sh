IMAGE=debeshmandal/md8s-lammps:test
docker build -t $IMAGE .
docker run -v $(pwd):/home --rm $IMAGE -i test.input.lammps
docker image rm $IMAGE