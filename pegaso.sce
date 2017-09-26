/*
* Bruno Silva Marques
* 2015116316
* TN2
*/
function [x,iter,converge] = pegaso (f,a,b,tol,iterMax)
    x = a;
    Fa = eval(f);
    x = b;
    Fb = eval(f);
    converge=%F;
    for(iter=0:1:iterMax)
        if(Fa == Fb)
            a = (a + b)/2;
            x = a;
            Fa = eval(f);
        end
        DeltaX = (-1.0)*(Fb*((b-a)/(Fb-Fa)));
        x = b + DeltaX;
        Fx = eval(f);
        if((abs(DeltaX)<=tol)&(abs(Fx)<=tol))
            converge=%T;
            break;
        end
        if((Fx*Fb)<0)
            a = b;
            Fa = Fb;
        else
            Fa = (Fa*Fb)/(Fb+Fx);
        end
        b = x;
        Fb = Fx;
    end
endfunction
f = input("Digite uma função (com o termo independente = x):\n-->","s");
a = input("Digite um ponto: ");
b = input("Digite outro ponto: ");
tol = input("Digite a tolerância do valor: ");
iterMax = input("Digite o número maximo de iterações: ");
[x,iter,converge] = pegaso(f,a,b,tol,iterMax);
printf("\n%.3lf %u ",x,iter);
if(converge)
    printf("convergiu\n");
else
    printf("não convergiu\n");
end
