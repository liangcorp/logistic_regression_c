CC = gcc

all:
	mkdir -p bin libs
	${CC} -Wall -g -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./libs/libreaddata.so
	${CC} -Wall -g -fPIC ./src/logistic_regression/cost_function.c -I ./src/include/ -shared -o ./libs/liblrcostfn.so
	${CC} -Wall -g -fPIC ./src/logistic_regression/gradient_descent.c -I ./src/include/ -shared -o ./libs/liblrgrades.so
	${CC} -Wall -g -o ./bin/feature_scale -lm ./src/feature_scale.c
	${CC} -Wall -g -I ./libs/ -I ./src/include/ -c ./src/main.c -o ./libs/logistic_regression.o
	${CC} -Wall -g -o ./bin/logistic_regression ./libs/logistic_regression.o -L ./libs/ -lm -l lrcostfn -l lrgrades -l readdata

	chmod +x ./bin/*

normal:
	mkdir -p bin
	${CC} -g -o ./bin/feature_scale -lm ./src/feature_scale.c

debug:
	mkdir -p bin libs
	${CC} -Wall -D DEBUG -g -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./libs/libreaddata.so
	${CC} -Wall -D DEBUG -g -fPIC ./src/logistic_regression/cost_function.c -I ./src/include/ -shared -o ./libs/liblrcostfn.so
	${CC} -Wall -D DEBUG -g -fPIC ./src/logistic_regression/gradient_descent.c -I ./src/include/ -shared -o ./libs/liblrgrades.so
	${CC} -Wall -D DEBUG -g -o ./bin/feature_scale -lm ./src/feature_scale.c
	${CC} -Wall -D DEBUG -g -I ./libs/ -I ./src/include/ -c ./src/main.c -o ./libs/logistic_regression.o
	${CC} -Wall -g -o ./bin/logistic_regression ./libs/logistic_regression.o -L ./libs/ -lm -l lrgrades -l lrcostfn -l readdata

	chmod +x ./bin/*

timer:
	mkdir -p bin libs
	${CC} -Wall -D TIMER -g -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./libs/libreaddata.so
	${CC} -Wall -D TIMER -g -fPIC ./src/logistic_regression/cost_function.c -I ./src/include/ -shared -o ./libs/liblrcostfn.so
	${CC} -Wall -D TIMER -g -fPIC ./src/logistic_regression/gradient_descent.c -I ./src/include/ -shared -o ./libs/liblrgrades.so
	${CC} -Wall -D TIMER -g -o ./bin/feature_scale -lm ./src/feature_scale.c
	${CC} -Wall -D TIMER -g -I ./libs/ -I ./src/include/ -c ./src/main.c -o ./libs/logistic_regression.o
	${CC} -Wall -g -o ./bin/logistic_regression ./libs/logistic_regression.o -L ./libs/ -lm -l lrgrades -l lrcostfn -l readdata

	chmod +x ./bin/*


release:
	mkdir -p bin libs
	${CC} -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./libs/libreaddata.so
	${CC} -fPIC ./src/logistic_regression/cost_function.c -I ./src/include/ -shared -o ./libs/liblrcostfn.so
	${CC} -fPIC ./src/logistic_regression/gradient_descent.c -I ./src/include/ -shared -o ./libs/liblrgrades.so
	${CC} -I ./libs/ -I ./src/include/ -c ./src/main.c -o ./libs/logistic_regression.o
	${CC} -o ./bin/logistic_regression ./libs/logistic_regression.o -L ./libs/ -lm -l lrcostfn -l lrgrades -l readdata
	${CC} -o ./bin/feature_scale -lm ./src/feature_scale.c

	chmod +x ./bin/*

static:
	mkdir -p bin
	${CC} -Wall -g -fPIC ./src/read_from_data_file.c -I ./src/include/ ./src/logistic_regression/cost_function.c ./src/logistic_regression/gradient_descent.c ./src/main.c -lm -o ./bin/logistic_regression
	${CC} -Wall -g -o ./bin/feature_scale -lm ./src/feature_scale.c

	chmod +x ./bin/*

clean:
	rm -rf ./bin
	rm -rf ./libs
