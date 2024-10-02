% ****LabView visualization of accelerometer data acquired on PCB testing****
clc;
clear all;
close all;

% Define file paths
time_domain_file = 'C:\Users\AFRL_User\Documents\Summer Interns 24\Test Data\6_10_24\bst_test_001\Time Domain\td_test_001';
frequency_domain_file = 'C:\Users\AFRL_User\Documents\Summer Interns 24\Test Data\6_10_24\bst_test_001\Frequency Domain\Magnitude\mag_fft_test_001';

% Read the time-domain data
time_domain_data = dlmread(time_domain_file, '\t', 23, 0);
time = time_domain_data(:,1);
accel0 = time_domain_data(:,2);
accel1 = time_domain_data(:,3);
accel2 = time_domain_data(:,4);
accel3 = time_domain_data(:,5);

% Read the frequency domain data
frequency_domain_data = dlmread(frequency_domain_file, '\t', 23, 0);
frequency = frequency_domain_data(:,1);
accel0_freq = frequency_domain_data(:,2);
accel1_freq = frequency_domain_data(:,3);
accel2_freq = frequency_domain_data(:,4);
accel3_freq = frequency_domain_data(:,5);

% Calculate an FFT
time_interval = mean(diff(time));
Fs = 1/time_interval; % sampling frequency
n = length(time); % number of samples
frequency_bins = Fs * (0:n/2) /n; % frequency bin calculation
accel0_fft_full = fft(accel0)/n;
accel1_fft_full = fft(accel1)/n;
accel2_fft_full = fft(accel2)/n;
accel3_fft_full = fft(accel3)/n;

accel0_fft = accel0_fft_full(1:n/2+1);
accel1_fft = accel1_fft_full(1:n/2+1);
accel2_fft = accel2_fft_full(1:n/2+1);
accel3_fft = accel3_fft_full(1:n/2+1);

accel0_mag = abs(accel0_fft);
accel1_mag = abs(accel1_fft);
accel2_mag = abs(accel2_fft);
accel3_mag = abs(accel3_fft);

% Compute FRFs and Coherence
accel1_FRF = accel1_freq ./ accel0_freq;
accel2_FRF = accel2_freq ./ accel0_freq;
accel3_FRF = accel3_freq ./ accel0_freq;

Gxy1 = sum((accel0_fft).*conj(accel1_fft),2);
Gyx1 = sum((accel1_fft).*conj(accel1_fft),2);
Gyy1 = sum(conj(accel1_fft).*(accel1_fft),2);
Gxx1 = sum(conj(accel0_fft).*(accel0_fft),2);
H11 = Gyx1./Gxx1;
H21 = Gyy1./Gxy1;
Hw1 = (H11+H21)./2; % FRF to minimize noise on input and output
coher1 = ((Gxy1.*Gyx1)./(Gxx1.*Gyy1));

% Compute the phase angle
% accel1_phase = rad2deg(angle(accel1_freq));
% accel2_phase = rad2deg(angle(accel2_freq));
% accel3_phase = rad2deg(angle(accel3_freq));

% Plot the time domain
figure;
subplot(4,1,1);
plot(time, accel0);
title('Base Excitation');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');

subplot(4,1,2);
plot(time, accel1);
title('Accelerometer 1');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');

subplot(4,1,3);
plot(time, accel2);
title('Accelerometer 2');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');

subplot(4,1,4);
plot(time, accel3);
title('Accelerometer 3');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');

% Plot the frequency domain
figure;
subplot(4,1,1);
plot(frequency_bins, accel0_fft);
title('Base Excitation');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0,250]);

subplot(4,1,2);
plot(frequency_bins, accel1_fft);
title('Accelerometer 1');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0,250]);

subplot(4,1,3);
plot(frequency_bins, accel2_fft);
title('Accelerometer 2');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0,250]);

subplot(4,1,4);
plot(frequency_bins, accel3_fft);
title('Accelerometer 3');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0,250]);

% figure;
% subplot(4,1,1);
% plot(frequency, accel0_freq);
% title('Base Excitation');
% xlabel('Frequency (Hz)');
% ylabel('Magnitude');
% xlim([0,250]);
% 
% subplot(4,1,2);
% plot(frequency, accel1_freq);
% title('Accelerometer 1');
% xlabel('Frequency (Hz)');
% ylabel('Magnitude');
% xlim([0,250]);
% 
% subplot(4,1,3);
% plot(frequency, accel2_freq);
% title('Accelerometer 2');
% xlabel('Frequency (Hz)');
% ylabel('Magnitude');
% xlim([0,250]);
% 
% subplot(4,1,4);
% plot(frequency, accel3_freq);
% title('Accelerometer 3');
% xlabel('Frequency (Hz)');
% ylabel('Magnitude');
% xlim([0,250]);

% Plot the FRFs
figure;
subplot(3,1,1);
plot(frequency, abs(accel1_FRF));
title('Accelerometer 1');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0,250]);

subplot(3,1,2);
plot(frequency, abs(accel2_FRF));
title('Accelerometer 2');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0,250]);

subplot(3,1,3);
plot(frequency, abs(accel3_FRF));
title('Accelerometer 3');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0,250]);

% Plot the phase angle vs frequency
% figure;
% subplot(3,1,1);
% plot(frequency, accel1_phase);
% title('Accelerometer 1');
% xlabel('Frequency (Hz)');
% ylabel('Phase Angle');
% xlim([0,250]);
% 
% subplot(3,1,2);
% plot(frequency, accel2_phase);
% title('Accelerometer 2');
% xlabel('Frequency (Hz)');
% ylabel('Phase Angle');
% xlim([0,250]);
% 
% subplot(3,1,3);
% plot(frequency, accel3_phase);
% title('Accelerometer 3');
% xlabel('Frequency (Hz)');
% ylabel('Phase Angle');
% xlim([0,250]);

% Plot the cleaner FRF
figure;
plot(frequency_bins, Hw1);
xlim([0,250]);

% Plot the Coherance
figure;
plot(frequency_bins, coher1);
xlim([0,250]);
ylim([0, 1.5]);