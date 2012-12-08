%% Process - Modulus of Elasticity
% Elasticity function created by Lawson Hoover
% function [y1, y2, x] = Elasticity_Deflection(z)
% Elasticity_Deflection Finds the Modulous of elacticity and then uses that to find the amount of deflection
%   Should be used in conjunction with the beam_deflection program and
%           nothing else 
% Checking To see what the material is and then get the Elasticity
function E=modofe(Beam)
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