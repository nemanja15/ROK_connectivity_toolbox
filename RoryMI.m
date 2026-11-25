function MI = RoryMI(x,y, histmethod)
% 1. assign each sample to a discrete value
% how many bins?
n = length(x);
% Normalize x and y
if max(x) == 0
    MaxX = 1;
else
    MaxX = max(x);
end
if max(y) == 0
    MaxY = 1;
else
    MaxY = max(y);
end
xN = x/MaxX;
yN = y/MaxY;
x_bins = ComputeNBins(xN);
y_bins = ComputeNBins(yN);
bin_limit = 15;
n_bins = min([round(mean([x_bins y_bins])) bin_limit]);
switch histmethod
    case 'eqpop'
        X = binr(xN', n, n_bins, histmethod);
        Y = binr(yN', n, n_bins, histmethod);
    case 'eqspace'
        X = EqualSpaced(xN, n_bins);
        Y = EqualSpaced(yN, n_bins);
end
Hx = RoryEntropy(X, n_bins);
Hy = RoryEntropy(Y, n_bins);
Hxy = RoryJointEntropy(X,Y,n_bins);  
MINow = Hx+Hy-Hxy;
% MIError = ((n_bins-1)^2)/(2*n*log(2));
MI = MINow;
% Don't Normalize output

end