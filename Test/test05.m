%% Solution
% Link: https://www.weg.net/catalog/weg/EC/en/Electric-Motors/Low-Voltage-NEMA-Motors/General-Purpose-/Cast-Iron-TEFC-General-Purpose/W22/W22-High-Efficiency-20-HP-4P-254-6T-3Ph-230-460-380-V-60-50-Hz-IC411---TEFC---Foot-mounted/p/11466769

clc, clear

hp = 20; 
V = 230/sqrt(3);

pfh = 0.72;
nh= 0.902;

pff = 0.85;
nf = 0.91;
sf = 0.0194;
Tfl = hp*746/(1765/60*2*pi);

Tst = Tfl*200/100;
tol = 1e-6;

[X1, X2, R1, R2, Rm, Xm] = induction_parameter(hp, V, pfh, nh, pff, nf, sf, Tfl, Tst, tol);

w = 2*pi*60;

L1 = X1/w*1e3;
L2 = X2/w*1e3;
Lm = Xm/w*1e3;

X1, X2, Xm, R1, R2, Rm
