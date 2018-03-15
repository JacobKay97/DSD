/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>


#define ALT_CI_FP_ADD_SUB_0(n,A,B) __builtin_custom_fnff(ALT_CI_FP_ADD_SUB_0_N+(n&ALT_CI_FP_ADD_SUB_0_N_MASK),(A),(B))
#define ALT_CI_FP_ADD_SUB_0_N 0x2
#define ALT_CI_FP_ADD_SUB_0_N_MASK ((1<<1)-1)
#define ALT_CI_FP_MULT_0(A,B) __builtin_custom_fnff(ALT_CI_FP_MULT_0_N,(A),(B))
#define ALT_CI_FP_MULT_0_N 0x0

int main()
{
  printf("Hello from Nios II!\n");
  float a,b,c,d,e;
  a = 5.0;
  b = 4.0;
  c = a*b;
  d = ALT_CI_FP_MULT_0(a,b);
  e = ALT_CI_FP_ADD_SUB_0(0,a,b);

  printf("Original %f \n", c);
  printf("Custom %f \n", d);
  printf("Custom %f \n", e);
  return 0;
}
