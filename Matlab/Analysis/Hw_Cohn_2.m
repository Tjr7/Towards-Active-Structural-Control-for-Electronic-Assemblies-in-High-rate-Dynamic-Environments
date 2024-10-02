clc;
clear;
close all;

%% Data Fetching
filenames = {
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t01_CB01_h12-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t02_CB01_h15-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t03_CB01_h19-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t04_CB01_h11-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t05_CB01_h15-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t06_CB01_h19-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t07_CB01_h12-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t08_CB01_h16-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t09_CB01_h21-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t10_CB01_h13-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t11_CB01_h17-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t12_CB01_h17-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t13_CB01_h22-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t14_CB01_h28-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t15_CB01_h34-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t16_CB01_h22-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t17_CB01_h28-0m116F1.txt',
    'E:\SummerInterns\2024\CIRCULAR\Testing\07_15_2024\t18_CB01_h34-0m116F1.txt',
};
num_files = length(filenames);
input = []; output = []; times = [];

for i = 1:num_files
    try
        [input_f, output_f, time] = extractData(filenames{i});
        times = [times; time]; % Use semicolon to concatenate as a column vector
        output = [output; output_f]; % Use semicolon to concatenate as a column vector
        input = [input; input_f]; % Use semicolon to concatenate as a column vector
    catch ME
        fprintf('Error processing file: %s\n', filenames{i});
        fprintf('Error message: %s\n', ME.message);
    end
end

figure;
plot(times, output);
ylabel('{\bf Acceleration (g)}', 'FontName', 'Arial');
xlabel('{\bf Time (s)}', 'FontName', 'Arial');
xlim([0.05 0.053]);
ylim([-21000 21000]);
yticks(-20000:10000:20000);
title('{\bf Output Acceleration Over Time}', 'FontName', 'Arial');
ax1 = gca;
ax1.YColor = 'k';
ax1.XColor = 'k';
fontsize = 15;
fonttype = 'Arial Black';
figurepos = [1 1];
figuresize = [16 10];
set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
set(gcf,'Units','inches','Position', [figurepos, figuresize]);

%% FFT
% Calculations for frequency domain
if length(times) > 1
    t = mean(diff(times)); % take the average of the time differences shown in the time vector
    Fs = 1/t; % sampling frequency make sure this matches with tested frequency
    N = length(times); % number of samples
    freq = Fs*(0:N/2)/N; % frequency bin calculation

    [inputFFT] = computeFFT(input, N);
    [outputFFT] = computeFFT(output, N);

    figure;
    plot(freq, abs(outputFFT));
    xlabel('{\bf Frequency (Hz)}', 'FontName', 'Arial');
    ylabel('{\bf Magnitude}', 'FontName', 'Arial');
    xlim([0 12000]);
    xticks(0:2000:12000);
    ylim([0 32]);
    title('{\bf Response FFT}', 'FontName', 'Arial');
    ax2 = gca;
    ax2.YColor = 'k';
    ax2.XColor = 'k';
    fontsize = 15;
    fonttype = 'Arial Black';
    figurepos = [1 1];
    figuresize = [16 10];
    set(gca,'LineWidth',1.5,'FontSize',fontsize,'FontName',fonttype)
    set(gcf,'Units','inches','Position', [figurepos, figuresize]);
else
    disp('Not enough data points to compute FFT.');
end

%% Functions
function [Gxy, Gyx, Gyy, Gxx] = computeSpectralDensities(inputFFT, responseFFT)
    Gxy = sum((inputFFT).*conj(responseFFT),2);
    Gyx = sum((responseFFT).*conj(inputFFT),2);
    Gyy = sum(conj(responseFFT).*responseFFT,2);
    Gxx = sum(conj(inputFFT).*inputFFT,2);
end

function [coher, Hw] = computeHwCoherence(Gxy, Gyx, Gyy, Gxx)
    H1= Gyx./Gxx; % Assumes noise only on output/will capture antiresonance better  
    H2 = Gyy./Gxy; % Assumes noise only on input/will capture resonance better
    Hw = (H1+H2)./2; % FRF to minimize noise on input and output
    coher = ((Gxy.*Gyx)./(Gxx.*Gyy));
end

function [FFT] = computeFFT(response, N)
    response_w_full = fft(response)/N;
    response_w = response_w_full(1:N/2+1,:);
    response_w(2:end-1,:) = 2*response_w(2:end-1,:);
    FFT = response_w;
end

function [input, output, time] = extractData(filename)
    disp(['Reading file: ', filename]);
    try
        data = dlmread(filename,'\t',8,0);
        AccelFSIN = 20000;
        FSOUT = 10;
        input = data(:,1) .* AccelFSIN ./ FSOUT;
        output = data(:,2) .* AccelFSIN ./ FSOUT;
        time = data(:,end);
    catch ME
        disp('Error reading file:');
        disp(ME.message);
        rethrow(ME);
    end
end
