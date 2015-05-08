#ifndef _DCT_H
#define _DCT_H

//#define DEBUG

#ifdef DEBUG
#include<stdio.h>
#endif

/// define constants
#define LOG2N 3
#define N (1 << LOG2N)

/// define sample type
typedef int sample_t;

/// fractional bits on results
#define FBITS 2

/// define lifting coefficients
#define L1_8 51
#define S1_8 8
#define L2_8 98
#define S2_8 8
#define L1_16 25
#define S1_16 8
#define L2_16 50 
#define S2_16 8
#define L1_316 78
#define S1_316 8
#define L2_316 142 
#define S2_316 8

/// Compute the WHT
///\param *x input buffer pointer
///\param *y output buffer pointer
void wht(volatile sample_t *x, sample_t *y);
/// Compute the Lifting Steps
///\param *x input buffer pointer
///\param *y output buffer pointer
void ls(sample_t *x, volatile sample_t *y);

#endif
