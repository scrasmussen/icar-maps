# local port number
port=3000

all: rundocker

rundocker: cleandocker builddocker
	docker run --entrypoint "/bin/sh" -it -p ${port}:${port} --name runfoobar foobar

# install nodejs dependencies and run
run:
	npm run dev

build:
	npm install .

# build and clean docker images
builddocker:
	docker build -t foobar .

cleandocker:
	-docker rm runfoobar

clean:
	rm -f *~

cleanall: clean
	rm -rf node_modules .next

# runcached:
# 	docker run -it -p ${port}:${port} --name runfoobar foobar
# 	docker run -t -d -p ${port}:${port} --name runfoobar foobar
# 	docker run -t -d --name runfoobar foobar
