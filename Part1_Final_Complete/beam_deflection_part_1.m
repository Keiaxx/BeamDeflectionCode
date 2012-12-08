% Filename = beam_deflection_part_1.m
% -------------------------------------------------------------------------
% Lawson Hoover, Adrian Gose, Ryan Starcher
% Engineering Computations with MATLAB
% Beam Deflection Project: Basecamp Group #10
%
% Start Date: November 28, 2012
% Completion Date: December 8, 2012
% 
% Purpose: To gather and store all of the required input for the beam
%          deflection program.
% -------------------------------------------------------------------------
% Variables:
% 
%   Beam ~ index for following variables:
%       .CrossSection = the cross section chosen in the list number Based
%                       off of Csection array
%       .Height = height of the beam 
%       .Length = length of the beam
%       .Load = Load chosse in position to loadtype
%       .Location = the location of the beam 
%       .Magnitude = the magnitude of the force
%       .Material = Material choosen in position to material array
%       .Support = Load chosse in position to supportP
%       .Thickness = thickness of the beam
%       .Width = width of the beam
%       .x1 = x1
%       .x2 = x2
%       .y1 = y1
%       .y2 = y2
%   Other Variables: (variables that equal other variables have been
%                     simplified for ease of use in functions)
%                    (Indented are similar variables with different
%                     meanings at different points in the function
%
%       A = The Prompts for Diensons if it is not a solid rectangle
%       a = Beam.Location
%           a = Lmaterial(Beam.Material)
%       astr=['Beam Deflection Plot Output','Specifications Include:',a b c d]
%       B = The Prompts for Diensons if it is a solid rectangle
%       b = Beam.Length-Beam.Location
%           b = Csection(Beam.CrossSection)
%       bstr=['Beam Displacement (in) (',num2str(Beam.Magnitude),'lbs)']
%       bx = Beam.CrossSection
%       bw = Beam.Width
%       bh = Beam.Height
%           c = loadType(Beam.Load)
%       Csection = The cell array of options for Cross section
%           d = supportP(Beam.Support)
%       Dimen = the dimensons of the Beam in a cell array
%       F = Beam.Magnitude
%       I = inertia
%       L = Beam.Length
%       Lmaterial = cell array of all the optional matrial in the matrial list
%       loadType = array of loads to choose from
%       MagLoc = is the inputed magnitude and location of the force on the beam
%       Magnitude is them same as the force
%       o = Beam.Magnitude/Beam.Length   
%       supportP = array of support to choose from
%       x = linspace(0,Beam.Length)
%       x1 = linspace(0, a, 100)
%       x2 = linspace(a, L, 100)
%
% Functions Called: 
%   modofe.m
%   inertia.m
%   deflection.m
%   plotdeflection.m
% -------------------------------------------------------------------------
% Credit:
% 
% Variable Clearing:                 Adrian Gose
% Input:                             Lawson Hoover
% Modulus of Elasticity:             Adrian Gose
% Moment of Inertia:                 Adrian Gose
% Deflection:                        Lawson Hoover
% Random Loading Bar:                Adrian Gose
% Output function:                   Ryan Starcher
%                                    Lawson Hoover
% Combining parts into final script: Ryan Starcher
% Final script editing:              Ryan Starcher
%                                    Lawson Hoover
%                                    Adrian Gose
% 
% All were responsibile for checking over everyone's work in all functions
% -------------------------------------------------------------------------
% Begin:
%% Clear Variables/Workspace/Plots
% Created by Adrian Gose
clc
clf
clear
figwin=findobj('Type','figure'); % Close open figure windows
delete(figwin);
%% Input 
% Created by Laswon Hoover

% Beam Parameters  ( This Sections is gathering all needed input about the Beam)

Csection = {'Solid Rectangle','Hollow Rectangle','T-beam','I-beam'};
Beam.CrossSection = listdlg('Name','Cross Section Type','ListString',...
    Csection,'PromptString','Chose a cross section','SelectionMode',...
    'single','ListSize',[200,170]);


if Beam.CrossSection ~= 1 % Is Checking to see what Beam was chosen
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
    if isnan(Beam.Width) == 1 || isnan(Beam.Height) == 1 || isnan(Beam.Thickness) == 1 || isnan(Beam.Length) == 1
        beep
        uiwait(errordlg('Make sure all input is a number!'));
        error('Input must be a number');
    end
    
    if Beam.Width <= 0 || Beam.Height <= 0 || Beam.Thickness <= 0 ||Beam.Length <= 0
        beep
        uiwait(errordlg('Make sure that all input is greater than 0'));
        error('Input must be larger than 0');
    end
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
    Beam.Thickness = [];
    if isnan(Beam.Width) == 1 || isnan(Beam.Height) == 1 ||isnan(Beam.Length) == 1
        beep
        uiwait(errordlg('Make sure all input is a number! Please Exit out of remaining boxes and run program again.'));
    end
    
    if Beam.Width <= 0 || Beam.Height <= 0 || Beam.Length <= 0
        beep
        uiwait(errordlg('Make sure that all input is greater than 0!  Please Exit out of remaining boxes and run program again.'));
    end
end


Lmaterial = {'Aluminum','Brass','Chromium','Copper','Iron','Lead','Steel','Tin','Titanium','Zinc'};
Beam.Material = listdlg('Name','Material type','PromptString','Choose a material:',...
    'ListString',Lmaterial,'SelectionMode','single','ListSize',[200,170]);

% Load/Support Parameters

loadType = {'Point','Uniform'};
Beam.Load = listdlg('Name','Load Type','PromptString','Choose a Load Type:',...
    'ListString',loadType,'SelectionMode','single','ListSize',[200,170]);               % This saves as number (position on the list, column wise) could be used in a switch situation

supportP = {'Cantilevered','Simply Supported'};
Beam.Support = listdlg('Name','Support Type','PromptString','Choose a Support Type',...
    'ListString',supportP,'SelectionMode','single','ListSize',[200,170]);               % This saves as number (position on the list, column wise) could be used in a switch situation

if Beam.Load == 1 % Modified by Adrian Gose, coded by Lawson Hoover
    Prompt = {'Please in a magnitude for the force:','Please state how far away the force is from the left edge of the beam (in.):'};
    dlg_title = 'Magnitude and Location';
    num_lines = 1;
    def = {'20','3'};
    options.Resize = 'on';
    MagLoc = inputdlg(Prompt,dlg_title,num_lines,def,options);
    Beam.Magnitude = str2double(MagLoc(1,1));
    Beam.Location = str2double(MagLoc(2,1));
else
    Prompt = {'Please in a magnitude for the force:'};
    dlg_title = 'Magnitude';
    num_lines = 1;
    def = {'20','3'};
    MagLoc = inputdlg(Prompt,dlg_title,num_lines,def,options);
    Beam.Magnitude = str2double(MagLoc(1,1));
end

if Beam.Load == 2
    Beam.Location = 1;
end %End Gose Modify

if isnan(Beam.Magnitude) == 1 || isnan(Beam.Location) == 1
    beep
    uiwait(errordlg('Make sure all input is a number! Please Exit out of remaining boxes and run program again.'));
    error('Input must be a number');
end

if Beam.Magnitude <= 0 || Beam.Location <= 0
    beep
    uiwait(errordlg('Make sure that all input is greater than 0!  Please Exit out of remaining boxes and run program again.'));
    error('Input must be greater than 0');
end

%% Process/Function Calls
E = modofe(Beam.Material);

I = inertia(Beam.CrossSection, Beam.Width, Beam.Height, Beam.Thickness);

[Beam.x1, Beam.x2, Beam.y1, Beam.y2] = deflection(Beam,E,I);

loadbar(2) 

% Output
plotdeflection(Beam);

%% Textual Display of other 2 functions (Not part of Plot Function)
disp(sprintf('\nSpecial qualities of this beam include:'))
disp(sprintf('\n\tModulus of Elasticity: \t%12.2f pounds per square inches.',E))
disp(sprintf('\tMoment of Inertia: \t\t%12.2f pounds times square feet.',I))