%Yash Agrawal

% GAUSSIAN_FILTER applies a Gaussian filter to the input signal x with the
% given sampling frequency fs and standard deviation sigma.

function y = gaussian_filter(x, fs, sigma)

% Gaussian filter impulse response
h = fspecial('gaussian', [1, 50], sigma);
y = conv(x, h, 'same'); % Filter the input signal
end
