#include "dct.h"
#include "tceops.h"
/// Compute a WHT step
///\param x1 first value
///\param x2 second value
///\param f choose add/subtract
///\return WHT step result
static sample_t wht_step(sample_t x1, sample_t x2, int f)
{
  if (f == 0)
    return x1+x2;
  else
    return x1-x2;
}

/// Compute the first lifting step of the pi/8 rotation
///\param x1 first value
///\param x2 second value
static sample_t lift_pi8_1(sample_t x1, sample_t x2)
{
  sample_t tmp;

  tmp = (x2*L1_8) >> S1_8;

  return x1+tmp;
}

/// Compute the second lifting step of the pi/8 rotation
///\param x1 first value
///\param x2 second value
static sample_t lift_pi8_2(sample_t x1, sample_t x2)
{
  sample_t tmp;  

  tmp = (x1*L2_8) >> S2_8;

  return x2-tmp;
}

/// Compute the first lifting step of the pi/16 rotation
///\param x1 first value
///\param x2 second value
static sample_t lift_pi16_1(sample_t x1, sample_t x2)
{
  sample_t tmp;

  tmp = (x2*L1_16) >> S1_16;

  return x1+tmp;
}

/// Compute the second lifting step of the pi/16 rotation
///\param x1 first value
///\param x2 second value
static sample_t lift_pi16_2(sample_t x1, sample_t x2)
{
  sample_t tmp;  

  tmp = (x1*L2_16) >> S2_16;

  return x2-tmp;
}

/// Compute the first lifting step of the 3pi/16 rotation
///\param x1 first value
///\param x2 second value
static sample_t lift_3pi16_1(sample_t x1, sample_t x2)
{
  sample_t tmp;

  tmp = (x2*L1_316) >> S1_316;

  return x1+tmp;
}

/// Compute the second lifting step of the 3pi/16 rotation
///\param x1 first value
///\param x2 second value
static sample_t lift_3pi16_2(sample_t x1, sample_t x2)
{
  sample_t tmp;  

  tmp = (x1*L2_316) >> S2_316;

  return x2-tmp;
}

/// Compute the WHT
///\param *x input buffer pointer
///\param *y output buffer pointer
void wht(volatile sample_t *x, sample_t *y)
{
  /// temporary buffer
  sample_t ytmp[2][8];
  /// old data pointer
  sample_t *yold;
  /// new data pointer
  sample_t *ynew;
  /// temporary buffer index
  int yidx;
  
  /// index
  int i;

  /// level in the WHT butterfly structure
  int level;
  /// current block in level
  int block;
  /// number of blocks per current level
  int block_number;
  /// block offset
  int offset;
  /// displacement of the second input/output respect to the first one
  int m;

  /// values initialization
  m = N/2;
  yidx=0;

  /// buffer initialization
  yold = ytmp[yidx];
  ynew = ytmp[yidx^1];

  /// copy input data in the local buffer
  for (i=0; i<N; i++)
    yold[i] = x[i] << FBITS;

  /// compute the WHT in a butterfly fashion
  for (level=0; level<LOG2N; level++)
  {
    /// numer of blocks in current level is 2^level
    block_number = 1 << level;
    offset = 0;
    for (block=0; block<block_number; block++)
    {
      for (i=0; i<m; i++)
      {
	/// compute one butterfly
	ynew[i+offset] = wht_step(yold[i+offset], yold[i+offset+m], 0);
	ynew[i+offset+m] = wht_step(yold[i+offset], yold[i+offset+m], 1);
      }            
      /// update the block offset
      offset += (m << 1);
    }
    /// exchange buffers
    yidx ^=1;
    yold = ytmp[yidx];
    ynew = ytmp[yidx^1];
    /// update the displacement
    m >>= 1;
  }

  /// copy results on output buffer
  for (i=0; i<N; i++)
    y[i] = yold[i];

#ifdef DEBUG
  printf("WHT results\n");
  for (i=0; i<N; i++)
    printf("%d\n", yold[i]);
#endif
    
}

/// Compute the Lifting Steps
///\param *x input buffer pointer
///\param *y output buffer pointer
void ls(sample_t *x, volatile sample_t *y)
{
  /// temporary results
  sample_t ytmp1;
  sample_t ytmp2;
  sample_t ytmp3;
  sample_t ytmp4;

#ifdef DEBUG
  /// index
  int i; 
#endif

  /// Walsh and B order
  /// 0, 3, 6, 5, 4, 7, 2, 1

  /// not altered
  y[0] = x[0];
  y[4] = x[3];

  /// \pi/8 lifting steps 
  ytmp1 = x[6];
  ytmp2 = x[5];
_TCE_LIFTPI81(ytmp1,ytmp2,ytmp1);
  //ytmp1 = lift_pi8_1(ytmp1, ytmp2);
_TCE_LIFTPI82(ytmp1,ytmp2,ytmp2);
  //ytmp2 = lift_pi8_2(ytmp1, ytmp2);
_TCE_LIFTPI81(ytmp1,ytmp2,ytmp1);
  //ytmp1 = lift_pi8_1(ytmp1, ytmp2);
  y[2] = ytmp1;
  y[6] = ytmp2;

  /// \pi/8 lifting steps 
  /// \pi/16 lifting steps 
  /// 3\pi/16 lifting steps   
  ytmp1 = x[4];
  ytmp2 = x[2];
_TCE_LIFTPI81(ytmp1,ytmp2,ytmp1);
  //ytmp1 = lift_pi8_1(ytmp1, ytmp2);
_TCE_LIFTPI82(ytmp1,ytmp2,ytmp2);
  //ytmp2 = lift_pi8_2(ytmp1, ytmp2);
_TCE_LIFTPI81(ytmp1,ytmp2,ytmp1);
  //ytmp1 = lift_pi8_1(ytmp1, ytmp2);  

  ytmp3 = x[7];
  ytmp4 = x[1];
_TCE_LIFTPI81(ytmp3,ytmp4,ytmp3);
  //ytmp3 = lift_pi8_1(ytmp3, ytmp4);
_TCE_LIFTPI82(ytmp3,ytmp4,ytmp4);
  //ytmp4 = lift_pi8_2(ytmp3, ytmp4);
_TCE_LIFTPI81(ytmp3,ytmp4,ytmp3);
  //ytmp3 = lift_pi8_1(ytmp3, ytmp4);  

_TCE_LIFTPI161(ytmp1,ytmp4,ytmp1);
  //ytmp1 = lift_pi16_1(ytmp1, ytmp4);
_TCE_LIFTPI162(ytmp1,ytmp4,ytmp4);
  //ytmp4 = lift_pi16_2(ytmp1, ytmp4);
_TCE_LIFTPI161(ytmp1,ytmp4,ytmp1);
  //ytmp1 = lift_pi16_1(ytmp1, ytmp4);

_TCE_LIFT3PI161(ytmp2,ytmp3,ytmp2);
 // ytmp2 = lift_3pi16_1(ytmp2, ytmp3);
_TCE_LIFT3PI162(ytmp2,ytmp3,ytmp3);
 // ytmp3 = lift_3pi16_2(ytmp2, ytmp3);
_TCE_LIFT3PI161(ytmp2,ytmp3,ytmp2);
 // ytmp2 = lift_3pi16_1(ytmp2, ytmp3);

  y[1] = ytmp1;
  y[3] = ytmp2;
  y[5] = ytmp3;
  y[7] = ytmp4;

#ifdef DEBUG
  printf("DCT results\n");
  for (i=0; i<N; i++)
    printf("%d\n", y[i]);
#endif

}


