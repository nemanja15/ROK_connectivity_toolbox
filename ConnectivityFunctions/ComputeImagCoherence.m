function [AllCohs,f] = ComputeImagCoherence(Data, fs, n_fft)
% Inputs:
% Data is in the form [n_channels x n_time_points]
% fs = sampling frequency
% n_fft = number of fft points

% % overlap. If [], MATLAB sets it to 50%
noverlap = [];
n_channels = size(Data,1);
AllCohs = [];
% The dimensions of the output matrix will be n_channels x n_channels
% But the the matrix is symmetric. Coh(1,2) = Coh(2,1).
% So, I only calculate when j>i to save time.
for i=1:n_channels-1
       for j=i+1:n_channels
           
           % Use Hamming window
           Pxy = cpsd((Data(i,:)),(Data(j,:)), hamming(n_fft), [], n_fft, fs);
            Pxx = pwelch((Data(i,:)), hamming(n_fft), noverlap, n_fft, fs);
            Pyy = pwelch((Data(j,:)), hamming(n_fft), noverlap, n_fft, fs);
            Cxy = (Pxy)./sqrt((Pxx.*Pyy));
            iCohNow = imag(Cxy);
           % Dimensions of coherence: (n_electrodes-1)x(n_electrodes)x n_frequency_components 
           AllCohs(i,j,:) = iCohNow;
        end
end
[~,f] = cpsd((Data(i,:)),(Data(j,:)), hamming(n_fft), [], n_fft, fs);

% Output AllCohs is in the form [n_channels-1 x n_channels x n_frequency_bins]
% Output f gives the frequency bins in Hz
end
