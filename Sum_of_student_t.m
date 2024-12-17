% By: Yang, Huaicheng
% At: 28/10/2023 12:09
% Configurations
addpath(genpath('.\funcs'));
V1 = 3; V2 = 60; 
MU = 0; SCALE = 1;
X = -2e1:2e1; 
SIMNUM = 1e4;
rng(6, 'twister') % The random number generator

% 1. Convolution
cov_pdf = getSumStudenttPDFByConvolution(MU,SCALE,X,V1,V2);

% 2. Simulation
% Generate real data sets, and estimate the p.d.f with ksdensity
stu1 = makedist('tLocationScale','mu',MU,'sigma',SCALE,'nu',V1);
stu2 = makedist('tLocationScale','mu',MU,'sigma',SCALE,'nu',V2);
real_stu_data = random(stu1,SIMNUM,1) + random(stu2,SIMNUM,1);
sim_pdf = ksdensity(real_stu_data, X); % Reminder: ksdensity(x=real_stu_data, pts=X)

% 3. Inversion Formula
inv_pdf = getSumStudenttPDFByInversion(X,V1,V2);

p = plot(X,cov_pdf,X,sim_pdf,X,inv_pdf); 
set(p,{'LineWidth'},{4;2;1.5},{'LineStyle'},{"-";"-";"-."},{'color'},{'black';'red';"yellow"});
xlabel('$x+y$',"Interpreter","latex"); ylabel('$f_{X+Y}(x+y)$',"Interpreter","latex");
% ylim([0,0.5])
title("df1 = "+ V1+"; df2 = "+V2);
legend('cov p.d.f','sim p.d.f', 'inv p.d.f')

