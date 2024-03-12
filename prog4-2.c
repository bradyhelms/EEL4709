#include <stdio.h>
#include <float.h>

#define BIN_SIZE 32

int main() {
    printf("Helms, William\nID# 6342099\n\n");

    printf("Signed 32 bit integers\n");
    // Shift '1' 31 bits to the left and negate to get
    // 0000 0000 0000 0000 0000 0000 0000 0001 original value
    // 1000 0000 0000 0000 0000 0000 0000 0000 shifted left 31 bits
    // 0111 1111 1111 1111 1111 1111 1111 1111 bitwise negated value
    //
    signed int max_s_int = ~(1 << (sizeof(int)*8 - 1));
    printf("Maximum------------\n");
    printf("DEC:\t%d\n", max_s_int);
    printf("HEX:\t%08x\n", max_s_int);
    
    // Shift '1' 31 bits to the left and negate to get
    // 0000 0000 0000 0000 0000 0000 0000 0001 original value
    // 1000 0000 0000 0000 0000 0000 0000 0000 shifted left 31 bits
    // 0000 0000 0000 0000 0000 0000 0000 0001 bitwise or with 1
    // 1000 0000 0000 0000 0000 0000 0000 0001 resulting value
    signed int min_s_int = (1 << (sizeof(int)*8 - 1)) | 1;
    printf("Minimum------------\n");
    printf("DEC:\t%d\n", min_s_int);
    printf("HEX:\t%08x\n", min_s_int);
    
    printf("\nUnsigned 32 bit integers\n");
    // Set variable to all 0s unsigned and bitwise negate
    // 0000 0000 0000 0000 0000 0000 0000 0000 original value
    // 1111 1111 1111 1111 1111 1111 1111 1111 bitwise negated 
    unsigned int max_u_int = ~0U;
    printf("Maximum------------\n");
    printf("DEC:\t%u\n", max_u_int);
    printf("HEX:\t%08x\n", max_u_int);

    // Set variable to all 0s, this is the unsigned minimum
    // 0000 0000 0000 0000 0000 0000 0000 0000 original value
    unsigned int min_u_int =  0U;
    printf("Minimum------------\n");
    printf("DEC:\t%d\n", min_u_int);
    printf("HEX:\t%08x\n", min_u_int);


    // According to IEEE 754, this value should be the max float
    // But for some reason on my machine does not return the max
    // Which means that my implementation of C does not encode in
    // this standard.
    //
    unsigned int flt_max_pos_bin = 0b01111111011111111111111111111111;
    unsigned int flt_min_pos_bin = 0b00000000100000000000000000000000;
    unsigned int flt_max_neg_bin = 0b10000000100000000000000000000000;
    unsigned int flt_min_neg_bin = 0b11111111011111111111111111111111;
    //
    // For this portion of the lab, I will calculate these values
    // using the limits set in the header file <float.h>

    float flt_max_pos = FLT_MAX;
    float flt_min_pos = FLT_MIN;

    float flt_max_neg = -flt_max_pos;
    float flt_min_neg = -flt_min_pos;

    printf("\nPositive 32 bit floating point\n");
    printf("Maximum Positive ---\n");
    printf("DEC:\t%e\n"  , flt_max_pos);
    printf("HEX:\t%08x\n", flt_max_pos_bin);
    printf("SIGN:\t%d\n", 0);
    printf("EXP: \t%d\n", FLT_MAX_EXP);
    printf("MANT:\t%d\n", 0b11111110);

    printf("Minimum Positive ---\n");
    printf("DEC:\t%e\n"  , flt_min_pos);
    printf("HEX:\t%08x\n", flt_min_pos_bin);
    printf("SIGN:\t%d\n", 0);
    printf("EXP: \t%d\n", FLT_MIN_EXP);
    printf("MANT:\t%d\n", 0b00000001);

    printf("\nNegative 32 bit floating point\n");
    printf("Maximum Negative ---\n");
    printf("DEC:\t%e\n"  , flt_max_neg);
    printf("HEX:\t%08x\n", flt_max_neg_bin);
    printf("SIGN:\t%d\n", 1);
    printf("EXP: \t%d\n", FLT_MIN_EXP);
    printf("MANT:\t%d\n", 0b11111110);

    printf("Minimum Negative ---\n");
    printf("DEC:\t%e\n"  , flt_min_neg);
    printf("HEX:\t%08x\n", flt_min_neg_bin);
    printf("SIGN:\t%d\n", 1);
    printf("EXP: \t%d\n", FLT_MAX_EXP);
    printf("MANT:\t%d\n", 0b00000001);


    // Two signed numbers causing overflow
    // Two positive numbers resulting in a negative
    // Add one to the max signed int from before
    signed int one = 1; 
    printf("\nSigned int overflow:\n");
    printf("%d + %d = %d\n", one, max_s_int, one + max_s_int);

    // Adding a signed number to an unsigned to cause overflow
    // Using max unsigned from before 
    unsigned int val = 1;
    printf("\nUnsigned overflow:\n");
    printf("%u + %u = %u\n", max_u_int , val, max_u_int + val);

    // Using the max floating point value defined in float.h
    printf("\nFloat overflow:\n");
    printf("%e + %e = %e\n", FLT_MAX, FLT_MAX, FLT_MAX + FLT_MAX);

    printf("\nFloat underflow:\n");
    printf("%e + %e = %e\n", flt_max_neg, flt_max_neg, 
                             flt_max_neg + flt_max_neg);
}
