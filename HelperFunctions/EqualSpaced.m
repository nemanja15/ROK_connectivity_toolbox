function Output = EqualSpaced(Input, n_bins)
edges = linspace(min(Input),max(Input),n_bins);
Output = discretize(Input, edges);
end
