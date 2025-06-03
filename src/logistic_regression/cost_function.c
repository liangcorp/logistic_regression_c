/*
 *  Cost function for logistical regression
 * # Cost function for multiple features (x\[1\], x\[2\], ..., x\[n\]
 * - X and y are the training sets.
 * - X is a 2D Vector represent multiple training sets
 * - theta is a vector that contains chosen numbers.
 *
 * ## Implement the following matlab formula:
 *
 * h_x = 1 ./ (1 + exp(-(theta' * X')));
 *
 * J = sum(-y .* log(h_x') - (1 - y) .* log(1 - h_x')) /
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
    double *h_x = calloc(num_train, sizeof(double));
    double sum = 0.0L;

    sigmoid_function(h_x, X, theta, num_train, num_feat);

    for (int i = 0; i < num_train; i++)
    {
        sum += (y[i] * log(h_x[i]) + (1 - y[i]) * log(1 - h_x[i]));
    }

    double j_theta = -(sum / num_train);

    free(h_x);

    return j_theta;
}
