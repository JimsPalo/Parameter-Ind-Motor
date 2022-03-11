# Parameter-Ind-Motor

## Brief desccription

This consists of a MatLab function that is based on the work of M. H. Haque, in which he describes how to estimate the parameters of an induction motor based on the data sheet.

The function is defined as follows:

`function [X1, X2, R1, R2, Rm, Xm] = induction_parameter(hp, V, pfh, nh, pff, nf, sf, Tfl, Tst, tol)`

## Inputs

Input:

- hp, nominal power in hp
- V, voltage line-ground
- pfh, power factor of half load
- nh, efficiency of half load
- pff, power factor of full load
- nf, efficiency of full load
- sf, slip of full load
- Tfl, torque of full load
- Tst, starting torque
- tol, tolerance

## Output

- X1, stator reactance
- X2, rotor reactance
- R1, stator resistance
- R2, rotor resistance
- Rm, exitation resistance
- Xm, excitation reactance

## Test

Different test are implemented and sum up in test folder which are based on [WEG Datasheet Motors](https://www.weg.net/catalog/weg/EC/en/Electric-Motors/Low-Voltage-NEMA-Motors/General-Purpose-/Cast-Iron-TEFC-General-Purpose/W22/W22-NEMA-Premium-Efficiency-5-HP-2P-182-4T-3Ph-230-460-V-60-Hz-IC411---TEFC---Foot-mounted/p/11611915).

## References

Haque, Mohammed H.. “Estimation of three-phase induction motor parameters.” Electric Power Systems Research 26 (1993): 187-193.