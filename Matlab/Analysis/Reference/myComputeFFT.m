function [responseFFT, inputFFT, dataFRF, freq] = myComputeFFT(Fs, time, input, response)
T = 1/Fs; %sampling period
N = length(time); %length of signal
t = (0:N-1)*T; %time vector %SHOULD MATCH EXPERIMENTAL time vector if Fs is correct

freq = Fs*(0:N/2)/N; %define frequency vector [Hz]
input_w_full = fft(input)/N;
response_w_full = fft(response)/N;

input_w = input_w_full(1:N/2+1,:);
input_w(2:end-1,:) = 2*input_w(2:end-1,:);

response_w = response_w_full(1:N/2+1,:);
response_w(2:end-1,:) = 2*response_w(2:end-1,:);

responseFFT = response_w;
inputFFT = input_w;
dataFRF = response_w./input_w; % frequency resonse function response(SUT)/input(reference)
end