function [y1, y2, x] = deflection(Beam)
%Elasticity_Deflection Finds the Modulous of elacticity and then uses that to find the amount of deflection
%   Should be used in conjunction with the beam_deflection program and
%           nothing else 

% Checking To see what the material is and then get the Elasticity 
    switch Beam.Material
        case 1
            E = 10E06;
        case 2
            E = 15.6E06;
        case 3
            E = 36.0E06;
        case 4 
            E = 15.6E06;
        case 5
            E = 28.5E06;
        case 6
            E = 2.6E06;
        case 7
            E = 30.0E06;
        case 8 
            E = 6.0E06;
        case 9 
            E = 16.8E06;
        case 10
            E = 12.0E06;    
    end

% Checking to see what the Load and support type is 

    I = Beam.Inertia;
    a = Beam.Location;
    F = Beam.Magnitude;
    L = Beam.Length;
    b = Beam.Length-Beam.Location;
    x = linspace(0,Beam.Length);
    o = Beam.Magnitude/Beam.Length;   % Magnitude is them same as the force

    if Beam.Load == 1    % Referring to the point in the list during the selection
        if Beam.Support == 1 
            y1 = (F.*x.^2/6*E*I).*(3*a-x);     % 0<x<a
            y2 = (F.*a^2/6*E*I).*(3*x-a);      % a<x<L
        else  % x.Support == 2
            y1 = (F*b.*x/6*L*E*I).*(L^2-x.^2-b^2);                  % 0<x<a
            y2 = (F*b/6*E*L*I).*((L/b).*(x-a).^3+(L^2-b^2).*x-x.^3);  % a<x<L
        end
    else    % x.Load == 2
        if Beam.Support == 1
            y1 = (o.*x.^2/24*E*I).*(x.^2+6*L^2-4*L.*x);
            y2 = 0;
        else % x.Support == 2 
            y1 = (o.*x.^2/24*E*I).*((L^3-2*L.*x.^2)+x.^3);
            y2 = 0;
        end
    end
        
 



