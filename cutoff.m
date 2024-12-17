%%
    % specify the random seed
    rng(100);addpath(genpath('.\funcs'));
    
    size_of_test = 500;
    sample_sizes = [30 60 100];
   
    [KD_3, AD_3] = getAllKDAD(3,sample_sizes,size_of_test);
    [KD_6, AD_6] = getAllKDAD(6,sample_sizes,size_of_test);
    [KD_12, AD_12] = getAllKDAD(12,sample_sizes,size_of_test);
    
%%
     KD_3 = sort(KD_3, 2);
    cutoff_kd_3 = KD_3(:,[floor(0.9*size_of_test),floor(0.95*size_of_test),floor(0.99*size_of_test)]);
    KD_6 = sort(KD_6, 2);
    cutoff_kd_6 = KD_6(:,[floor(0.9*size_of_test),floor(0.95*size_of_test),floor(0.99*size_of_test)]);
    KD_12 = sort(KD_12, 2);
    cutoff_kd_12 = KD_12(:,[floor(0.9*size_of_test),floor(0.95*size_of_test),floor(0.99*size_of_test)]);
    AD_3 = sort(AD_3, 2);
    cutoff_ad_3 = AD_3(:,[floor(0.9*size_of_test),floor(0.95*size_of_test),floor(0.99*size_of_test)]);
    AD_6 = sort(AD_6, 2);
    cutoff_ad_6 = AD_6(:,[floor(0.9*size_of_test),floor(0.95*size_of_test),floor(0.99*size_of_test)]);
    AD_12 = sort(AD_12, 2);
    cutoff_ad_12 = AD_12(:,[floor(0.9*size_of_test),floor(0.95*size_of_test),floor(0.99*size_of_test)]);
 %%
 % Calculate size of the test. That is, the frequency we reject H_0 when
 % H_0 is true
kd3_size = []; ad3_size = []; 
kd6_size = []; ad6_size = []; 
kd12_size = []; ad12_size = []; 
 nus = [1:2:30];
 sim  = 5e3;


for nu=nus
    nu
    [true_KD_3, true_AD_3] = getAllKDAD(nu,[30, 100],sim);
    kd3_is_bigger_than_cutoff = true_KD_3(1,:)>cutoff_kd_3(1,:)';
    ad3_is_bigger_than_cutoff = true_AD_3(1,:)>cutoff_ad_3(1,:)';

    kd6_is_bigger_than_cutoff = true_KD_3(1,:)>cutoff_kd_6(1,:)';
    ad6_is_bigger_than_cutoff = true_AD_3(1,:)>cutoff_ad_6(1,:)';
    
    kd12_is_bigger_than_cutoff = true_KD_3(1,:)>cutoff_kd_12(1,:)';
    ad12_is_bigger_than_cutoff = true_AD_3(1,:)>cutoff_ad_12(1,:)';

    kd3_size = [kd3_size; (sum(kd3_is_bigger_than_cutoff,2)/sim)'];
    ad3_size = [ad3_size; (sum(ad3_is_bigger_than_cutoff,2)/sim)'];
    kd6_size = [kd6_size; (sum(kd6_is_bigger_than_cutoff,2)/sim)'];
    ad6_size = [ad6_size; (sum(ad6_is_bigger_than_cutoff,2)/sim)'];
    kd12_size = [kd12_size; (sum(kd12_is_bigger_than_cutoff,2)/sim)']
    ad12_size = [ad12_size; (sum(ad12_is_bigger_than_cutoff,2)/sim)'];
end
%% Plot the size
hold on
tiledlayout("vertical")
nexttile
plot(1:2:30, kd3_size(:,1),"r-*", ...
     1:2:30, kd3_size(:,2),"r-.*", ...
     1:2:30, kd3_size(:,3),"r:*", ...
     1:2:30, ad3_size(:,1),"black-*", ...
     1:2:30, ad3_size(:,2),"black-.*", ...
     1:2:30, ad3_size(:,3),"black:*")
xlabel("Degrees of Freedom $\nu$","Interpreter","latex");
ylabel("Actual Size");
ylim([-0.01,0.2])
xlim([0 31])
title("Size for nominal 1%, 5% ,10% Tests (Cutoff df = 3, n = 30)");
legend("KD(10%)","KD(5%)","KD(1%)", "AD(10%)","AD(5%)","AD(1%)")

nexttile
plot(1:2:30, kd6_size(:,1),"r-*", ...
     1:2:30, kd6_size(:,2),"r-.*", ...
     1:2:30, kd6_size(:,3),"r:*", ...
     1:2:30, ad6_size(:,1),"black-*", ...
     1:2:30, ad6_size(:,2),"black-.*", ...
     1:2:30, ad6_size(:,3),"black:*")
xlabel("Degrees of Freedom $\nu$","Interpreter","latex");
ylabel("Actual Size");
ylim([-0.01,0.2])
xlim([0 31])
title("Size for nominal 1%, 5% ,10% Tests (Cutoff df = 6, n = 30)");
legend("KD(10%)","KD(5%)","KD(1%)", "AD(10%)","AD(5%)","AD(1%)")

nexttile
plot(1:2:30, kd12_size(:,1),"r-*", ...
     1:2:30, kd12_size(:,2),"r-.*", ...
     1:2:30, kd12_size(:,3),"r:*", ...
     1:2:30, ad12_size(:,1),"black-*", ...
     1:2:30, ad12_size(:,2),"black-.*", ...
     1:2:30, ad12_size(:,3),"black:*")
xlabel("Degrees of Freedom $\nu$","Interpreter","latex");
ylabel("Actual Size");
ylim([-0.01,0.2])
xlim([0 31])
title("Size for nominal 1%, 5% ,10% Tests (Cutoff df = 12, n = 30)");
legend("KD(10%)","KD(5%)","KD(1%)", "AD(10%)","AD(5%)","AD(1%)")
%%
    size_of_test = 500;
    sample_sizes = [30 60 100];
   
    [gKD_3, gAD_3] = getAllKDAD(3,sample_sizes,size_of_test,'g');
    [gKD_6, gAD_6] = getAllKDAD(6,sample_sizes,size_of_test,'g');
    [gKD_12, gAD_12] = getAllKDAD(12,sample_sizes,size_of_test,'g');

%% GAUSSIAN
% Change which_data to get what we need
kd3_size = []; ad3_size = []; 
kd6_size = []; ad6_size = []; 
kd12_size = []; ad12_size = []; 
sims = 1:1e3;
which_data = 3;
% for sim=sims
    [gKD_3, gAD_3] = getAllKDAD(3,sample_sizes,size_of_test,'g');
    [gKD_6, gAD_6] = getAllKDAD(6,sample_sizes,size_of_test,'g');
    [gKD_12, gAD_12] = getAllKDAD(12,sample_sizes,size_of_test,'g');

    kd3_is_bigger_than_cutoff = gKD_3(which_data,:)>cutoff_kd_3(which_data,:)';
    ad3_is_bigger_than_cutoff = gAD_3(which_data,:)>cutoff_ad_3(which_data,:)';

    kd6_is_bigger_than_cutoff = gKD_6(which_data,:)>cutoff_kd_6(which_data,:)';
    ad6_is_bigger_than_cutoff = gAD_6(which_data,:)>cutoff_ad_6(which_data,:)';
    
    kd12_is_bigger_than_cutoff = gKD_12(which_data,:)>cutoff_kd_12(which_data,:)';
    ad12_is_bigger_than_cutoff = gAD_12(which_data,:)>cutoff_ad_12(which_data,:)';
    
    % Here the size should be the power

    kd3_size = [kd3_size; (sum(kd3_is_bigger_than_cutoff,2)/size_of_test)'];
    ad3_size = [ad3_size; (sum(ad3_is_bigger_than_cutoff,2)/size_of_test)'];
    kd6_size = [kd6_size; (sum(kd6_is_bigger_than_cutoff,2)/size_of_test)'];
    ad6_size = [ad6_size; (sum(ad6_is_bigger_than_cutoff,2)/size_of_test)'];
    kd12_size = [kd12_size; (sum(kd12_is_bigger_than_cutoff,2)/size_of_test)']
    ad12_size = [ad12_size; (sum(ad12_is_bigger_than_cutoff,2)/size_of_test)'];

%%
    % When the alternative is Laplace

%% LAPLACE
% Change which_data to get what we need
which_data = 3; % 1: 30  2: 60  3: 100
kd3_size = []; ad3_size = []; 
kd6_size = []; ad6_size = []; 
kd12_size = []; ad12_size = []; 
% sims = 1:1e3;

% for sim=sims
    [gKD_3, gAD_3] = getAllKDAD(3,sample_sizes,size_of_test,'l');
    [gKD_6, gAD_6] = getAllKDAD(6,sample_sizes,size_of_test,'l');
    [gKD_12, gAD_12] = getAllKDAD(12,sample_sizes,size_of_test,'l');

    kd3_is_bigger_than_cutoff = gKD_3(which_data,:)>cutoff_kd_3(which_data,:)';
    ad3_is_bigger_than_cutoff = gAD_3(which_data,:)>cutoff_ad_3(which_data,:)';

    kd6_is_bigger_than_cutoff = gKD_6(which_data,:)>cutoff_kd_6(which_data,:)';
    ad6_is_bigger_than_cutoff = gAD_6(which_data,:)>cutoff_ad_6(which_data,:)';
    
    kd12_is_bigger_than_cutoff = gKD_12(which_data,:)>cutoff_kd_12(which_data,:)';
    ad12_is_bigger_than_cutoff = gAD_12(which_data,:)>cutoff_ad_12(which_data,:)';
    
    % Here the size should be the power

    kd3_size = [kd3_size; (sum(kd3_is_bigger_than_cutoff,2)/size_of_test)'];
    ad3_size = [ad3_size; (sum(ad3_is_bigger_than_cutoff,2)/size_of_test)'];
    kd6_size = [kd6_size; (sum(kd6_is_bigger_than_cutoff,2)/size_of_test)'];
    ad6_size = [ad6_size; (sum(ad6_is_bigger_than_cutoff,2)/size_of_test)'];
    kd12_size = [kd12_size; (sum(kd12_is_bigger_than_cutoff,2)/size_of_test)']
    ad12_size = [ad12_size; (sum(ad12_is_bigger_than_cutoff,2)/size_of_test)'];


        %%
    % generate cutoff tables
function cutoffs = getCutoff(mat)
    mat = sort(mat);
    cutoffs = mat(:,[floor(0.9*size_of_test),floor(0.95*size_of_test),floor(0.99*size_of_test)]);
end
