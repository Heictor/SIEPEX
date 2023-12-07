close all
clear all
clc

fun = @ackley;
nvars = 2;
options = optimoptions('ga','PlotFcn',"gaplotbestf","MaxStallGenerations",300);
[x,fval,exitflag,output,population,scores] = ga(fun,nvars,[],[],[],[],[],[],[],options)


figure(5)
hold on

[x1,x2]=meshgrid(-5.12:0.01:5.12,-5.12:0.01:5.12);
%f =20+x1.^2+x2.^2-10*(cos(2*pi*x1)+cos(2*pi*x2));
f = (0.5 - (((sin (sqrt (x1.^2+x2.^2) )).^2) - 0.5)./(1 + 0.001.*(x1.^2+x2.^2)).^2);

surf(x1,x2,f,'EdgeColor','none');
colormap(hsv);
colorbar;
shading interp;
alpha 0.2;
scatter3(population(1:end,1), population(1:end,2), scores(1:end), 60,'*','k')

legend('Espaço de Busca','Melhor Indivíduo')
title('Geração Rastrigin')
grid on
hold off