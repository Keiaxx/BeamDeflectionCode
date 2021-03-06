% Filename = beam_deflection_final.m
% -------------------------------
% Lawson Hoover, Adrian Gose, Ryan Starcher
% Engineering Computations with MATLAB
% Beam Deflection Project: Basecamp Group #10
%
% Start Date: November 28, 2012
% Last Revised: December 3, 2012
% 
% Purpose: To gather and store all of the required input for the beam deflection program.
% 
% Variables:Csection = The cell array of options for Cross section 
%           Beam.CrossSection = the cross section chosen in the list number Based off of Csection array
%           A = The Prompts for Diensons if it is not a solid rectangle 
%           B = The Prompts for Diensons if it is a solid rectangle 
%           Dimen = the dimensons of the Beam in a cell array
%           Lmaterial = cell array of all the optional matrial in the
%                      matrial list
%           Beam.Material = Material choosen in position to material array
%           Beam.Length = length of the beam
%           Beam.Width = width of the beam
%           Beam.Height = height of the beam 
%           Beam.Thickness = thickness of the beam
%           loadType = array of loads to choose from
%           Beam.Load = Load chosse in position to loadtype
%           supportP = array of support to choose from
%           Beam.Support = Load chosse in position to supportP
%           MagLoc = is the inputed magnitude and location of the force on the beam
%           Beam.Magnitude = the magnitude of the force
%           Beam.Location = the location of the beam 
%
% Functions Called: N/A
% 
% --------------------------------------------------------------------------
% 
% Begin:

%% Input
% Created by Laswon Hoover
% function [] = beam_deflection_input(varargin) 
% beam_deflection_input This is the input function that gathers all required data to start the beam deflection program.
% 
% Beam Parameters  ( This Sections is gathering all needed input about the Beam)

    Csection = {'Solid Rectangle','Hollow Rectangle','T-beam','I-beam'};
    Beam.CrossSection = listdlg('Name','Cross Section Type','ListString',...
                Csection,'PromptString','Chose a cross section','SelectionMode',...
                'single','ListSize',[200,170]);
    %Beam.CrossSection = Csection(CrossSection);   // If I need the actual name and not the number
    

    if Beam.CrossSection ~= 1 % Is Checking to see what Bea was chosen 
        Prompt = {'What is the length of the Beam (in.)?','What is the width of the Beam (in.)?',...  % all of these things are input for the inputdlg
        'What is the height of the Beam (in.)?','What is the thickness of the Beam (in.)?'}; % also applies to similar situations 
        dlg_title = 'Dimensons of the Beam.';                                                         %
        num_lines = 1;                                                                                %
        def = {'4','4','6','3'};                                                                      %
        options.Resize = 'on';                                                                        %

        Dimen = inputdlg(Prompt,dlg_title,num_lines,def,options);     
        Beam.Length = str2double(Dimen(1,1));   % Doing this So I can get the required number for each aspect.
        Beam.Width = str2double(Dimen(2,1));    % STR2DOUBLE is used to convert the strings to numbers 
        Beam.Height = str2double(Dimen(3,1));
        Beam.Thickness = str2double(Dimen(4,1));
    else
        Prompt = {'What is the length of the Beam (in.)?','What is the width of the Beam (in.)?',...
        'What is the height of the Beam (in.)?'};
        dlg_title = 'Dimensons of the Beam.';
        num_lines = 1;
        def = {'4','4','6'};
        options.Resize = 'on';

        Dimen = inputdlg(Prompt,dlg_title,num_lines,def,options);
        Beam.Length = str2double(Dimen(1,1));   
        Beam.Width = str2double(Dimen(2,1));     
        Beam.Height = str2double(Dimen(3,1));
    end
    


    Lmaterial = {'Aluminum','Brass','Chromium','Copper','Iron','Lead','Steel','Tin','Titanium','Zinc'};
    Beam.Material = listdlg('Name','Material type','PromptString','Choose a material:',...
            'ListString',Lmaterial,'SelectionMode','single','ListSize',[200,170]);
    % 	Beam.Material = Lmaterial(Material);  // if I actually need the
    % 	name of the material
    
% Load/Support Parameteres 

    loadType = {'Point','Uniform'};
    Beam.Load = listdlg('Name','Load Type','PromptString','Choose a Load Type:',...
            'ListString',loadType,'SelectionMode','single','ListSize',[200,170]);               % This saves as number (position on the list, column wise) could be used in a switch situation

    supportP = {'Cantilevered','Simply Supported'};
    Beam.Support = listdlg('Name','Support Type','PromptString','Choose a Support Type',...
            'ListString',supportP,'SelectionMode','single','ListSize',[200,170]);               % This saves as number (position on the list, column wise) could be used in a switch situation

    Prompt = {'Please in a magnitude for the force:','Please state how far away the force is from the left edge of the beam (in.):'};
    dlg_title = 'Magnitude and Location';
    num_lines = 1;
    def = {'20','3'};
    options.Resize = 'on';

    MagLoc = inputdlg(Prompt,dlg_title,num_lines,def,options);
    Beam.Magnitude = str2double(MagLoc(1,1));
    Beam.Location = str2double(MagLoc(2,1));

%% Process - Moment of Inertia
% Inertia function created by Adrian Gose
% function inertia = mofinertia(bt,bw,bl,bh)
% MOFINERTIA Outputs the modulus of elasticity of a specific material.
%     inertia = mofinertia(bt,bw,bl,bh) Returns the moment of inertia depending
%     on the beam shape. 
bt = Beam.CrossSection;
bw = Beam.Width;
bl = Beam.Length;
bh = Beam.Height;
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

% Calculations

switch bt
    
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

%% Process - Modulus of Elasticity
% Elasticity function created by Lawson Hoover
% function [y1, y2, x] = Elasticity_Deflection(z)
% Elasticity_Deflection Finds the Modulous of elacticity and then uses that to find the amount of deflection
%   Should be used in conjunction with the beam_deflection program and
%           nothing else 
% Checking To see what the material is and then get the Elasticity 
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

%% Process - Beam Deflection Equations
% Deflection function created by Lawson Hoover
% Checking to see what the Load and support type is 

    I = inertia;
    a = Beam.Location;
    F = Beam.Magnitude;
    L = Beam.Length;
    b = Beam.Length-Beam.Location;
    x = linspace(0,Beam.Length);
    o = Beam.Magnitude/Beam.Length;   % Magnitude is them same as the force

    if Beam.Load == 1    % Referring to the point in the list during the selection
        if Beam.Support == 1 
            y1 = (F.*x.^2/6*E*I).*(3*a-x);     % 0<x<a
            y2 = (F.*a^2/6*E*I).*(3*x-a);      % a<x<L
        else  % x.Support == 2
            y1 = (F*b.*x/6*L*E*I).*(L^2-x.^2-b^2);                  % 0<x<a
            y2 = (F*b/6*E*L*I).*((L/b).*(x-a).^3+(L^2-b^2).*x-x.^3);  % a<x<L
        end
    else    % x.Load == 2
        if Beam.Support == 1
            y1 = (o.*x.^2/24*E*I).*(x.^2+6*L^2-4*L.*x);
            y2 = 0;
        else % x.Support == 2 
            y1 = (o.*x.^2/24*E*I).*((L^3-2*L.*x.^2)+x.^3);
            y2 = 0;
        end
    end
        
%% Output
% Output function created by Ryan Starcher
% Output plot of beam deflection
astr=['Deflection of a ',Beam.Material,', ', Beam.Support,' with a ',Beam.Load,' Load and ',Beam.Support,' Support'];
bstr=['Beam Displacement (',Beam.Magnitude,'N)'];

x=(linspace(0,Beam.Length));
y=[y1 y2];

plot(x,y)
set(plot(x,Beam.y),'LineWidth',3);
set(gca,'XTick',0:5:Beam.Length)
grid on
title(astr,'fontsize',9,'fontweight','bold');
xlabel('Beam Length');
ylabel(bstr);
set(gca,'YLim',[-150 150]);
set(gca,'XLim',[0 Beam.Length]);

% Textual Display of other 2 functions
disp(sprintf('\nSpecial qualities of this beam include:'))
disp(sprintf('\n\tModulus of Elasticity: \t%8.2f pounds per square inch.',E))
disp(sprintf('\tMoment of Inertia: \t\t%8.2f pounds times square feet.',inertia))