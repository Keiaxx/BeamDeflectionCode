function [x1, x2, y1, y2] = deflection(Beam)
%Elasticity_Deflection Finds the Modulous of elacticity and then uses that to find the amount of deflection
%   Should be used in conjunction with the beam_deflection program and
%           nothing else

% Started by Lawson Hoover and Edited/Revised by Adrian Gose

I = Beam.Inertia;
a = Beam.Location;
F = Beam.Magnitude;
L = Beam.Length;
b = Beam.Length-Beam.Location;

o = Beam.Magnitude/Beam.Length;   % Magnitude is them same as the force
E = Beam.Elasticity;

x1 = linspace(0, Beam.Length, 100);
x2 = linspace(0, Beam.Length, 100);


if Beam.Support == 1 % Cantilevered
    if Beam.Load == 1 % Point
        y1 = (F.*x1.^2/6*E*I).*(3*a-x1);    % 0<x<a
        y2 = (F.*a^2/6*E*I).*(3*x2-a);      % a<x<L
    elseif Beam.Load == 2 % Uniform
        y1 = (o.*x1.^2/24*E*I).*(x1.^2+6*L^2-4*L.*x1);
        y2 = (o.*x2.^2/24*E*I).*(x2.^2+6*L^2-4*L.*x2);
    end
elseif Beam.Support == 2 % Simply SUpported
    if Beam.Load == 1 % Point
        y1 = (F*b.*x1/6*L*E*I).*(L^2-x1.^2-b^2);                    % 0<x<a
        y2 = (F*b/6*E*L*I).*((L/b).*(x2-a).^3+(L^2-b^2).*x2-x2.^3); % a<x<L
    elseif Beam.Load == 2 % Uniform
        y1 = (o.*x1.^2/24*E*I).*((L^3-2*L.*x1.^2)+x1.^3);
        y2 = (o.*x2.^2/24*E*I).*((L^3-2*L.*x2.^2)+x2.^3);
    end
    
       
end

