% Lawson Hoover 
% Engineering Computations with MATLAB
% Episcopal
% Mr. Bowmann - Period 4
%
% Start Date: November 28, 2012
% Last Revised: November 30, 2012
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
function [] = beam_deflection_input(varargin) 
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

