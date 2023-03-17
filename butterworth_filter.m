%Yash Agrawal

% BUTTERWORTH_FILTER applies a Butterworth filter to the input signal x
% with the given sampling frequency fs, cutoff frequency fc, and filter
% order n

function y = butterworth_filter(x, fs, fc, n)

% Butterworth filter coefficients
[b, a] = butter(n, fc/(fs/2));
y = filter(b, a, x); % Filter the input signal
end
