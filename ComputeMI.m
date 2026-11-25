function AllMIs = ComputeMI(Data)
n_channels = size(Data,1);
AllMIs = [];
for i=1:n_channels-1
       for j=i+1:n_channels
           [MINow] = RoryMI((Data(i,:)), (Data(j,:)),'eqspace');
           AllMIs(i,j,:) = MINow;
        end
end
% Output AllMIs is in the form [n_channels-1 x n_channels]

end