%% Solution
% Link: https://www.weg.net/catalog/weg/EC/en/Electric-Motors/Low-Voltage-NEMA-Motors/General-Purpose-/Cast-Iron-TEFC-General-Purpose/W22/W22-Super-Premium-Efficiency-5-HP-2P-182-4T-3Ph-208-230-460-380-V-60-Hz-IC411---TEFC---Foot-mounted/p/11792016

clc, clear

hp = 5; 
V = 230/sqrt(3);

pfh = 0.78;
nh= 0.855;

pff = 0.89;
nf = 0.875;
sf = 0.0306;
Tfl = 5*746/(3490/60*2*pi);

Tst = Tfl*200/100;
tol = 1e-6;

[X1, X2, R1, R2, Rm, Xm] = induction_parameter(hp, V, pfh, nh, pff, nf, sf, Tfl, Tst, tol);

w = 2*pi*60;

L1 = X1/w*1e3;
L2 = X2/w*1e3;
Lm = Xm/w*1e3;

L1, L2, Lm, R1, R2, Rm
