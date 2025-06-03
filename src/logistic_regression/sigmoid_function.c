/**
 * @file sigmoid_function.c
 * @author Chen Liang
 * @brief Implementation of sigmoid function in C
 * @version 0.1
 * @date 2024-06-14
 *
 * @copyright Copyright (c) 2024
 *
 */

#include "sigmoid_function.h"

void sigmoid_function(double *h_x, double **X, double *theta, int num_train, int num_feat)
{
    int i, j;
    double sum = 0.0L;

    memset(h_x, 0.0, num_train * sizeof(double));

    // h(x) equation from MatLab
    // hx = 1 ./ (1 + exp(-(theta' * X')));
    for (i = 0; i < num_train; i++)
    {
        sum = 0.0L;
        for (j = 0; j < num_feat; j++)
        {
            sum += theta[j] * X[i][j];
        }
        *(h_x + i) = pow(M_E, sum) / (1 + pow(M_E, sum));
    }
}
