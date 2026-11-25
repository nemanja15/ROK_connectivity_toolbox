function [AllCohs,f] = ComputeCoherence(Data, fs, n_fft)
% Inputs:
% Data is in the form [n_channels x n_time_points]
% fs = sampling frequency
% n_fft = number of fft points

% noverlap = percentage overlap. If [], MATLAB sets it to 50%
noverlap = [];
n_channels = size(Data,1);
AllCohs = [];
% The dimensions of the output matrix will be n_channels x n_channels
% But the the matrix is symmetric. Coh(1,2) = Coh(2,1).
% So, I only calculate when j>i to save time.
for i=1:n_channels-1
       for j=i+1:n_channels
           C1 = Data(i,:);
           C2 = Data(j,:);
            [CohNow,~] = mscohere((C1), (C2), hamming(n_fft),noverlap,n_fft,round(fs));
           % Dimensions of coherence: (n_electrodes-1)x(n_electrodes)x n_frequency_components 
           AllCohs(i,j,:) = CohNow;
        end
end
[~,f] = mscohere((C1), (C2), hamming(n_fft),noverlap,n_fft,round(fs));   

% Output AllCohs is in the form [n_channels-1 x n_channels x n_frequency_bins]
% Output f gives the frequency bins in Hz
end