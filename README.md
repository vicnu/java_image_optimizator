docker build -t {name_build} .
docker run -v ~{path}:/in -v ~/{path}:/out {name_build}
