% By: Yang, Huaicheng
% At: 29/10/2023 10:51
%% Configurations
addpath(genpath('.\funcs'));rng(42, 'twister');
sample_size = 500;
bootstrap_size = 500;
sim_num = 1000; step = 25;
cilevel = 0.10;

%% Plot ES
[ES_true, estimate, ~] = tBootstrapES(4,sample_size,bootstrap_size, cilevel);
ES_emp = estimate.para; ES_emp_nonpara = estimate.nonpara;
p = boxplot([ES_emp', ES_emp_nonpara'],"Notch","on","Labels",{'Parametric','Nonparametric'});
yline(ES_true,"--", "true ES");
hold off

%% Calculate coverage rate and the average length of c.i.s
rng(6, 'twister');
x = 25:step:sample_size;
for i=1:length(x)
    size=x(i)
    for each_sim=1:sim_num
        [ES_true, ~, ES_ci] = tBootstrapES(4,size,bootstrap_size, cilevel);
        para_hi = ES_ci.para(2); para_lo = ES_ci.para(1);
        nonpara_hi = ES_ci.nonpara(2); nonpara_lo = ES_ci.nonpara(1);
        % each real cover
        rc_para(each_sim) = (ES_true > para_lo) & (ES_true < para_hi);
        rc_nonpara(each_sim) = (ES_true > nonpara_lo) & (ES_true < nonpara_hi);
        % each c.i. length
        ci_para(each_sim) = (para_hi-para_lo);
        ci_nonpara(each_sim) = (nonpara_hi-nonpara_lo);
    end
    rc_pb_para(i) = mean(rc_para); rc_pb_nonpara(i) = mean(rc_nonpara);
    ci_len_para(i) = mean(ci_para); ci_len_nonpara(i) = mean(ci_nonpara);
end

tiledlayout("flow")

nexttile
plot(x, rc_pb_para, x, rc_pb_nonpara);
title("Student's t-distribution c.i.s")
xlabel('Sample Size'); ylabel("Actual Coverage")
ylim([-inf,1]);
yline(1-cilevel, '--','Nomial Coverage', 'LineWidth',0.25);
legend("Parametric", "Nonparametric", 'Location','southeast');

nexttile
plot(x, ci_len_para, x, ci_len_nonpara);
title("Average Lengths of c.i.s")
legend("Parametric", "Nonparametric");
xlabel('Sample Size'); ylabel("Average Length")
