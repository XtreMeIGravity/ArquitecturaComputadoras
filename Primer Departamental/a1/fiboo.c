
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

int main(){
    int inicial = 0;
    int final = 1;
    int contador = 0;
    int condicion = 12;
    int valor;
    while(contador < condicion){
        printf("%d ",inicial);
        valor=inicial+final;
        inicial=final;
        final=valor;
        contador++;
    }
    return 0; 
}
