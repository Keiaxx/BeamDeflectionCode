function modofe = modofe(material)

%MODOFE Outputs the modulus of elasticity of a specific material. 
%
%     outmat = gose_randmat(nrow,ncol,llimit,ulimit) returns a nrow x ncol
%             array of random integers between llimit and ulimit.
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

switch lower(material)
    
    case 'aluminum'
        modofe = 10.0 * 10^6;
        
    case 'brass'
        modofe = 15.9 * 10^6;
        
    case 'chromium'
        modofe = 36.0 * 10^6;
        
    case 'copper'
        modofe = 15.6 * 10^6;
        
    case 'iron'
        modofe = 28.5 * 10^6;
        
    case 'lead'
        modofe = 2.6 * 10^6;
        
    case 'steel'
        modofe = 30.0 * 10^6;
        
    case 'tin'
        modofe = 6.0 * 10^6;
        
    case 'titanium'
        modofe = 16.8 * 10^6;
        
    case 'zinc'
        modofe = 12.0 * 10^6;
        
    otherwise
        modofe = 0;
        
        
end