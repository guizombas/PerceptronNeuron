#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void) {
  printf("Neuronio perceptron somador de dois numeros iguais\n\n");

  srand(time(NULL));

  float erro, taxa, acc;
  int epocas, nDados;

  printf("taxa de aprendizado no neuronio: ");
  scanf("%f", &taxa);

  printf("numero de epocas que deseja treinar: ");
  scanf("%d", &epocas);

  printf("numero de dados para treinamento: ");
  scanf("%d", &nDados);

  int dados[nDados];

  for (int i=0;i<nDados;i++){
    printf("\nDado %d\n", i+1);
    scanf("%d", &dados[i]);
  }

  float pesoA = 3*((rand()%101)/100.0);
  float pesoB = 3*((rand()%101)/100.0);

  printf("\n\nPesos inicias - A: %.2f, B: %.2f\n", pesoA, pesoB);

  for (int i=0; i<epocas;i++){
    for (int j=0;j<nDados;j++){

      //funcao de ativacao
      float res = pesoA*dados[j] + pesoB*dados[j];

      erro = (2*dados[j]) - res;

      pesoA += erro * taxa * dados[j];
      pesoB += erro * taxa * dados[j];

      if (res == 0){
        res = 0.000000001;
      }


      float correto = (dados[j]);
      if (erro<0) erro *= -1;
      acc = (correto - erro)/correto;
      acc*= 100;

      printf("\n%d + %d = %.2f\nExatidao: %.2f%%", dados[j], dados[j], res, acc);
      printf("\nNovos pesos - A: %.2f, B: %.2f\n", pesoA, pesoB);
    }
  }

  printf("\nEtapa de testes\n");
  for (int i=0;i<nDados;i++){
    int teste;
    printf("A: ");
    scanf("%d", &teste);

    //funcao de ativacao
    float res = pesoA*teste + pesoB*teste;

    float correto = (teste*2);
    acc = correto<res ? ( correto / res ) : ( res / correto);
      acc*= 100;

    printf("Resultado: %.2f\nExatidao: %.2f%%\n", res, acc);

  }

  return 0;
}
