function NBins = ComputeNBins(Input)
% Friedman-Daconis
Num = max(Input)-min(Input);
IQR = iqr(Input);
n = length(Input);
Den = (2*IQR*(n^(-1/3)));
NBins = Num/Den;

end