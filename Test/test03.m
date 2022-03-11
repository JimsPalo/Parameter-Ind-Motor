%% Solution
% Link: https://www.weg.net/catalog/weg/EC/en/Electric-Motors/Low-Voltage-NEMA-Motors/General-Purpose-/Cast-Iron-TEFC-General-Purpose/W22/W22-Super-Premium-Efficiency-5-HP-2P-182-4T-3Ph-208-230-460-380-V-60-Hz-IC411---TEFC---Foot-mounted/p/11792016

clc, clear

hp = 5; 
V = 220/sqrt(3);

pfh = 0.61;
nh= 0.881;

pff = 0.8;
nf = 0.895;
sf = 0.025;
Tfl = 5*746/(1755/60*2*pi);

Tst = Tfl*240/100;
tol = 1e-6;

[X1, X2, R1, R2, Rm, Xm] = induction_parameter(hp, V, pfh, nh, pff, nf, sf, Tfl, Tst, tol);

w = 2*pi*60;

L1 = X1/w*1e3;
L2 = X2/w*1e3;
Lm = Xm/w*1e3;

X1, X2, Xm, R1, R2, Rm
