#include <stdio.h>

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

}

