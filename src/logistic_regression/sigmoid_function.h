/**
 * @file sigmoid_function.c
 * @author Chen Liang
 * @brief Implementation of gradient descent in C
 * @version 0.1
 * @date 2024-06-14
 *
 * @copyright Copyright (c) 2024
 *
 */

#include <math.h>
#include <string.h>

void sigmoid_function(double *h_x, double **X, double *theta, int num_train,
                      int num_feat);
