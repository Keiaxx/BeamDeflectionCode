function modofe = modofe(Beam)

%MODOFE Outputs the modulus of elasticity of a specific material. 
%
%     modofe(Beam) = modulus of elasticity for the beam
%
%     Input:
%      material      The name of the input material
%
%     Output:
%      modofe        The modulus of elasticity of the specified material.

%
%   Adrian Gose
%   Hoover High School
%   0 Period - Mrs. Harris
%   November 29, 2012
%

%Calculations

switch Beam.Material
    
    case 1
        modofe = 10.0 * 10^6;
        
    case 2
        modofe = 15.9 * 10^6;
        
    case 3
        modofe = 36.0 * 10^6;
        
    case 4
        modofe = 15.6 * 10^6;
        
    case 5
        modofe = 28.5 * 10^6;
        
    case 6
        modofe = 2.6 * 10^6;
        
    case 7
        modofe = 30.0 * 10^6;
        
    case 8
        modofe = 6.0 * 10^6;
        
    case 9
        modofe = 16.8 * 10^6;
        
    case 10
        modofe = 12.0 * 10^6;
        
    otherwise
        disp('Error: Invalid beam material.')
        
        
end