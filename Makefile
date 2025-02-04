CC = gcc

all:
	mkdir -p bin lib
	${CC} -g -Wall -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./lib/libreaddata.so
	${CC} -g -Wall -fPIC ./src/logistic_regression/cost_function.c -I ./src/include/ -shared -o ./lib/liblrcostfn.so
	${CC} -g -Wall -fPIC ./src/logistic_regression/gradient_descent.c -lm -I ./src/include/ -shared -o ./lib/liblrgrades.so
	${CC} -g -Wall -o ./bin/feature_scale -lm ./src/feature_scale.c
	${CC} -g -Wall -I ./lib/ -I ./src/include/ -c ./src/main.c -o ./lib/logistic_regression.o
	${CC} -g -Wall -o ./bin/logistic_regression ./lib/logistic_regression.o -L ./lib/ -l lrcostfn -l lrgrades -l readdata

	chmod +x ./bin/*

debug:
	mkdir -p bin lib
	${CC} -Wall -D DEBUG -g -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./lib/libreaddata.so
	${CC} -Wall -D DEBUG -g -fPIC ./src/logistic_regression/cost_function.c -I ./src/include/ -shared -o ./lib/liblrcostfn.so
	${CC} -Wall -D DEBUG -g -fPIC ./src/logistic_regression/gradient_descent.c -lm -I ./src/include/ -shared -o ./lib/liblrgrades.so
	${CC} -Wall -D DEBUG -g -o ./bin/feature_scale -lm ./src/feature_scale.c
	${CC} -Wall -D DEBUG -g -I ./lib/ -I ./src/include/ -c ./src/main.c -o ./lib/logistic_regression.o
	${CC} -Wall -g -o ./bin/logistic_regression ./lib/logistic_regression.o -L ./lib/ -lm -l lrgrades -l lrcostfn -l readdata

	chmod +x ./bin/*

timer:
	mkdir -p bin lib
	${CC} -Wall -D TIMER -g -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./lib/libreaddata.so
	${CC} -Wall -D TIMER -g -fPIC ./src/logistic_regression/cost_function.c -I ./src/include/ -shared -o ./lib/liblrcostfn.so
	${CC} -Wall -D TIMER -g -fPIC ./src/logistic_regression/gradient_descent.c -lm -I ./src/include/ -shared -o ./lib/liblrgrades.so
	${CC} -Wall -D TIMER -g -o ./bin/feature_scale -lm ./src/feature_scale.c
	${CC} -Wall -D TIMER -g -I ./lib/ -I ./src/include/ -c ./src/main.c -o ./lib/logistic_regression.o
	${CC} -Wall -g -o ./bin/logistic_regression ./lib/logistic_regression.o -L ./lib/ -lm -l lrgrades -l lrcostfn -l readdata

	chmod +x ./bin/*


release:
	mkdir -p bin lib
	${CC} -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./lib/libreaddata.so
	${CC} -fPIC ./src/logistic_regression/cost_function.c -I ./src/include/ -shared -o ./lib/liblrcostfn.so
	${CC} -fPIC ./src/logistic_regression/gradient_descent.c -lm -I ./src/include/ -shared -o ./lib/liblrgrades.so
	${CC} -I ./lib/ -I ./src/include/ -c ./src/main.c -o ./lib/logistic_regression.o
	${CC} -o ./bin/logistic_regression ./lib/logistic_regression.o -L ./lib/ -lm -l lrcostfn -l lrgrades -l readdata
	${CC} -o ./bin/feature_scale -lm ./src/feature_scale.c

	chmod +x ./bin/*

static:
	mkdir -p bin
	${CC} -Wall -g -fPIC ./src/read_from_data_file.c -I ./src/include/ ./src/logistic_regression/cost_function.c ./src/logistic_regression/gradient_descent.c ./src/main.c -lm -o ./bin/logistic_regression
	${CC} -Wall -g -o ./bin/feature_scale -lm ./src/feature_scale.c

	chmod +x ./bin/*

clean:
	rm -rf ./bin
	rm -rf ./lib
