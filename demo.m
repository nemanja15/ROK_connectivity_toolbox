addpath('src'); rng(7); fs=1000; t=(0:3999)/fs;
x=[sin(2*pi*20*t)+.3*randn(size(t)); sin(2*pi*20*t+.7)+.3*randn(size(t)); randn(size(t))];
[C,f]=ComputeCoherence(x,fs,256); P=ComputePLV(x);
plot(f,squeeze(C(1,2,:))); xlabel('Hz'); ylabel('Coherence'); disp(P);
