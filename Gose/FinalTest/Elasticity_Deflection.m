function [y1, y2, x] = Elasticity_Deflection(Beam)
%Elasticity_Deflection Finds the Modulous of elacticity and then uses that to find the amount of deflection
%   Should be used in conjunction with the beam_deflection program and
%           nothing else 


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
        
 



