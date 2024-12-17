% By: Yang, Huaicheng
% At: 27/10/2023 22:53
addpath(genpath('.\funcs')); rng(6, 'twister')
MU = 0; SCALE = 1; V = 5; X = -1e2:1e2;  

real_pdf = getStudenttPDFByDefinition(MU,SCALE,V,X); 
inv_pdf = getStudenttPDFByInversion(X,V);

%% Plot the p.d.f.s
p = plot(X,real_pdf,X,inv_pdf); 
set(p,{'LineWidth'},{2;1},{'LineStyle'},{"-";"-."},{'color'},{'black';'yellow'});
xlabel('$x$',"Interpreter","latex"); ylabel('$f_X(x)$',"Interpreter","latex");
title("df = "+V);
legend('real p.d.f','inv p.d.f'); hold off
%% Relative percentage error (a sample with fixed V)
RPE = (real_pdf - inv_pdf)./real_pdf;
plot(X,RPE,"color","black","Marker",".","MarkerEdgeColor","red")
title("Relative Percentage Error (v={" + V + "})")
xlabel("$(real\_pdf - inv\_pdf)/real\_pdf$","interpreter","latex")


