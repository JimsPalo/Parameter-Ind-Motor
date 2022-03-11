function [X1, X2, R1, R2, Rm, Xm] = induction_parameter(hp, V, pfh, nh, pff, nf, sf, Tfl, Tst, tol)
%     Estimate the induction motor parameter for the exact circuit
%     Input: 
%         hp, nominal power in hp
%         V, voltage line-ground
%         pfh, power factor of half load
%         nh, efficiency of half load
%         pff, power factor of full load
%         nf, efficiency of full load
%         sf, slip of full load
%         Tfl, torque of full load
%         Tst, starting torque
%         tol, tolerance
%     
%     Output: 
%         X1, stator reactance
%         X2, rotor reactance
%         R1, stator resistance
%         R2, rotor resistance
%         Rm, exitation resistance
%         Xm, excitation reactance

    %% Stator Current 

    I1h = (746*hp/2)/(3*V*pfh*nh);  % Stator current half load
    I1f = (746*hp)/(3*V*pff*nf);  % stator current full load

    %% Itial asummtions 
    Prot = 0;

    % Rotor Voltage
    EH = V;             % Rotor voltage half load
    Ef = V;             % Rotor voltage full load

    % Rotor Current 
    I2h = I1h*pfh;      % Half load
    I2f = I1f*pff;      % Full load

    % Errror
    Err = 10000;
    while (Err > tol)

        %% Rotor Resistance

        R2 = (hp*746 + Prot)*sf/(3*I2f^2*(1-sf));

        %% Solve for R1 and Pconst

        A =[ 3*I1h^2,  1,  746*hp/2*(1/nh - 1) - 3*I2h^2*R2 
             3*I1f^2,  1,  746*hp*(1/nf - 1) - 3*I2f^2*R2   ];

         B = rref(A);

         R1 = B(1, end);
         Pconst = B(2, end);

         %% Rm determination 

         Rm = 3*(Ef^2)/(0.5*Pconst);

        %% Calcultation of Xt

        Xt = Tfl/Tst*3*V^2*R2/(746*hp)*(1 - sf) - (R1 + R2)^2;

        Xt = sqrt(Xt);

        %% X1 and X2 determination

        X1 = Xt*0.5;

        X2 = Xt*0.5;

        %% Xm calculation

        thetaf = acos(pff);
        Xm = (Ef^2)/(V*I1f*sin(thetaf) - I1f^2*X1 - I2f^2*X2 );

        %% Error calculation

        % Mechanical power losses 
        Prot01 = 0.5*Pconst;

        Err = abs(Prot-Prot01);           % Error calculation

        %% Update the values

        % Mechanical power losses 
        Prot = Prot01;

        % Rotor Voltage
        Z1 = R1 + 1j*X1;

        EH = abs(V - I1h*Z1);             % Rotor voltage half load
        Ef = abs(V - I1f*Z1);             % Rotor voltage full load

        % Rotor Current 
        Zm = Rm*(1j*Xm)/(Rm + 1j*Xm);

        I2h = abs(I1h - EH/Zm);      % Half load
        I2f = abs(I1f - Ef/Zm);      % Full load

    end

end
