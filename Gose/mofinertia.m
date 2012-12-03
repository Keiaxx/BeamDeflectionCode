function inertia = mofinertia(beamtype)

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
bh = Beam.Height;

switch beamtype
    
    case 1                                                                 %Solid Rectangle
        inertia = bw * (bl^3) / 12;
        
    case 2                                                                 %Hollow Rectangle
        inertia = (bw * (bl^3) / 12) - (bw - 2 * bh) * (bl - 2 * bh)^3;
        
    case 3                                                                 %I Beam
        yc = bl - ((bh * bl^2) + bh^2 * (bw - bh))/(2 * bw * bh + (bl - bh) * bh);
        inertia = (1/3) * (bh * yc^3 + bw *(bl - yc)^3 - (bw - bh) * (bl - yc - bh)^3);
        
    case 4                                                                 %T Beam
        inertia = (2 * bh * bw) * (1/2 * (bl - 2 * bh) + 1/2 * bh)^2 + (bh * (bl - 2 * bh)^ 3) / 12;
        
    otherwise
        disp('Error: Invalid beam shape.')
        
end