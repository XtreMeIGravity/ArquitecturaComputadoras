
/**
 *       INSTITUTO POLITÉCNICO NACIONAL
 *        ESCUELA SUPERIOR DE CÓMPUTO
 *        ARQUITECURA DE COMPUTADORAS
 *              SEMESTRE 2021-1
 *                GRUPO: 3CV1
 *                
 * PRACTICA 1
 * @authors Lopez Hernandez David (xtremeigravity@hotmail.com)
 * @date    2020-10-08 19:05:51
 * @version 1.0.0
 * 
 */



#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void LLenaArreglo(int *arr,int size);
void bubbleSort(int arr[], int n);
void ImpArreglo(int *arr,int size);
void swap(int *xp, int *yp);


int main(){
    int n = 0;
    int *arr;
    printf("Introduce el tamaño del arreglo\n");
    scanf("%d",&n);
    arr=malloc(sizeof(int)*n);
    LLenaArreglo(arr,n);
    ImpArreglo(arr, n); 
    bubbleSort(arr, n); 
    printf("Sorted array: \n"); 
    ImpArreglo(arr, n); 
    free(arr);
    return 0; 
}


void LLenaArreglo(int *arr,int size){
    int i, j, num ;
    srand(time(NULL));
    for (i=0; i<size; i++){
        *(arr+i) = rand()%5000;
    }
}

void ImpArreglo(int *arr,int size){
    int i; 
    printf("|");
    for (i=0; i < size; i++) 
        printf("%d|", arr[i]); 
    printf("\n"); 
}

void intercambia(int *xp, int *yp){ 
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
} 

void bubbleSort(int arr[], int n) {
   int i, j;
   for (i = 0; i < n-1; i++)
       for (j = 0; j < n-i-1; j++)
           if (arr[j] > arr[j+1])
              intercambia(&arr[j], &arr[j+1]);
} 