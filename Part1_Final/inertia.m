%% Process - Moment of Inertia
% Inertia function created by Adrian Gose
% function inertia = mofinertia(bt,bw,bl,bh)
% MOFINERTIA Outputs the modulus of elasticity of a specific material.
%     inertia = mofinertia(bt,bw,bl,bh) Returns the moment of inertia depending
%     on the beam shape. 
function I = inertia(Beam)
bx = Beam.CrossSection;
bw = Beam.Width;
bh = Beam.Height;
if bx == 1   % If the beam type is a Solid Rectangle, Don't set the BT Variable as there will be no thickness to relieve from the error. 
    bt = [];
else
    bt = Beam.Thickness;
end
% Calculations
switch bx   
    case 1                                                                 %Solid Rectangle
        I = (bw * (bh^3)) / 12;
    case 2                                                                 %Hollow Rectangle
        I = ((bw * (bh^3)) / 12) - (((bw - (2 * bt)) * (bh - ((2 * bt))^3))/12);       
    case 3                                                                 %I Beam
        yc = bh - (((bt * (bh^2)) + ((bt^2) * (bw - bt)))/(2 * ((bw * bt) + (bh - bt)) * bt));
        I = (1/3) * (bt * (yc^3) + (bw *(bh - yc)^3) - ((bw - bt) * (bh - yc - bt)^3));     
    case 4                                                                 %T Beam
        I = (2 * bt * bw) * (1/2 * (bh - (2 * bt)) + (1/2 * bt))^2 + ((bt * (bh - (2 * bt))^ 3) / 12);   
    otherwise
        disp('Error: Invalid beam shape.')    
end