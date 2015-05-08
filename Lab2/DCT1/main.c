////////////////////////////////////////////////////
//
// WHT based DCT implementation 
//
// Note: 1/sqrt(N) normalization is NOT performed
//
///////////////////////////////////////////////////

#include "dct.h"

/// input buffer
volatile sample_t x[N] = {110, 105, -24, 99, -114, -39, 79, -126};
/// output buffer
volatile sample_t y[N];

int main (void)
{
  /// un-normalized WHT buffer
  sample_t yw[N];

  /// WHT
  wht(x, yw);
  /// lifting steps
  ls(yw, y);
  
  return 0;
}


