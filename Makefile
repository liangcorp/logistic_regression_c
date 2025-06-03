CC = gcc

all:
	mkdir -p bin lib
	${CC} -g -Wall -Werror -Wpedantic -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./lib/libreaddata.so
	${CC} -g -Wall -Werror -Wpedantic -fPIC ./src/logistic_regression/sigmoid_function.c -fPIC ./src/logistic_regression/cost_function.c -I ./src/include/ -shared -o ./lib/liblrcostfn.so
	${CC} -g -Wall -Werror -Wpedantic -fPIC ./src/logistic_regression/sigmoid_function.c -fPIC ./src/logistic_regression/gradient_descent.c -lm -I ./src/include/ -shared -o ./lib/liblrgrades.so
	${CC} -g -Wall -Werror -Wpedantic -o ./bin/feature_scale -lm ./src/feature_scale.c
	${CC} -g -Wall -Werror -Wpedantic -I ./lib/ -I ./src/include/ -c ./src/main.c -o ./lib/logistic_regression.o
	${CC} -g -Wall -Werror -Wpedantic -o ./bin/logistic_regression ./lib/logistic_regression.o -L ./lib/ -l lrcostfn -l lrgrades -l readdata

	chmod +x ./bin/*

debug:
	mkdir -p bin lib
	${CC} -Wall -Werror -Wpedantic -D DEBUG -g -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./lib/libreaddata.so
	${CC} -Wall -Werror -Wpedantic -D DEBUG -g -fPIC ./src/logistic_regression/sigmoid_function.c -fPIC ./src/logistic_regression/cost_function.c -I ./src/include/ -shared -o ./lib/liblrcostfn.so
	${CC} -Wall -Werror -Wpedantic -D DEBUG -g -fPIC ./src/logistic_regression/sigmoid_function.c -fPIC ./src/logistic_regression/gradient_descent.c -lm -I ./src/include/ -shared -o ./lib/liblrgrades.so
	${CC} -Wall -Werror -Wpedantic -D DEBUG -g -o ./bin/feature_scale -lm ./src/feature_scale.c
	${CC} -Wall -Werror -Wpedantic -D DEBUG -g -I ./lib/ -I ./src/include/ -c ./src/main.c -o ./lib/logistic_regression.o
	${CC} -Wall -Werror -Wpedantic -g -o ./bin/logistic_regression ./lib/logistic_regression.o -L ./lib/ -lm -l lrgrades -l lrcostfn -l readdata

	chmod +x ./bin/*

timer:
	mkdir -p bin lib
	${CC} -Wall -Werror -Wpedantic -D TIMER -g -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./lib/libreaddata.so
	${CC} -Wall -Werror -Wpedantic -D TIMER -g -fPIC ./src/logistic_regression/sigmoid_function.c -fPIC ./src/logistic_regression/cost_function.c -I ./src/include/ -shared -o ./lib/liblrcostfn.so
	${CC} -Wall -Werror -Wpedantic -D TIMER -g -fPIC ./src/logistic_regression/sigmoid_function.c -fPIC ./src/logistic_regression/gradient_descent.c -lm -I ./src/include/ -shared -o ./lib/liblrgrades.so
	${CC} -Wall -Werror -Wpedantic -D TIMER -g -o ./bin/feature_scale -lm ./src/feature_scale.c
	${CC} -Wall -Werror -Wpedantic -D TIMER -g -I ./lib/ -I ./src/include/ -c ./src/main.c -o ./lib/logistic_regression.o
	${CC} -Wall -Werror -Wpedantic -g -o ./bin/logistic_regression ./lib/logistic_regression.o -L ./lib/ -lm -l lrgrades -l lrcostfn -l readdata

	chmod +x ./bin/*


release:
	mkdir -p bin lib
	${CC} -fPIC ./src/read_from_data_file.c -I ./src/include/ -shared -o ./lib/libreaddata.so
	${CC} -fPIC ./src/logistic_regression/sigmoid_function.c -fPIC ./src/logistic_regression/cost_function.c -I ./src/include/ -shared -o ./lib/liblrcostfn.so
	${CC} -fPIC ./src/logistic_regression/sigmoid_function.c -fPIC ./src/logistic_regression/gradient_descent.c -lm -I ./src/include/ -shared -o ./lib/liblrgrades.so
	${CC} -I ./lib/ -I ./src/include/ -c ./src/main.c -o ./lib/logistic_regression.o
	${CC} -o ./bin/logistic_regression ./lib/logistic_regression.o -L ./lib/ -lm -l lrcostfn -l lrgrades -l readdata
	${CC} -o ./bin/feature_scale -lm ./src/feature_scale.c

	chmod +x ./bin/*

static:
	mkdir -p bin
	${CC} -Wall -Werror -Wpedantic -g -fPIC ./src/logistic_regression/sigmoid_function.c -fPIC ./src/read_from_data_file.c -I ./src/include/ ./src/logistic_regression/cost_function.c ./src/logistic_regression/gradient_descent.c ./src/main.c -lm -o ./bin/logistic_regression
	${CC} -Wall -Werror -Wpedantic -g -o ./bin/feature_scale -lm ./src/feature_scale.c

	chmod +x ./bin/*

format:
	find -name *.h -exec clang-format -i {} \;
	find -name *.c -exec clang-format -i {} \;

clean:
	rm -rf ./bin
	rm -rf ./lib
