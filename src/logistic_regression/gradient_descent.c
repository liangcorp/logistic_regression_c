/**
 * @file gradient_descent.c
 * @author Chen Liang
 * @brief Implementation of gradient descent in C
 * @version 0.1
 * @date 2024-06-14
 *
 * @copyright Copyright (c) 2024
 *
 */

#include <math.h>
#include <stdlib.h>
#include <string.h>
#include "machine_learning.h"

#define ZERO 0

double *gradient_descent(double **X, double *y, double *theta, float alpha,
			 int num_feat, int num_train, int num_iters)
{
	int i, j;

	double sum = 0.0L;
	double *h_x = calloc(num_train, sizeof(double));

	//  gradient descent
	while (num_iters > ZERO) {
		memset(h_x, 0.0, num_train * sizeof(double));

		// h(x) equation from MatLab
		// hx = 1 ./ (1 + exp(-(theta' * X')));
		for (i = ZERO; i < num_train; i++) {
			sum = 0.0L;
			for (j = ZERO; j < num_feat; j++) {
				sum += theta[j] * X[i][j];
			}
			h_x[i] = pow(M_E, sum) / (1 + pow(M_E, sum));
		}

		for (j = ZERO; j < num_feat; j++) {
			sum = 0.0L;

			for (i = ZERO; i < num_train; i++) {
				sum += (h_x[i] - y[i]) * X[i][j];
			}

			theta[j] = theta[j] - (alpha * sum / (double)num_train);
		}

		num_iters--;
	}

	free(h_x);
	return theta;
}
