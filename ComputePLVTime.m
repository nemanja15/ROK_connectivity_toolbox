function PLV = ComputePLVTime(S1, S2)
Hilbert1 = hilbert(S1);
phase_sig1 = angle(Hilbert1);
Phase_Sig1 = unwrap(phase_sig1);
Hilbert2 = hilbert(S2);
phase_sig2 = angle(Hilbert2);
Phase_Sig2 = unwrap(phase_sig2);
E  = exp(1i*(Phase_Sig1 - Phase_Sig2));
PLV = abs(sum(E))/length(E);
end