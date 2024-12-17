function [cdf_value] = cal_fcdf(sample, initvec)
    % Get MLE estimates from the obeserved samples.
    [param, ~, ~, ~, ~] = tMaxLike(sample, initvec);
    v_hat = param(1); mu_hat = param(2); scale_hat = param(3);
    fdist = makedist('tLocationScale','mu',mu_hat,'sigma',scale_hat,'nu',v_hat); 
    % 2- calculate the cdf
    cdf_value = cdf(fdist, sample);
end