function [x1,x2,y1,y2] = deflection(Beam,E,I)

%DEFLECTION Calculates the deflection of the beam.
%
%     Syntax: [x1,x2,y1,y2] = deflection(Beam,E,I) calculates the
%     deflection of a beam with the specified paramaters
%
%     Input:
%      Beam = Beam struct variables
%      E = Modulus of Elasticity of the Beam
%      I = Moment of Inertia of the Beam
%
%     Output:
%      x1 = X Values left of the point load (IF point type)
%      x2 = X Values right of the point load (IF point type)
%      y1 = Y Values left of the point load (IF point type)
%      y2 = Y Values right of the point load (IF point type)
%
%   Lawson Hoover
%   November 29, 2012
%

    a = Beam.Location;
    L = Beam.Length;
    F = Beam.Magnitude;
    b = Beam.Length-Beam.Location;
    o = Beam.Magnitude/Beam.Length;   % Magnitude is the same as the force
    
    x1 = linspace(0, a, 100);
    x2 = linspace(a, L, 100);

if Beam.Support == 1 % Cantilevered
    if Beam.Load == 1 % Point
        y1 = ((F.*x1.^2)/(6*E*I)).*(3*a-x1);    % 0<x<a
        y2 = ((F.*a^2)/(6*E*I)).*(3*x2-a);      % a<x<L
    elseif Beam.Load == 2 % Uniform
        y1 = ((o.*x1.^2)/(24*E*I)).*(x1.^2+6*L^2-4*L.*x1);
        y2 = ((o.*x2.^2)/(24*E*I)).*(x2.^2+6*L^2-4*L.*x2);
    end
elseif Beam.Support == 2 % Simply Supported
    if Beam.Load == 1 % Point
        y1 = ((F*b.*x1)/(6*L*E*I)).*(L^2-x1.^2-b^2);        %0<x<a
        y2 = ((F*b)/(6*E*L*I)).*((L/b).*(x2-a).^3+(L^2-b^2).*x2-x2.^3); % a<x<L
    elseif Beam.Load == 2 % Uniform
        y1 = ((o.*x1)/(24*E*I)).*((L^3)-(2*L.*x1.^2)+(x1.^3));
        y2 = ((o.*x2)/(24*E*I)).*((L^3)-(2*L.*x2.^2)+(x2.^3));
    end
else
    disp('Beam support type not found')
end