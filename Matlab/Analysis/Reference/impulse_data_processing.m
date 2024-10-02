% *** Impulse time domain data processing code ***

clc;
clear all;
close all;

% Define the file paths and extract data
filenames = {'C:\Users\AFRL_User\Documents\Summer Interns 24\Test Data\6_12_24\imp_test_001.lvm',
    'C:\Users\AFRL_User\Documents\Summer Interns 24\Test Data\6_12_24\imp_test_002.lvm',
    'C:\Users\AFRL_User\Documents\Summer Interns 24\Test Data\6_12_24\imp_test_003.lvm'};
num_files = length(filenames);
times = []; acc0 = []; acc1 = []; acc2 = []; acc3 = []; input = [];

for i = 1:num_files

    [time, acc_0, acc_1, acc_2, acc_3, input_f] = extractData(filenames{i});
    times = [times, time];
    acc0 = [acc0, acc_0];
    acc1 = [acc1, acc_1];
    acc2 = [acc2, acc_2];
    acc3 = [acc3, acc_3];
    input = [input, input_f];
    
end

% Calculations for frequency domain
t = mean(diff(time)); % take the average of the time differences shown in the time vector
Fs = 1/t; % sampling frequency make sure this matches with tested frequency
N = length(time); % number of samples
freq = Fs*(0:N/2)/N; % frequency bin calculation

[inputFFT] = computeFFT(input, N);
[acc0FFT] = computeFFT(acc0, N);
[acc1FFT] = computeFFT(acc1, N);
[acc2FFT] = computeFFT(acc2, N);
[acc3FFT] = computeFFT(acc3, N);

% acc0phase = rad2deg(angle(acc0FFT));
% acc1phase = rad2deg(angle(acc1FFT));
% acc2phase = rad2deg(angle(acc2FFT));
% acc3phase = rad2deg(angle(acc3FFT));

% Calculation for spectral densities
[Gxy0, Gyx0, Gyy0, Gxx0] = computeSpectralDensities(inputFFT, acc0FFT);
[Gxy1, Gyx1, Gyy1, Gxx1] = computeSpectralDensities(inputFFT, acc1FFT);
[Gxy2, Gyx2, Gyy2, Gxx2] = computeSpectralDensities(inputFFT, acc2FFT);
[Gxy3, Gyx3, Gyy3, Gxx3] = computeSpectralDensities(inputFFT, acc3FFT);

% Calculations for Hw and Coherence
[coher0, Hw0] = computeHwCoherence(Gxy0, Gyx0, Gyy0, Gxx0);
[coher1, Hw1] = computeHwCoherence(Gxy1, Gyx1, Gyy1, Gxx1);
[coher2, Hw2] = computeHwCoherence(Gxy2, Gyx2, Gyy2, Gxx2);
[coher3, Hw3] = computeHwCoherence(Gxy3, Gyx3, Gyy3, Gxx3);

% Hw_phase = rad2deg(angle(Hw));

% Create plots

% time domain
figure;
plot(time, input, '-b');
ylabel('Force (N)');
xlabel('Time (s)');

figure;
plot(time, acc0);
hold on;
plot(time, acc1);
plot(time, acc2);
plot(time, acc3);
hold off;
ylabel('Acceleration (g)');
xlabel('Time (s)');

% FFT
figure;
plot(freq, abs(inputFFT));
xlabel('Frequency (Hz)');
ylabel('Magnitude |N|');

figure;
plot(freq, abs(acc0FFT));
hold on;
plot(freq, abs(acc1FFT));
plot(freq, abs(acc2FFT));
plot(freq, abs(acc3FFT));
xlabel('Frequency (Hz)');
ylabel('Magnitude |g|');

% figure;
% plot(freq, acc0phase);
% hold on;
% plot(freq, acc1phase);
% plot(freq, acc2phase);
% plot(freq, acc3phase);

% FRF
figure;
% plot(freq, dataFRF);
plot(freq, abs(Hw0));
hold on;
plot(freq, abs(Hw1));
plot(freq, abs(Hw2));
plot(freq, abs(Hw3));
xlabel('Frequency (Hz)');
ylabel('Amplitude (g/N)');
legend('Root', 'Middle', 'Tip', 'Base')

% figure;
% plot(freq, Hw_phase);

% Coherence
figure;
plot(freq, coher0);
hold on;
plot(freq, coher1);
plot(freq, coher2);
plot(freq, coher3);
xlabel('Frequency (Hz)');
ylabel('Coherence');

% Define functions
function [Gxy, Gyx, Gyy, Gxx] = computeSpectralDensities(inputFFT, responseFFT)

Gxy = sum((inputFFT).*conj(responseFFT),2);
Gyx = sum((responseFFT).*conj(inputFFT),2);
Gyy = sum(conj(responseFFT).*responseFFT,2);
Gxx = sum(conj(inputFFT).*inputFFT,2);

end

% function [Gxy_avg, Gyx_avg, Gyy_avg, Gxx_avg] = averageSpectralDensities(Gxy_list, Gyx_list, Gyy_list, Gxx_list)
% 
% Gxy_matrix = cell2mat(Gxy_list);
% Gyx_matrix = cell2mat(Gyx_list);
% Gyy_matrix = cell2mat(Gyy_list);
% Gxx_matrix = cell2mat(Gxx_list);
% 
% Gxy_avg = mean(Gxy_matrix, 2);
% Gyx_avg = mean(Gyx_matrix, 2);
% Gyy_avg = mean(Gyy_matrix, 2);
% Gxx_avg = mean(Gxx_matrix, 2);
% 
% end

function [coher, Hw] = computeHwCoherence(Gxy, Gyx, Gyy, Gxx)

H1= Gyx./Gxx; %Assumes noise only on output/will capture antiresonance better  
H2 = Gyy./Gxy; %Assumes noise only on input/will capture resonance better

Hw = (H1+H2)./2; %FRF to minimize noise on input and output

% coher2 = H1./H2;
coher= ((Gxy.*Gyx)./(Gxx.*Gyy));

end

function [FFT] = computeFFT(response, N)

response_w_full = fft(response)/N;

response_w = response_w_full(1:N/2+1,:);
response_w(2:end-1,:) = 2*response_w(2:end-1,:);

FFT = response_w;

end

function [time, acc0, acc1, acc2, acc3, input] = extractData(filename)

data = dlmread(filename,'\t',23,0);

time = data(:,1);
acc0 = data(:,2);
acc1 = data(:,3);
acc2 = data(:,4);
acc3 = data(:,5);
input = data(:,6);

end
