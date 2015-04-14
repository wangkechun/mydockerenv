run :
	docker run -i -t --rm learn/3

build :
	docker build -t learn/3 . 

all : build run