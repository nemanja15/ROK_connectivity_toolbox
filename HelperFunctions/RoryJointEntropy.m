function JointEntropy = RoryJointEntropy(X, Y, n_bins)
Count = zeros(n_bins);
for i=1:n_bins
    XIndices = find(X==(i-1));
    for j=1:n_bins
        YIndices = find(Y==(j-1));
        CommonValues = intersect(XIndices, YIndices);
        Count(i,j) = length(CommonValues);
    end
end
P = Count/sum(sum(Count));
Product = zeros(n_bins);
for i=1:n_bins
    for j=1:n_bins
    Product(i,j) = P(i,j)*(log2(P(i,j)+eps));
    end
end
JointEntropy = -sum(sum(Product));
end

