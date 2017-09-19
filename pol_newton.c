#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
#include <stdint.h>

typedef struct ponto{
    double x, y;
}ponto;

typedef struct polinomio{
    ponto *vet;
    uint64_t num_pontos;
}polinomio;

double interpolado(double, polinomio *);

int main(){
    setlocale(LC_CTYPE,"ptb");
    polinomio a;
    printf("Digite o grau do polinômio: ");
    scanf("%llu",&(a.num_pontos));
    (a.num_pontos)++;
    a.vet = (ponto *) calloc (a.num_pontos,sizeof(ponto));
    for(uint64_t i=0;i<a.num_pontos;i++){
        printf("Digite o %uº ponto(separe por espaço): ",i+1);
        scanf("%lf %lf",&(a.vet[i].x),&(a.vet[i].y));
        printf("%lf %lf\n",(a.vet[i].x),(a.vet[i].y));
    }
    interpolado(1.2,&a);
    return 0;
}
double interpolado(double p, polinomio * val){
    uint64_t aux = val->num_pontos;
    double *op = (double *) calloc (aux,sizeof(double));
    for(uint64_t i=0;i<aux;i++)
        op[i] = val->vet[i].y;
    for(uint64_t i=0;i<aux-1;i++)
        for(uint64_t j=aux-1;j>i;--j)
            op[j] = ((op[j-1] - op[j])/(val->vet[j-1-i].x-val->vet[j].x));
    for(uint64_t i=0;i<aux;++i)
        printf("%.2lf\n",op[i]);
    return 0.5;
}
