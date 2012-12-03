function inertia = inertia(beamtype)

%INERTIA Outputs the modulus of elasticity of a specific material.
%
%     inertia = inertia(beamtype) Returns the moment of inertia depending
%     on the beam shape.
%
%     Input:
%      beamtype      The type of beam (1, 2, 3, 4: Solid, Hollow, I and T
%      Respectively)
%
%     Output:
%      inertia       The Moment of inertia.

%
%   Adrian Gose
%   Hoover High School
%   0 Period - Mrs. Harris
%   December 2, 2012
%

%Calculations

bw = Beam.Width;
bl = Beam.Length;
bt = Beam.Thickness;

switch beamtype
    
    case 1                                                                 %Solid Rectangle
        inertia = bw * (bl^3) / 12;
        
    case 2                                                                 %Hollow Rectangle
        inertia = (bw * (bl^3) / 12) - (bw - 2 * bt) * (bl - 2 * bt)^3;
        
    case 3                                                                 %I Beam
        yc = bl - ((bt * bl^2) + bt^2 * (bw - bt))/(2 * bw * bt + (bl - bt) * bt);
        inertia = (1/3) * (bt * yc^3 + bw *(bl - yc)^3 - (bw - bt) * (bl - yc - bt)^3);
        
    case 4                                                                 %T Beam
        inertia = (2 * bt * bw) * (1/2 * (bl - 2 * bt) + 1/2 * bt)^2 + (bt * (bl - 2 * bt)^ 3) / 12;
        
    otherwise
        disp('Error: Invalid beam shape.')
        
end