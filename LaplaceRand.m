function [res] = LaplaceRand(m, n, mu, sigma)
    %Check inputs
    if nargin < 2
        error('At least two inputs are required');
    end

    if nargin == 2
        mu = 0; sigma = 1;
    end

    if nargin == 3
        sigma = 1;
    end

    % Generate Laplacian noise
    u = rand(m, n)-0.5;
    b = sigma / sqrt(2);
    res = mu - b * sign(u).* log(1- 2* abs(u));
end