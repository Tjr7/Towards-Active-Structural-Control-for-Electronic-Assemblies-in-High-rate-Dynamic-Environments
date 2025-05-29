clc;
clear;
close all;

%% Data Fetching
filenames = {
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t01_CB01_h12-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t02_CB01_h15-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t03_CB01_h19-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t04_CB01_h11-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t05_CB01_h15-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t06_CB01_h19-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t07_CB01_h12-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t08_CB01_h16-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t09_CB01_h21-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t10_CB01_h13-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t11_CB01_h17-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t12_CB01_h17-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t13_CB01_h22-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t14_CB01_h28-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t15_CB01_h34-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t16_CB01_h22-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t17_CB01_h28-0m116F1.txt',
    'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t18_CB01_h34-0m116F1.txt',

	};	
% 	  'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t01_CB01_h12-0m116F1.txt',
%     'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t02_CB01_h15-0m116F1.txt',
%     'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t03_CB01_h19-0m116F1.txt',
%     'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t04_CB01_h11-0m116F1.txt',
%     'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t05_CB01_h15-0m116F1.txt',
%     'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t06_CB01_h19-0m116F1.txt',
%     'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t07_CB01_h12-0m116F1.txt',
%     'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t08_CB01_h16-0m116F1.txt',
%     'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t09_CB01_h21-0m116F1.txt',
%     'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t10_CB01_h13-0m116F1.txt',
%     'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t11_CB01_h17-0m116F1.txt',
%     'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t12_CB01_h17-0m116F1.txt',
%     'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t13_CB01_h22-0m116F1.txt',
%     'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t14_CB01_h28-0m116F1.txt',
%     'C:\Users\trott\Documents\Towards-Active-Structural-Control-for-Electronic-Assemblies-in-High-rate-Dynamic-Environments\Testing\07_15_2024\True_t15_CB01_h34-0m116F1.txt'

% % 'E:\SummerInterns\2024\CIRCULAR\Shaker\TestRoundBoard_Piezos_ImpactHammer1.txt',

num_files = length(filenames);
input = []; output = []; topstrain = []; bottomstrain = []; times = [];  
% times = []; input = []; output = []; piezo1 = []; piezo2 = []; piezo3 = []; 


for i = 1:num_files

    [time, input_f, output_f, topstrain_f, bottomstrain_f] = extractData(filenames{i});
	% [time, input_f, output_f, piezo1_f, piezo2_f, piezo3_f] = extractData(filenames{i});
    times = [times, time];
    output = [output, output_f];
    input = [input, input_f];
    topstrain = [topstrain, topstrain_f];
    bottomstrain = [bottomstrain, bottomstrain_f];
	% piezo1 = [piezo1, piezo1_f];
	% piezo2 = [piezo2, piezo2_f];
	% piezo3 = [piezo3, piezo3_f];
end

times = times-times(1,:);
%% plotting

MStimes = times*100;
outputkg = output/1000;
inputkg = input/1000;
topsg = (topstrain);
botsg = (bottomstrain);


figure;
subplot(2,1,1);
h = plot(MStimes, inputkg, 'LineWidth', 1.0);
set(h(1), 'LineStyle', '-.');
set(h(2), 'LineStyle', '--');
set(h(3), 'LineStyle', '-');
fontsize = 10;
fonttype = 'Times New Roman';
figurepos = [1 1];
figuresize = [7.5 3];
set(gca, 'LineWidth', 1.5, 'FontSize', fontsize, 'FontName', fonttype);
set(gcf, 'Units', 'inches', 'Position', [figurepos, figuresize]);
ylabel('{acceleration (kg)}', 'FontSize', 12);
xlabel('{time (ms)}', 'FontSize', 12);
xlim([5 5.15]);
legend('Test 16', 'Test 17', 'Test 18');
ax0 = gca;
ax0.YColor = 'k';
ax0.XColor = 'k';
grid on;

subplot(2,1,2);
g = plot(MStimes, outputkg, 'LineWidth', 1.0);
set(g(1), 'LineStyle', '-.');
set(g(2), 'LineStyle', '--');
set(g(3), 'LineStyle', '-');
fontsize = 10;
fonttype = 'Times New Roman';
figurepos = [1 1];
figuresize = [7.5 3];
set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
set(gcf,'Units','inches','Position', [figurepos, figuresize]);
ylabel('{acceleration (kg)}', 'FontSize', 12);
xlabel('{time (ms)}', 'FontSize', 12);
xlim([5 5.15]);
% xticks(0.05:0.0005:0.053);
ylim([-22 20]);
% title('Output Acceleration Over Time');
legend('Test 16','Test 17','Test 18')
ax1 = gca;
ax1.YColor = 'k';
ax1.XColor = 'k';
grid on

% figure;
% plot(times, piezo1, 'LineWidth', 2.0);
% fontsize = 12;
% fonttype = 'Times New Roman';
% % figurepos = [1 1];
% % figuresize = [6 1.5];
% set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% % set(gcf,'Units','inches','Position', [figurepos, figuresize]);
% ylabel('{\bf Voltage (g)}', 'FontSize', 12);
% xlabel('{\bf Time (s)}', 'FontSize', 12);
% xlim([3 3.001]);
% % xticks(0.05:0.0005:0.053);
% % ylim([-7500 17500]);
% title('Piezoi 1 Voltage Over Time');
% ax2 = gca;
% ax2.YColor = 'k';
% ax2.XColor = 'k';

% figure;
% plot(times, piezo2, 'LineWidth', 2.0);
% fontsize = 12;
% fonttype = 'Times New Roman';
% % figurepos = [1 1];
% % figuresize = [6 1.5];
% set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% % set(gcf,'Units','inches','Position', [figurepos, figuresize]);
% ylabel('{\bf Voltage (g)}', 'FontSize', 12);
% xlabel('{\bf Time (s)}', 'FontSize', 12);
% xlim([3 3.001]);
% % xticks(0.05:0.0005:0.053);
% % ylim([-7500 17500]);
% title('Piezoi 2 Voltage Over Time');
% ax3 = gca;
% ax3.YColor = 'k';
% ax3.XColor = 'k';

% figure;
% plot(times, piezo3, 'LineWidth', 2.0);
% fontsize = 12;
% fonttype = 'Times New Roman';
% % figurepos = [1 1];
% % figuresize = [6 1.5];
% set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% % set(gcf,'Units','inches','Position', [figurepos, figuresize]);
% ylabel('{\bf Voltage (g)}', 'FontSize', 12);
% xlabel('{\bf Time (s)}', 'FontSize', 12);
% xlim([3 3.001]);
% % xticks(0.05:0.0005:0.053);
% % ylim([-7500 17500]);
% title('Piezoi 3 Voltage Over Time');
% ax4 = gca;
% ax4.YColor = 'k';
% ax4.XColor = 'k';

% figure;
% plot(time, output);
% ylabel('Acceleration (g)');
% xlabel('Time (s)');
% title('Output Acceleration Over Time');
% ax1 = gca;

% figure;
% plot(outtimes, bottomstrain, 'LineWidth', 2.0);
% fontsize = 12;
% fonttype = 'Times New Roman';
% figurepos = [1 1];
% figuresize = [6.5 1.5];
% set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
% set(gcf,'Units','inches','Position', [figurepos, figuresize]);
% %ylabel('{\bf Acceleration (g)}', 'FontSize', 12);
% ylabel('{Strain}', 'FontSize', 12);
% xlabel('{\bf Time (s)}', 'FontSize', 12);
% xlim([0.05 0.053]);
% %ylim([-21000 21000]);
% % yticks(-20000:10000:20000);
% title('{\bf Board Acceleration Over Time}', 'FontSize', 32);
% ax1 = gca;
% ax1.YColor = 'k';
% ax1.XColor = 'k';
% ax1.FontName = 'Bombardier';
% ax1.FontSize = 12;

figure;

% First subplot
subplot(2,1,1);
i = plot(MStimes, topsg, 'LineWidth', 1.0);
set(i(1), 'LineStyle', '-.' );
set(i(2), 'LineStyle', '--');
set(i(3), 'LineStyle', '-');
fontsize = 10;
fonttype = 'Times New Roman';
figurepos = [1 1];
figuresize = [7.5 3];
set(gca, 'LineWidth', 1.5, 'FontSize', fontsize, 'FontName', fonttype);
set(gcf, 'Units', 'inches', 'Position', [figurepos, figuresize]);
ylabel('{micro strain}', 'FontSize', 12);
xlabel('{time (ms)}', 'FontSize', 12);
xlim([5 5.15]);
legend('Test 16', 'Test 17', 'Test 18');
grid on;

% Remove scientific notation from x and y axes
ytickformat('%.0f');  % For y-axis

% Additional adjustment to explicitly set Y-tick labels without scientific notation
ytick = get(gca, 'YTick'); 
set(gca, 'YTickLabel', arrayfun(@(x) sprintf('%.0f', x), ytick, 'UniformOutput', false));

% Second subplot
subplot(2,1,2);
j = plot(MStimes, botsg, 'LineWidth', 1.0);
set(j(1), 'LineStyle', '-.' );
set(j(2), 'LineStyle', '--');
set(j(3), 'LineStyle', '-');
set(gca, 'LineWidth', 1.5, 'FontSize', fontsize, 'FontName', fonttype);
set(gcf, 'Units', 'inches', 'Position', [figurepos, figuresize]);
ylabel('{micro strain}', 'FontSize', 12);
xlabel('{time (ms)}', 'FontSize', 12);
xlim([5 5.15]);
legend('Test 16', 'Test 17', 'Test 18');
grid on;

% Remove scientific notation from x and y axes
ytickformat('%.0f');  % For y-axis

% Additional adjustment to explicitly set Y-tick labels without scientific notation
ytick = get(gca, 'YTick'); 
set(gca, 'YTickLabel', arrayfun(@(x) sprintf('%.0f', x), ytick, 'UniformOutput', false));


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

figure;
subplot(1,1,1);
plot(freq, abs(outputFFT), 'LineWidth', 1.0);
xlabel('{frequency (Hz)}', 'FontSize', 12);
ylabel('{magnitude}', 'FontSize', 12);
xlim([0 12000]);
xticks(0:2000:12000);
ylim([0 32]);
yticks(0:10:30);
ax2 = gca;
ax2.YColor = 'k';
ax2.XColor = 'k';
fontsize = 11;
fonttype = 'Times New Roman';
figurepos = [1 1];
figuresize = [7.5 1.5];
set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
set(gcf,'Units','inches','Position', [figurepos, figuresize]);
grid on

% title('{\bf System Response FFT}', 'FontSize', 32);
% xline([3680 3900 5700 10300]);
% figure;
% plot(freq, acc0phase);
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

Hw10 = abs(Hw0);

figure;
% plot(freq, dataFRF);
subplot(1,1,1);
plot(freq, abs(Hw0), 'LineWidth', 1.0);
xlabel('{frequency (Hz)}');
ylabel('{amplitude}');
xlim([0 12000]);
xticks(0:2000:12000);
% title('System FRF');
ax3 = gca;
fontsize = 11;
fonttype = 'Times New Roman';
figurepos = [1 1];
figuresize = [7.5 1.5];
set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
set(gcf,'Units','inches','Position', [figurepos, figuresize]);
% legend('FRF','FRF Magnitude')
% figure;
% plot(freq, Hw_phase);
grid on

figure;
subplot(1,1,1);
plot(freq, coher0, 'LineWidth', 1.0); 
hold on
plot([0 12000],[0.9 0.9],'r--','Linewidth', 0.5);
% hold on
% plot([0 12000],[0.5 0.5],'r--','Linewidth', 0.5);
xlabel('{frequency (Hz)}');
ylabel('{coherence}');
xlim([0 12000]);
xticks(0:2000:12000);
% title('System Coherence');
ax4 = gca;
fontsize = 11;
fonttype = 'Times New Roman';
figurepos = [1 1];
figuresize = [7.5 1.5];
set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
set(gcf,'Units','inches','Position', [figurepos, figuresize]);
grid on


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

% FFT for strain data (topstrain and bottomstrain)
% Subtract the mean of the strain data (remove DC component)
topstrain_detrended = topstrain - mean(topstrain);
bottomstrain_detrended = bottomstrain - mean(bottomstrain);

% Compute FFT for the detrended strain data
[topstrainFFT] = computeFFT(topstrain_detrended, N);
[bottomstrainFFT] = computeFFT(bottomstrain_detrended, N);

% Plot FFT for topstrain
figure;
% subplot(2,1,1);
plot(freq, abs(topstrainFFT), 'LineWidth', 1.0);
xlabel('frequency (Hz)', 'FontSize', 12);
ylabel('magnitude', 'FontSize', 12);
xlim([0 12000]); % adjust frequency range if needed
xticks(0:2000:12000);
ylim([0 15]);
yticks(0:5:15);
% title('FFT of Top Strain Data');
fonttype = 'Times New Roman';
figurepos = [1 1];
figuresize = [7.5 1.5];
set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
set(gcf,'Units','inches','Position', [figurepos, figuresize]);
grid on;

% Plot FFT for bottomstrain
% subplot(2,1,2);
figure;
plot(freq, abs(bottomstrainFFT), 'LineWidth', 1.0);
xlabel('frequency (Hz)', 'FontSize', 12);
ylabel('magnitude', 'FontSize', 12);
xlim([0 12000]); % adjust frequency range if needed
xticks(0:2000:12000);
ylim([0 15]);
yticks(0:5:15);
% title('FFT of Bottom Strain Data');
fonttype = 'Times New Roman';
figurepos = [1 1];
figuresize = [7.5 1.5];
set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
set(gcf,'Units','inches','Position', [figurepos, figuresize]);
grid on;
% % Plot FFT for topstrain
% figure;
% subplot(2,1,1);
% plot(freq, abs(topstrainFFT), 'LineWidth', 1.0);
% xlabel('Frequency (Hz)', 'FontSize', 12);
% ylabel('Magnitude', 'FontSize', 12);
% xlim([0 12000]); % adjust frequency range if needed
% xticks(0:2000:12000);
% title('FFT of Top Strain Data');
% grid on;
% 
% % Plot FFT for bottomstrain
% subplot(2,1,2);
% plot(freq, abs(bottomstrainFFT), 'LineWidth', 1.0);
% xlabel('Frequency (Hz)', 'FontSize', 12);
% ylabel('Magnitude', 'FontSize', 12);
% xlim([0 12000]); % adjust frequency range if needed
% xticks(0:2000:12000);
% title('FFT of Bottom Strain Data');
% grid on;



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

function [time, input, output, topstrain, bottomstrain] = extractData(filename)
% function [time, input, output, piezo1, piezo2, piezo3] = extractData(filename)
    disp(['Reading file: ', filename]);
    try
        data = dlmread(filename,'\t',9,0);
        AccelFSIN = 1;
        FSOUT = 1;
        input = data(:,1) .* AccelFSIN ./ FSOUT;
        output = data(:,2) .* AccelFSIN ./ FSOUT;
        topstrain = data(:,3);
        bottomstrain = data(:,4);
		time = data(:,5);
		% piezo1 = data(:,4);
		% piezo2 = data(:,5);
		% piezo3 = data(:,6);
        
    catch ME
        disp('Error reading file:');
        disp(ME.message);
        rethrow(ME);
    end
end
