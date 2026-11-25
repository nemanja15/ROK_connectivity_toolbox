function AllPLVs = ComputePLV(Data)
% Input:
% Data is in the form [n_channels x n_time_points]

n_channels = size(Data,1);
AllPLVs = [];

for i=1:n_channels-1
       for j=i+1:n_channels
           [PLVNow] = ComputePLVTime((Data(i,:)), (Data(j,:)));
           AllPLVs(i,j) = PLVNow;
        end
end
% Output AllPLVs is in the form [n_channels-1 x n_channels]
end
