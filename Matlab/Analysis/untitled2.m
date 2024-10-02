clear;
close all;
clc;

%% Define Data Folder and Fetch Test Data
DataFolder = 'D:\SummerInterns\2024\CIRCULAR\Testing\06_26_2024'; % Path to the data folder
MainFolder = cd;
cd(DataFolder); % Change directory to the data folder

% Fetch files matching the specified patterns
PFfiles0 = dir('t0*.txt');
PFfiles1 = dir('t1*.txt');
PFfiles2 = dir('t2*.txt');
PFfiles = [PFfiles0; PFfiles1; PFfiles2];

numfiles = size(PFfiles, 1);
testnum = 13; 

% Sort files by date to match order of tests recorded in test notes
[~, index] = sortrows({PFfiles.datenum}.'); 
PFfiles = PFfiles(index); 
clear index;

AccelFSIN = input('Enter Acceleration FSIN = ');
FSOUT = 10;

%% Load and Plot Acceleration Data
PFdata = dlmread(PFfiles(testnum).name, '\t', 8, 0); % Read file skipping header
time = PFdata(:, end);
Accel = PFdata(:, 1) .* AccelFSIN ./ FSOUT;

figure(100); 
plot(time * 1000, Accel);
xlabel('Time [ms]');
ylabel('Acceleration [G]');
title('Raw Acceleration Over Time');

%% Get Peak and Duration of Raw Acceleration
[peak, peakIdx] = max(Accel);
WidthPercent = 10;
w = pulsewidth(Accel, time, 'MidPercentReferenceLevel', WidthPercent, 'StateLevels', [0 peak]);

figure(10);
pulsewidth(Accel, time, 'MidPercentReferenceLevel', WidthPercent, 'StateLevels', [0 peak]);
xlim([time(peakIdx) - 1e-3, time(peakIdx) + 1e-3] * 1000);

disp(['Peak = ', num2str(peak), ' G']);
disp(['PulseWidth = ', num2str(w * 1000), ' ms']);

str1 = {['Peak = ', num2str(peak), ' G'], ['PulseWidth = ', num2str(w * 1000), ' ms']};
annotation('textbox', [0.15, 0.12, 0.1, 0.1], 'String', str1, 'FitBoxToText', 'on', 'BackgroundColor', 'w', 'FontWeight', 'bold');

%% Filter Acceleration Data and Get Peak and Duration
fc = 50e3;
Fs = 1 ./ mean(diff(PFdata(:, end)));
filterOrder = 2;
Wn = fc / (Fs / 2); % Normalized cutoff frequency = freq / (sampling freq / 2)
[b, a] = butter(filterOrder, Wn, 'low'); % IIR filter design
AccelFiltered = filtfilt(b, a, Accel); % Zero-phase filtering

figure(100);
hold on;
plot(time * 1000, AccelFiltered);
legend('Raw', 'Filtered');
xlim([time(peakIdx) - 1e-3, time(peakIdx) + 1e-3] * 1000);

[peakF, peakIdxF] = max(AccelFiltered);
[wF, initcross, finalcross, midlevel] = pulsewidth(AccelFiltered, time, 'MidPercentReferenceLevel', WidthPercent, 'StateLevels', [0 peakF]);

figure(11);
pulsewidth(AccelFiltered, time, 'MidPercentReferenceLevel', WidthPercent, 'StateLevels', [0 peakF]);
xlim([time(peakIdxF) - 1e-3, time(peakIdxF) + 1e-3] * 1000);

disp(['Peak = ', num2str(peakF), ' G']);
disp(['PulseWidth = ', num2str(wF * 1000), ' ms']);

str1 = {['Peak = ', num2str(peakF), ' G'], ['PulseWidth = ', num2str(wF * 1000), ' ms']};
annotation('textbox', [0.15, 0.12, 0.1, 0.1], 'String', str1, 'FitBoxToText', 'on', 'BackgroundColor', 'w', 'FontWeight', 'bold');

%% Calculate Velocity
IdxEnd = find((Accel(peakIdx:end) < 0), 1) + peakIdx;
vel_vector = cumtrapz(time(1:IdxEnd), Accel(1:IdxEnd) * 32.2); % [ft/s]
vel = trapz(time(1:IdxEnd), Accel(1:IdxEnd) * 32.2); % [ft/s]
disp(['VelChange = ', num2str(vel), ' ft/s']);

%% Calculate FFT of Base Accel
input = Accel;
if size(PFdata, 2) <= 2
    response = NaN(size(PFdata(:, 2))); % If no board accel, don't calculate a response FFT
else
    response = PFdata(:, 2);
end
T = 1 / Fs; % Sampling period
N = length(time); % Length of signal

freq = Fs * (0:N/2) / N; % Define frequency vector [Hz]
input_w_full = fft(input) / N;
response_w_full = fft(response) / N;

input_w = input_w_full(1:N/2+1,:);
input_w(2:end-1,:) = 2 * input_w(2:end-1,:);

response_w = response_w_full(1:N/2+1,:);
response_w(2:end-1,:) = 2 * response_w(2:end-1,:);

responseFFT = response_w;
inputFFT = input_w;
dataFRF = response_w ./ input_w; % Frequency response function = response (SUT) / input (reference)

figure('Position', [896, 130, 560, 920]);
ax1 = subplot(3, 1, 1);
plot(freq, abs(inputFFT));
ylabel('FFT of Base Accel');
xlabel('Frequency [Hz]');

ax2 = subplot(3, 1, 2);
plot(freq, abs(responseFFT));
ylabel('FFT of Board Accel');
xlabel('Frequency [Hz]');

ax3 = subplot(3, 1, 3);
plot(freq, abs(dataFRF));
ylabel('Ratio');
xlabel('Frequency [Hz]');

linkaxes([ax1, ax2, ax3], 'x');
xlim([0 fc]);

%% Return to Main Folder
cd(MainFolder);
