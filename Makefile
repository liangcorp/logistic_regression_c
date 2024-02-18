CC = clang

all:
	mkdir -p bin libs
	${CC} -g -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./libs/libreaddata.so
	${CC} -g -fPIC ./src/cost_function.c -I ./src/include/ -shared -o ./libs/liblrcostfn.so
	${CC} -g -fPIC ./src/gradient_descent.c -I ./src/include/ -shared -o ./libs/liblrgrades.so
	${CC} -g -o ./bin/feature_scale -lm ./src/feature_scale.c
	${CC} -g -I ./libs/ -I ./src/include/ -c ./src/main.c -o ./libs/logistic_regression.o
	${CC} -g -o ./bin/logistic_regression ./libs/logistic_regression.o -L ./libs/ -lm -l lrcostfn -l lrgrades -l readdata

	chmod +x ./bin/*

normal:
	mkdir -p bin
	${CC} -g -o ./bin/feature_scale -lm ./src/feature_scale.c

debug:
	mkdir -p bin libs
	${CC} -D DEBUG -g -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./libs/libreaddata.so
	${CC} -D DEBUG -g -fPIC ./src/cost_function.c -I ./src/include/ -shared -o ./libs/liblrcostfn.so
	${CC} -D DEBUG -g -fPIC ./src/gradient_descent.c -I ./src/include/ -shared -o ./libs/liblrgrades.so
	${CC} -D DEBUG -g -o ./bin/feature_scale -lm ./src/feature_scale.c
	${CC} -D DEBUG -g -I ./libs/ -I ./src/include/ -c ./src/main.c -o ./libs/logistic_regression.o
	${CC} -g -o ./bin/logistic_regression ./libs/logistic_regression.o -L ./libs/ -lm -l lrgrades -l lrcostfn -l readdata

	chmod +x ./bin/*

timer:
	mkdir -p bin libs
	${CC} -D TIMER -g -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./libs/libreaddata.so
	${CC} -D TIMER -g -fPIC ./src/cost_function.c -I ./src/include/ -shared -o ./libs/liblrcostfn.so
	${CC} -D TIMER -g -fPIC ./src/gradient_descent.c -I ./src/include/ -shared -o ./libs/liblrgrades.so
	${CC} -D TIMER -g -o ./bin/feature_scale -lm ./src/feature_scale.c
	${CC} -D TIMER -g -I ./libs/ -I ./src/include/ -c ./src/main.c -o ./libs/logistic_regression.o
	${CC} -g -o ./bin/logistic_regression ./libs/logistic_regression.o -L ./libs/ -lm -l lrgrades -l lrcostfn -l readdata

	chmod +x ./bin/*


release:
	mkdir -p bin libs
	${CC} -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./libs/libreaddata.so
	${CC} -fPIC ./src/cost_function.c -I ./src/include/ -shared -o ./libs/liblrcostfn.so
	${CC} -fPIC ./src/gradient_descent.c -I ./src/include/ -shared -o ./libs/liblrgrades.so
	${CC} -I ./libs/ -I ./src/include/ -c ./src/main.c -o ./libs/logistic_regression.o
	${CC} -o ./bin/logistic_regression ./libs/logistic_regression.o -L ./libs/ -lm -l lrcostfn -l lrgrades -l readdata
	${CC} -o ./bin/feature_scale -lm ./src/feature_scale.c

	chmod +x ./bin/*

static:
	mkdir -p bin libs
	${CC} -fPIC ./src/read_from_data_file.c -I ./src/include/ ./src/cost_function.c ./src/main.c -lm -o ./bin/logistic_regression
	${CC} -o ./bin/feature_scale -lm ./src/feature_scale.c

	chmod +x ./bin/*

clean:
	rm -rf ./bin
	rm -rf ./libs
