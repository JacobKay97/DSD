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

#include <stdlib.h>
#include <sys/alt_stdio.h>
#include <sys/alt_alarm.h>
#include <sys/times.h>
#include <alt_types.h>
//#include <system.h>
#include <stdio.h>
#include <unistd.h>
#include <math.h>
#define ALT_CI_FP_ADD_SUB_0(n,A,B) __builtin_custom_fnff(ALT_CI_FP_ADD_SUB_0_N+(n&ALT_CI_FP_ADD_SUB_0_N_MASK),(A),(B))
#define ALT_CI_FP_ADD_SUB_0_N 0x2
#define ALT_CI_FP_ADD_SUB_0_N_MASK ((1<<1)-1)
#define ALT_CI_FP_MULT_0(A,B) __builtin_custom_fnff(ALT_CI_FP_MULT_0_N,(A),(B))
#define ALT_CI_FP_MULT_0_N 0x0
// Test case 1
//#define step 5
//#define N 52
// Test case 2
#define step 0.1
#define N 2551
//Test case 3
//#define step 0.001
//#define N 255001
// Generates the vector x and stores it in the memory
void generateVector(float x[N] )
{
	int i;
	x[0] = 0;
	for (i=1; i<N; i++){
		x[i] = x[i-1] + step;
		//x[i] = i*step;
	}
}

float sumVector(float x[], int M)
{
	float sum = 0.00;
	float floorinput[N];
	float firstmult[N];
	float junk = 0.00;

	int i;
	//sum = sum + ((0.5*x[i]) +(x[i]*x[i]*cosf(floorf(x[i]/4)-32)));
	//sum = sum + x[i]*(0.5+x[i]*cosf(floorf(x[i]/4)-32))
	//sum = ALT_CI_FP_ADD_SUB_0(1,sum, (ALT_CI_FP_MULT_0(x[i],ALT_CI_FP_ADD_SUB_0(1,0.5,ALT_CI_FP_MULT_0(x[i], cosf( floorf(x[i]/4) -32 ))))));
	//sum = ALT_CI_FP_ADD_SUB_0(1,sum, (ALT_CI_FP_MULT_0(x[i],ALT_CI_FP_ADD_SUB_0(1,0.5,ALT_CI_FP_MULT_0(x[i], cosf( ALT_CI_FP_ADD_SUB_0(0,floorf(ALT_CI_FP_MULT_0(x[i],0.25)), 32) ))))));
	//NOTE Implement fp add and mult for
	//extra note, floor of x/4 will be a shift
	junk = ALT_CI_FP_MULT_0(x[0],0.25);
	for(i = 0; i<M-1; i++){
		floorinput[i]=ALT_CI_FP_MULT_0(x[i+1],0.25);
	}
	floorinput[M-1] = ALT_CI_FP_MULT_0(0,0);

	for(i=0; i<M;i++){
		floorinput[i] = cosf( ALT_CI_FP_ADD_SUB_0(0,floorf(floorinput[i]), 32) );
	}

	junk = ALT_CI_FP_MULT_0(x[0],floorinput[0]);
	for(i = 0; i<M-1; i++){
		firstmult[i]=ALT_CI_FP_MULT_0(x[i+1],floorinput[i+1]);
	}
	firstmult[M-1] = ALT_CI_FP_MULT_0(0,0);

	for(i=0; i<M;i++){
		firstmult[i] = ALT_CI_FP_ADD_SUB_0(1,firstmult[i], 0.5) ;
	}

	junk = ALT_CI_FP_MULT_0(x[0],firstmult[0]);
	for(i = 0; i<M-1; i++){
		firstmult[i]=ALT_CI_FP_MULT_0(x[i+1],firstmult[i+1]);
	}
	firstmult[M-1] = ALT_CI_FP_MULT_0(0,0);

	for(i =0; i<M;i++){
		sum = ALT_CI_FP_ADD_SUB_0(1,sum,firstmult[i]);
	}

	return sum;
}


int main()
{

	float x[N];

	// Returned result
	float y;
	generateVector(x);
	// The following is used for timing
	char buf[50];
	clock_t exec_t1, exec_t2;

	exec_t1 = times(NULL); // get system time before starting the process
	// The code that you want to time goes here
	int i;
	for (i=0; i<10;i++){
		y = sumVector(x, N);
	}
	// till here
	exec_t2 = times(NULL); // get system time after finishing the process
	gcvt((exec_t2 - exec_t1), 10, buf);
	alt_putstr(" proc time = ");
	alt_putstr(buf);
	alt_putstr(" ticks \n");
	// printf could be used if there was enough memory
	alt_putstr(" Result = ");
	printf("result: %f \n",y);


  return 0;
}