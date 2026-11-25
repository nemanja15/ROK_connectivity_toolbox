function Entropy = RoryEntropy(Input, n_bins)
Count = zeros(n_bins,1);
for b=1:n_bins
    Indices = find(Input==(b-1));
    Count(b) = length(Indices);
end
P = Count/sum(Count);
Product = zeros(n_bins,1);
for b=1:n_bins
    Product(b) = P(b)*(log2(P(b)+eps));
end
Entropy = -sum(Product);
end
