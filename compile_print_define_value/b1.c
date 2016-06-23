#include <stdio.h>

#define MAX 3 
#define P_M(x)	#x
#define Print_Max_Value(x)	P_M(x)

#pragma message ("mstar print : " Print_Max_Value(MAX))

int main()
{
	return 0;
}
