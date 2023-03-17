%Yash Agrawal

% Generate test signal
% Sampling frequency
fs = 2000;
% Time 
t = 0:1/fs:1-1/fs;
% Signal frequency
f = 10;
% Sine wave signal
x = sin(2*pi*f*t);

% Define filter parameters
% Butterworth cutoff frequency
fc_butter = 40; 
% Butterworth filter order
n_butter = 4; 
% Standard deviation of Gaussian filter
sigma_gaussian = 5; 

% Apply the filters
% Output of Butterworth filter
y_butter = butterworth_filter(x, fs, fc_butter, n_butter); 
% Output of Gaussian filter
y_gaussian = gaussian_filter(x, fs, sigma_gaussian); 

% Reconstruct the signal
% Output of filter bank
y = y_butter + y_gaussian; 

% Calculate distortion and compression ratio
distortion = norm(y - x)/norm(x);
compression_ratio = length(y)/length(x);

% Plot the signals
subplot(3,1,1);
plot(t, x);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
xlim([0, 1]);

subplot(3,1,2);
plot(t, y_butter);
title('Output of Butterworth Filter');
xlabel('Time (s)');
ylabel('Amplitude');
xlim([0, 1]);

subplot(3,1,3);
plot(t, y_gaussian);
title('Output of Gaussian Filter');
xlabel('Time (s)');
ylabel('Amplitude');
xlim([0, 1]);

figure;

subplot(2,1,1);
plot(t, x);
hold on;
plot(t, y);
title('Original Signal vs. Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Signal', 'Filtered Signal');
xlim([0, 1]);

subplot(2,1,2);
freq_x = fft(x);
freq_y = fft(y);
f = (0:length(freq_x)-1)*fs/length(freq_x);
plot(f, abs(freq_x));
hold on;
plot(f, abs(freq_y));
title('Frequency Spectrum of Original and Filtered Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
legend('Original Signal', 'Filtered Signal');

% Print quality, distortion, and compression ratio
fprintf('Quality of reconstructed signal: %.4f\n', snr(x, y));
fprintf('Distortion of reconstructed signal: %.4f\n', distortion);
fprintf('Compression ratio: %.4f\n', compression_ratio);
