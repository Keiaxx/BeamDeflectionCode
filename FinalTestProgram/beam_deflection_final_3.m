% Filename = beam_deflection_final_7.m
% -------------------------------
% Lawson Hoover, Adrian Gose, Ryan Starcher
% Engineering Computations with MATLAB
% Beam Deflection Project: Basecamp Group #10
%
% Start Date: November 28, 2012
% Last Revised: December 5, 2012
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
% Credit:
%
% Input:                             Lawson Hoover
% Modulus of Elasticity:             Lawson Hoover
% Moment of Inertia:                 Adrian Gose
% Deflection:                        Lawson Hoover
% Output function:                   Ryan Starcher
% Combining parts into final script: Ryan Starcher
% Final script editing:              Ryan Starcher
%                                    Lawson Hoover
%                                    Adrian Gose
%
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
% function [] = beam_deflection_input(varargin)
% beam_deflection_input This is the input function that gathers all required data to start the beam deflection program.
%
% Beam Parameters  ( This Sections is gathering all needed input about the Beam)

Csection = {'Solid Rectangle','Hollow Rectangle','T-beam','I-beam'};
Beam.CrossSection = listdlg('Name','Cross Section Type','ListString',...
    Csection,'PromptString','Chose a cross section','SelectionMode',...
    'single','ListSize',[200,170]);
%Beam.CrossSection = Csection(CrossSection);   // If I need the actual name and not the number


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

%% Process - Modulus of Elasticity
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
        E= 10.0 * 10^6;
        
    case 2
        E = 15.9 * 10^6;
        
    case 3
        E = 36.0 * 10^6;
        
    case 4
        E = 15.6 * 10^6;
        
    case 5
        E = 28.5 * 10^6;
        
    case 6
        E = 2.6 * 10^6;
        
    case 7
        E = 30.0 * 10^6;
        
    case 8
        E = 6.0 * 10^6;
        
    case 9
        E = 16.8 * 10^6;
        
    case 10
        E = 12.0 * 10^6;
        
    otherwise
        
        disp('Error: Invalid beam material.')
        
        
end

%% Process - Moment of Inertia
% Inertia function created by Adrian Gose
% function inertia = mofinertia(bt,bw,bl,bh)
% MOFINERTIA Outputs the modulus of elasticity of a specific material.
%     inertia = mofinertia(bt,bw,bl,bh) Returns the moment of inertia depending
%     on the beam shape.
bx = Beam.CrossSection;
bw = Beam.Width;
bh = Beam.Height;

if bx == 1   % If the beam type is a Solid Rectangle, Don't set the BT Variable as there will be no thickness to relieve from the error.
    bt = [];
else
    bt = Beam.Thickness;
end

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

switch bx
    
    case 1                                                                 %Solid Rectangle
        inertia = bw * (bh^3) / 12;
        
    case 2                                                                 %Hollow Rectangle
        inertia = (bw * (bh^3) / 12) - (bw - 2 * bt) * (bh - 2 * bt)^3;
        
    case 3                                                                 %I Beam
        yc = bh - ((bt * bh^2) + bt^2 * (bw - bt))/(2 * bw * bt + (bh - bt) * bt);
        inertia = (1/3) * (bt * yc^3 + bw *(bh - yc)^3 - (bw - bt) * (bh - yc - bt)^3);
        
    case 4                                                                 %T Beam
        inertia = (2 * bt * bw) * (1/2 * (bh - 2 * bt) + 1/2 * bt)^2 + (bt * (bh - 2 * bt)^ 3) / 12;
        
        
        
    otherwise
        disp('Error: Invalid beam shape.')
        
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

x1 = linspace(0, a, 100); % Gose
x2 = linspace(a, L, 100);


if Beam.Support == 1 % Cantilevered
    if Beam.Load == 1 % Point
        y1 = ((F.*x1.^2)/(6*E*I)).*(3*a-x1);    % 0<x<a
        y2 = ((F.*a^2)/(6*E*I)).*(3*x2-a);      % a<x<L
    elseif Beam.Load == 2 % Uniform
        y1 = ((o.*x1.^2)/(24*E*I)).*(x1.^2+6*L^2-4*L.*x1);
        y2 = ((o.*x2.^2)/(24*E*I)).*(x2.^2+6*L^2-4*L.*x2);
    end
elseif Beam.Support == 2 % Simply Supported
    if Beam.Load == 1 % Point
        y1 = ((F*b.*x1)/(6*L*E*I)).*(L^2-x1.^2-b^2);                    % 0<x<a
        y2 = ((F*b)/(6*E*L*I)).*((L/b).*(x2-a).^3+(L^2-b^2).*x2-x2.^3); % a<x<L
    elseif Beam.Load == 2 % Uniform
        y1 = ((o.*x1)/(24*E*I)).*((L^3)-(2*L.*x1.^2)+(x1.^3));
        y2 = ((o.*x2)/(24*E*I)).*((L^3)-(2*L.*x2.^2)+(x2.^3));
    end
end

Beam.x1 = x1;  % Prep for friendly input for plot function
Beam.x2 = x2;
Beam.y1 = y1;
Beam.y2 = y2;


%% Cool Calculation Loading Bar/Adrian Gose

it = 1;
barnum = 1;
wbgui = waitbar(0, 'Calculating...');
while barnum <= 100
    waitbar(barnum/100)
    randpause = 0.005 + (0.04-0.005).*rand(100,1);
    pause(randpause)
    barnum = barnum + 1;
end
delete(wbgui)

%% Output
% Output function created by Ryan Starcher
% Output plot of beam deflection

a=Lmaterial(Beam.Material);
b=Csection(Beam.CrossSection);
c=loadType(Beam.Load);
d=supportP(Beam.Support);
nd = zeros(1,100); % Nondeflect zeros
astr=['Deflection of a/an ',a,b,' with a ',c,' Load and ',d,' Support'];
bstr=['Beam Displacement (in) (',num2str(Beam.Magnitude),'lbs)'];

plot(Beam.x1, nd, 'r', 'LineWidth',3);
hold on
plot(Beam.x2, nd, 'r', 'LineWidth',3);
plot(Beam.x1, -Beam.y1, 'b', 'LineWidth',3);
plot(Beam.x2, -Beam.y2, 'b', 'LineWidth',3);
hold off

grid on
title(astr,'fontsize',9,'fontweight','bold');
xlabel('Beam Length (in)');
ylabel(bstr);

%% Textual Display of other 2 functions (Not part of Plot Function)
disp(sprintf('\nSpecial qualities of this beam include:'))
disp(sprintf('\n\tModulus of Elasticity: \t%12.2f pounds per square inches.',E))
disp(sprintf('\tMoment of Inertia: \t\t%12.2f pounds times square feet.',inertia))