function modofe = modofe(Material)

%MODOFE Outputs the modulus of elasticity of a specific material. 
%
%     Syntax: modofe = modofe(Matieral) outputs the Modulus of Elasticty
%                                       for the specific material.
%
%     Input:
%      material      The name/number of the input material
%
%     Output:
%      modofe        The modulus of elasticity of the specified material.
%
%   Adrian Gose
%   Hoover High School
%   0 Period - Mrs. Harris
%   November 29, 2012
%
    switch Material
        case 1
            modofe = 10E06;
        case 2
            modofe = 15.6E06;
        case 3
            modofe = 36.0E06;
        case 4 
            modofe = 15.6E06;
        case 5
            modofe = 28.5E06;
        case 6
            modofe = 2.6E06;
        case 7
            modofe = 30.0E06;
        case 8 
            modofe = 6.0E06;
        case 9 
            modofe = 16.8E06;
        case 10
            modofe = 12.0E06;    
    end