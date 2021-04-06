#include <stdio.h>
#include "factorial.h"

int main() {
    int x;

    printf("Enter a number to calculate factorial: ");
    scanf("%d", &x);
    x = factorial(x);
    printf("%d", x);

    return 0;

}
