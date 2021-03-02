#include <stdio.h>
#include <stdlib.h>
#define OPR(x) (x == '+' || x == '-' || x == '*' || x == '/' || x == '%') ? 1 : 0
#define DIGIT(x) (x >= '0' || x <= '9') ? 1 : 0
#define ESPACE(x) (x == ' ') ? 1 : 0
int do_math(int a, int b, char opr)
{
	switch(opr)
	{
		case '+' : return (a + b);
		case '-' : return (a - b);
		case '*' : return (a * b);
		case '/' : return (a / b);
		case '%' : return (a % b);
		default : break;
	}
	return 0;
}
void to_next( char **str)
{
	while( **str && !ESPACE(**str))
		(*str)++;
	if(**str)
		(*str)++;
}
int rpn_calc(char *str)
{
	int num[2048] = {0};
	int i = -1;
	int a;
	int b;
	while(*str)
	{
		if(OPR(*str))
		{
			if(i < 1) 
				return 0;
			a = num[i];
			i--;
			b = num[i];
			num[i] = do_math(a, b, *str);
		}
		else if(DIGIT(*str))
		{
			i++;
			num[i] = atoi(str);
		}
		to_next(&str);
	}
	if( i == 0)
	{
		printf("%d\n", num[i]);
		return 1;
	}
	return 0;
}
int main (int ac, char**av)
{
	if( ac != 2 || !rpn_calc(av[1]))
		printf("Error\n");
	return 0;
}