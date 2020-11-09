#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef struct neuronio{
    int a, b;
    float pesoA, pesoB, res;
}neuronio;

int main(void) {
    printf("Treinamento de Rede Neural para somar dois numeros\n\n");

    srand(time(NULL));

    neuronio neuron;
    float erro, taxa, acc;
    int *a, *b, epocas, n;

    printf("taxa de aprendizado no neuronio: ");
    scanf("%f", &taxa);

    printf("numero de epocas que deseja treinar: ");
    scanf("%d", &epocas);

    printf("numero de dados para treinamento: ");
    scanf("%d", &n);

    a = (int *) malloc(sizeof(int)*n);
    b = (int *) malloc(sizeof(int)*n);

    for (int i=0;i<n;i++){
        printf("\nDado %d\n", i+1);
        printf("A: ");
        scanf("%d", &a[i]);
        printf("B: ");
        scanf("%d", &b[i]);
    }

    neuron.pesoA = 3*((rand()%101)/100.0);
    neuron.pesoB = 3*((rand()%101)/100.0);

    printf("\n\nPesos inicias - A: %.2f, B: %.2f\n", neuron.pesoA, neuron.pesoB);

    for (int i=0; i<epocas;i++){
        for (int j=0;j<n;j++){
            neuron.a = a[j];
            neuron.b = b[j];

            //funcao de ativacao
            neuron.res = neuron.pesoA*neuron.a + neuron.pesoB*neuron.b;

            erro = (neuron.a+neuron.b) - neuron.res;

            neuron.pesoA += erro * taxa * neuron.a;
            neuron.pesoB += erro * taxa * neuron.b;

            if (neuron.res == 0){
                neuron.res = 0.000000001;
            }
            float correto = (neuron.a+neuron.b);
            if (erro<0) erro *= -1;
            acc = (correto - erro)/correto;
            acc*= 100;

            printf("\n%d + %d = %.2f\nExatidao: %.2f%%", neuron.a, neuron.b, neuron.res, acc);
            printf("\nNovos pesos - A: %.2f, B: %.2f\n", neuron.pesoA, neuron.pesoB);
        }
    }

    printf("\nEtapa de testes\n");
    for (int i=0;i<n;i++){
        printf("A: ");
        scanf("%d", &neuron.a);
        printf("B: ");
        scanf("%d", &neuron.b);

        //funcao de ativacao
        neuron.res = neuron.pesoA*neuron.a + neuron.pesoB*neuron.b;

        float correto = (neuron.a+neuron.b);
        acc = correto<neuron.res ? ( correto / neuron.res ) : ( neuron.res / correto);
        acc*= 100;

        printf("Resultado: %.2f\nExatidao: %.2f%%\n", neuron.res, acc);

    }







    return 0;
}