function I = inertia(bx, bw, bh, bt)

%INERTIA Calculates the Moment of Inertia for the specified Beam CrossSection. 
%
%     Syntax: I = inertia(Beam) outputs the Moment of Inertia for the
%     specified beam paramaters and beam type.
%
%     Input:
%      bx = Beam.CrossSection
%      bw = Beam.Width
%      bh = Beam.Height
%      bt = Beam.Thickness
%
%     Output:
%      I       The modulus of elasticity of the specified material.
%
%   Adrian Gose
%   Hoover High School
%   0 Period - Mrs. Harris
%   November 29, 2012
%

% Calculations
switch bx   
    case 1                                                                 %Solid Rectangle
        I = (bw * (bh^3)) / 12;
    case 2                                                                 %Hollow Rectangle
        I = ((bw * (bh^3)) / 12) - (((bw - (2 * bt)) * (bh - ((2 * bt))^3))/12);       
    case 3                                                                 %T Beam
        yc = bh - (((bt * (bh^2)) + ((bt^2) * (bw - bt)))/(2 * ((bw * bt) + (bh - bt)) * bt));
        I = (1/3) * (bt * (yc^3) + (bw *(bh - yc)^3) - ((bw - bt) * (bh - yc - bt)^3));     
    case 4                                                                 %I Beam
        I = (2 * bt * bw) * (1/2 * (bh - (2 * bt)) + (1/2 * bt))^2 + ((bt * (bh - (2 * bt))^ 3) / 12);   
    otherwise
        disp('Error: Invalid beam shape.')    
end