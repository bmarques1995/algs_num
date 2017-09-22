function [x,iter,converge] = pegaso (f,a,b,tol,repMax)
    x = 1/0.0;
    y = a;
    Fa = eval(f);
    y = b;
    Fb = eval(f);
    for(iter=0:1:repMax)
        DeltaX = (Fb*(b-a)/(Fb-Fa));
        x = b + DeltaX;
        y = x;
        Fx = eval(f);
        if((DeltaX<=tol)&(abs(Fx)<=tol))
            return x,iter,%T;
        end
        if(Fx*Fb)<0
            a = b;
            Fa = Fb;
        else
            Fa = (Fa*Fb)/(Fb+Fx);
        end
    end
    return x,iter,%F;
endfunction

f = input("Digite uma função (com o termo independente = y):\n-->","s");
a = input("Digite um ponto: ");
b = input("Digite outro ponto: ");
tol = input("Digite a tolerância do valor: ");
/*
repe = input("Digite o número maximo de iterações: ");
repMax = uint32(repe);
*/
[x1,iter1,converge1] = pegaso(f,a,b,tol,50)
printf("%.2lf %u %u",x1,iter1,converge1);

