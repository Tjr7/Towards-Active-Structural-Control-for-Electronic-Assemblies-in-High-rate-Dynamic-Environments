function [coher, Hw] = myComputeHwCoherence(inputFFT, responseFFT)

Gxy = sum((inputFFT).*conj(responseFFT),2);
Gyx = sum((responseFFT).*conj(inputFFT),2);
Gyy = sum(conj(responseFFT).*responseFFT,2);
Gxx = sum(conj(inputFFT).*inputFFT,2);

H1= Gyx./Gxx; %Assumes noise only on output  
H2 = Gyy./Gxy; %Assumes noise only on input

Hw = (H1+H2)./2; %FRF to minimize noise on input and output

% coher2 = H1./H2;
coher= ((Gxy.*Gyx)./(Gxx.*Gyy));
end