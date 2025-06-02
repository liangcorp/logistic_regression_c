/*
 *  Cost function for logistical regression
 * # Cost function for multiple features (x\[1\], x\[2\], ..., x\[n\]
 * - X and y are the training sets.
 * - X is a 2D Vector represent multiple training sets
 * - theta is a vector that contains chosen numbers.
 *
 * ## Implement the following matlab formula:
 *
 * hx = 1 ./ (1 + exp(-(theta' * X')));
 *
 * J = sum(-y .* log(hx') - (1 - y) .* log(1 - hx')) /
 *         m + (lambda / (2 * m)) * sum(theta_without_first.^2);
 *
 *
 *
 */

#include <malloc.h>
#include <math.h>
#include <stdlib.h>

#include "machine_learning.h"

double cost_function(double **X, double *y, double *theta, int num_feat, int num_train)
{
    double *hx = calloc(num_train, sizeof(double));
    double sum = 0.0L;

    // h(x) equation from MatLab
    // hx = 1 ./ (1 + exp(-(theta' * X')));
    for (int i = 0; i < num_train; i++)
    {
        for (int j = 0; j < num_feat; j++)
        {
            sum += theta[j] * X[i][j];
        }
        hx[i] = 1 / (1 + pow(M_E, -sum));
    }

    for (int i = 0; i < num_train; i++)
    {
        sum += (y[i] * log(hx[i]) + (1 - y[i]) * log(1 - hx[i]));
    }

    double j_theta = -(sum / num_train);

    free(hx);

    return j_theta;
}
