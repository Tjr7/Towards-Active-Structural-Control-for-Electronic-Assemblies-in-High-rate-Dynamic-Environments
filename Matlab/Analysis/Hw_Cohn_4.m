clc;
clear;
close all;

%% Data Fetching
filenames = {
	'H:\SummerInterns\2024\CIRCULAR\Shaker\RoundBoard_Piezos_1000Hz.txt',
	'H:\SummerInterns\2024\CIRCULAR\Shaker\TestRoundBoard_Piezos_2000Hz.txt',
	'H:\SummerInterns\2024\CIRCULAR\Shaker\TestRoundBoard_Piezos_3000Hz.txt',
	'H:\SummerInterns\2024\CIRCULAR\Shaker\TestRoundBoard_Piezos_3500Hz.txt',
	'H:\SummerInterns\2024\CIRCULAR\Shaker\TestRoundBoard_Piezos_3500Hz_SE5V.txt',
	'H:\SummerInterns\2024\CIRCULAR\Shaker\TestRoundBoard_Piezos_4000Hz.txt',
	'H:\SummerInterns\2024\CIRCULAR\Shaker\TestRoundBoard_Piezos_4000Hz_2.txt',
	'H:\SummerInterns\2024\CIRCULAR\Shaker\TestRoundBoard_Piezos_4000Hz_3.txt',
	'H:\SummerInterns\2024\CIRCULAR\Shaker\TestRoundBoard_Piezos_4500Hz.txt',
	'H:\SummerInterns\2024\CIRCULAR\Shaker\TestRoundBoard_Piezos_4500Hz_3.txt',
	};	
% 	'E:\SummerInterns\2024\CIRCULAR\Shaker\TestRoundBoard_Piezos_ImpactHammer1.txt',
num_files = length(filenames);
% input = []; output = []; times = [];
times = []; input = []; output = []; piezo1 = []; piezo2 = []; piezo3 = []; 


for i = 1:num_files

%   [time, input_f, output_f] = extractData(filenames{i});
	[time, input_f, output_f, piezo1_f, piezo2_f, piezo3_f] = extractData(filenames{i});
    times = [times, time];
    output = [output, output_f];
    input = [input, input_f];
	piezo1 = [piezo1, piezo1_f];
	piezo2 = [piezo2, piezo2_f];
	piezo3 = [piezo3, piezo3_f];
end

times = times-times(1,:);
%% plotting
figure;
plot(times, input, 'LineWidth', 2.0);
fontsize = 12;
fonttype = 'Times New Roman';
% figurepos = [1 1];
% figuresize = [6 1.5];
set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% set(gcf,'Units','inches','Position', [figurepos, figuresize]);
ylabel('{\bf Acceleration (g)}', 'FontSize', 12);
xlabel('{\bf Time (s)}', 'FontSize', 12);
xlim([3 3.001]);
% xticks(0.05:0.0005:0.053);
% ylim([-7500 17500]);
title('Input Acceleration Over Time');
ax0 = gca;
ax0.YColor = 'k';
ax0.XColor = 'k';

figure;
plot(times, output, 'LineWidth', 2.0);
fontsize = 12;
fonttype = 'Times New Roman';
% figurepos = [1 1];
% figuresize = [6 1.5];
set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% set(gcf,'Units','inches','Position', [figurepos, figuresize]);
ylabel('{\bf Acceleration (g)}', 'FontSize', 12);
xlabel('{\bf Time (s)}', 'FontSize', 12);
xlim([3 3.001]);
% xticks(0.05:0.0005:0.053);
% ylim([-7500 17500]);
title('Output Acceleration Over Time');
ax1 = gca;
ax1.YColor = 'k';
ax1.XColor = 'k';

figure;
plot(times, piezo1, 'LineWidth', 2.0);
fontsize = 12;
fonttype = 'Times New Roman';
% figurepos = [1 1];
% figuresize = [6 1.5];
set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% set(gcf,'Units','inches','Position', [figurepos, figuresize]);
ylabel('{\bf Voltage (g)}', 'FontSize', 12);
xlabel('{\bf Time (s)}', 'FontSize', 12);
xlim([3 3.001]);
% xticks(0.05:0.0005:0.053);
% ylim([-7500 17500]);
title('Piezoi 1 Voltage Over Time');
ax2 = gca;
ax2.YColor = 'k';
ax2.XColor = 'k';

figure;
plot(times, piezo2, 'LineWidth', 2.0);
fontsize = 12;
fonttype = 'Times New Roman';
% figurepos = [1 1];
% figuresize = [6 1.5];
set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% set(gcf,'Units','inches','Position', [figurepos, figuresize]);
ylabel('{\bf Voltage (g)}', 'FontSize', 12);
xlabel('{\bf Time (s)}', 'FontSize', 12);
xlim([3 3.001]);
% xticks(0.05:0.0005:0.053);
% ylim([-7500 17500]);
title('Piezoi 2 Voltage Over Time');
ax3 = gca;
ax3.YColor = 'k';
ax3.XColor = 'k';

figure;
plot(times, piezo3, 'LineWidth', 2.0);
fontsize = 12;
fonttype = 'Times New Roman';
% figurepos = [1 1];
% figuresize = [6 1.5];
set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% set(gcf,'Units','inches','Position', [figurepos, figuresize]);
ylabel('{\bf Voltage (g)}', 'FontSize', 12);
xlabel('{\bf Time (s)}', 'FontSize', 12);
xlim([3 3.001]);
% xticks(0.05:0.0005:0.053);
% ylim([-7500 17500]);
title('Piezoi 3 Voltage Over Time');
ax4 = gca;
ax4.YColor = 'k';
ax4.XColor = 'k';

% figure;
% plot(time, output);
% ylabel('Acceleration (g)');
% xlabel('Time (s)');
% title('Output Acceleration Over Time');
% ax1 = gca;

% figure;
% plot(time, output, 'LineWidth', 2.0);
% plot(time, topstrain, time, bottomstrain, 'LineWidth', 2.0);
% fontsize = 12;
% fonttype = 'Times New Roman';
% figurepos = [1 1];
% figuresize = [6 1.5];
% set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% set(gcf,'Units','inches','Position', [figurepos, figuresize]);
% %ylabel('{\bf Acceleration (g)}', 'FontSize', 12);
% ylabel('{\bf Strain}', 'FontSize', 12);
% xlabel('{\bf Time (s)}', 'FontSize', 12);
% % xlim([0.05 0.053]);
% %ylim([-21000 21000]);
% % yticks(-20000:10000:20000);
% title('{\bf Board Acceleration Over Time}', 'FontSize', 32);
% ax1 = gca;
% ax1.YColor = 'k';
% ax1.XColor = 'k';
% ax1.FontName = 'Bombardier';
% ax1.FontSize = 12;

% figure;
% subplot(1,2,1);
% plot(time, output, 'LineWidth', 2.0);
% plot(time, topstrain, 'LineWidth', 2.0);
% fontsize = 12;
% fonttype = 'Times New Roman';
% figurepos = [1 1];
% figuresize = [6 1.5];
% set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% set(gcf,'Units','inches','Position', [figurepos, figuresize]);
% ylabel('{\bf Strain}', 'FontSize', 12);
% xlabel('{\bf Time (s)}', 'FontSize', 12);
% xlim([0.05 0.0515]);
% ylim([-6 6]);
% %title('{\bf Board Acceleration Over Time}', 'FontSize', 32);
% subplot(1,2,2);
% plot(time, output, 'LineWidth', 2.0);
% plot(time, bottomstrain, 'LineWidth', 2.0);
% fontsize = 12;
% fonttype = 'Times New Roman';
% figurepos = [1 1];
% figuresize = [6 1.5];
% set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% set(gcf,'Units','inches','Position', [figurepos, figuresize]);
% % ylabel('{\bf Strain}', 'FontSize', 12);
% xlabel('{\bf Time (s)}', 'FontSize', 12);
% xlim([0.05 0.0515]);
% ylim([-6 6]);
% %title('{\bf Board Acceleration Over Time}', 'FontSize', 32);

%%

%% FFT
% Calculations for frequency domain
t = mean(diff(time)); % take the average of the time differences shown in the time vector
Fs = 1/t; % sampling frequency make sure this matches with tested frequency
N = length(time); % number of samples
freq = Fs*(0:N/2)/N; % frequency bin calculation

[inputFFT] = computeFFT(input, N);
[outputFFT] = computeFFT(output, N);
% [topstrainFFT] = computeFFT(topstrain, N);
% [bottomstrainFFT] = computeFFT(bottomstrain, N);

% figure;
% plot(freq, abs(inputFFT));
% xlabel('Frequency (Hz)');
% ylabel('Magnitude');
% xlim([0 12000]);
% xticks(0:2000:12000);
% title('Input FFT');

% figure;
% plot(freq, abs(outputFFT), 'LineWidth', 2.0);
% xlabel('{\bf Frequency (Hz)}', 'FontSize', 24);
% ylabel('{\bf Magnitude}', 'FontSize', 24);
% xlim([0 12000]);
% xticks(0:2000:12000);
% ylim([0 32]);
% yticks(0:10:30);
% ax2 = gca;
% ax2.YColor = 'k';
% ax2.XColor = 'k';
% fontsize = 12;
% fonttype = 'Times New Roman';
% figurepos = [1 1];
% figuresize = [6 1.5];
% set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% set(gcf,'Units','inches','Position', [figurepos, figuresize]);
% % title('{\bf System Response FFT}', 'FontSize', 32);
% % xline([3680 3900 5700 10300]);
% % figure;
% % plot(freq, acc0phase);
% 
% figure;
% plot(freq, abs(outputFFT), 'LineWidth', 2.0);
% xlabel('{\bf Frequency (Hz)}', 'FontSize', 24);
% ylabel('{\bf Magnitude}', 'FontSize', 24);
% xlim([0 12000]);
% xticks(0:2000:12000);
% ylim([0 32]);
% yticks(0:10:30);
% ax2 = gca;
% ax2.YColor = 'k';
% ax2.XColor = 'k';
% fontsize = 12;
% fonttype = 'Times New Roman';
% figurepos = [1 1];
% figuresize = [6 1.5];
% set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% set(gcf,'Units','inches','Position', [figurepos, figuresize]);
% % title('{\bf System Response FFT}', 'FontSize', 32);

%% FRF
% Calculation for spectral densities
[Gxy0, Gyx0, Gyy0, Gxx0] = computeSpectralDensities(inputFFT, outputFFT);

% Calculations for Hw and Coherence
[coher0, Hw0] = computeHwCoherence(Gxy0, Gyx0, Gyy0, Gxx0);

% figure;
% % plot(freq, dataFRF);
% plot(freq, Hw0, 'LineWidth', 2.0);
% xlabel('{\bf Frequency (Hz)}');
% ylabel('{\bf Amplitude}');
% xlim([0 12000]);
% xticks(0:2000:12000);
% % title('System FRF');
% ax3 = gca;
% fontsize = 12;
% fonttype = 'Times New Roman';
% figurepos = [1 1];
% figuresize = [6 1.5];
% set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% set(gcf,'Units','inches','Position', [figurepos, figuresize]);
% % figure;
% % plot(freq, Hw_phase);

% figure;
% plot(freq, coher0,  'LineWidth', 2.0);
% xlabel('{\bf Frequency (Hz)}');
% ylabel('{\bf Coherence}');
% xlim([0 12000]);
% xticks(0:2000:12000);
% % title('System Coherence');
% ax4 = gca;
% fontsize = 12;
% fonttype = 'Times New Roman';
% figurepos = [1 1];
% figuresize = [6 1.5];
% set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% set(gcf,'Units','inches','Position', [figurepos, figuresize]);

%% Comparison Plot 1
% fnew = figure;
% ax2_copy = copyobj(ax2,fnew);
% subplot(3,1,1,ax2_copy)
% ax3_copy = copyobj(ax3,fnew);
% subplot(3,1,2,ax3_copy)
% ax4_copy = copyobj(ax4,fnew);
% subplot(3,1,3,ax4_copy)

%% Comparison Plot 2
% fnew = figure;
% ax1_copy = copyobj(ax1,fnew);
% subplot(5,1,[1,2],ax1_copy)
% ax2_copy = copyobj(ax2,fnew);
% subplot(5,1,[4,5],ax2_copy)



%% Functions
function [Gxy, Gyx, Gyy, Gxx] = computeSpectralDensities(inputFFT, responseFFT)

Gxy = sum((inputFFT).*conj(responseFFT),2);
Gyx = sum((responseFFT).*conj(inputFFT),2);
Gyy = sum(conj(responseFFT).*responseFFT,2);
Gxx = sum(conj(inputFFT).*inputFFT,2);

end

function [coher, Hw] = computeHwCoherence(Gxy, Gyx, Gyy, Gxx)

H1= Gyx./Gxx; %Assumes noise only on output/will capture antiresonance better  
H2 = Gyy./Gxy; %Assumes noise only on input/will capture resonance better

Hw = (H1+H2)./2; %FRF to minimize noise on input and output

coher= ((Gxy.*Gyx)./(Gxx.*Gyy));
% coher2 = H1./H2;

end

function [FFT] = computeFFT(response, N)

response_w_full = fft(response)/N;

response_w = response_w_full(1:N/2+1,:);
response_w(2:end-1,:) = 2*response_w(2:end-1,:);

FFT = response_w;

end

function [time, input, output, piezo1, piezo2, piezo3] = extractData(filename)
    disp(['Reading file: ', filename]);
    try
        data = dlmread(filename,'\t',12,0);
        AccelFSIN = 1;
        FSOUT = 1;
        input = data(:,2) .* AccelFSIN ./ FSOUT;
        output = data(:,3) .* AccelFSIN ./ FSOUT;
		time = data(:,1);
		piezo1 = data(:,4);
		piezo2 = data(:,5);
		piezo3 = data(:,6);
        
    catch ME
        disp('Error reading file:');
        disp(ME.message);
        rethrow(ME);
    end
end
