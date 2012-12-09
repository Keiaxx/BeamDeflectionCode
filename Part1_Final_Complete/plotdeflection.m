function [P1,P2,P3,P4] = plotdeflection(Beam)

%PLOTDEFLECTION Displays a random loadbar that does nothing else but makes the person wait unnecessarily for the program to end. 
%
%     Syntax: [P1,P2,P3,P4] = plotdeflection(Beam) Plots the beam
%     deflection.
%
%     Input:
%      Beam
%
%     Output:
%      GUI Output of a Loadbar
%
%   Ryan Starcher
%   Cuyahoga Valley Christian Academy
%   2nd Period - Mr.Bucciarelli
%   December 6, 2012

% Start convert to Textual String
switch Beam.Material
    case 1
        Beam.Material = 'Aluminum';
    case 2
        Beam.Material = 'Brass';
    case 3
        Beam.Material = 'Chromium';
    case 4
        Beam.Material = 'Copper';
    case 5
        Beam.Material = 'Iron';
    case 6 
        Beam.Material = 'Lead';
    case 7 
        Beam.Material = 'Steel';
    case 8
        Beam.Material = 'Tin';
    case 9
        Beam.Material = 'Titanium';
    case 10
        Beam.Material = 'Zinc';
end 

switch Beam.CrossSection
    case 1
        Beam.CrossSection = 'Solid Rectangle';
    case 2
        Beam.CrossSection = 'Hollow Rectangle';
    case 3 
        Beam.CrossSection = 'T-beam';
    case 4 
        Beam.CrossSection = 'I-beam';        
end

switch Beam.Support 
    case 1
        Beam.Support = 'Cantilevered';
    case 2 
        Beam.Support = 'Simply Supported';
end
switch Beam.Load
    case 1
        Beam.Load = 'Point';
    case 2 
        Beam.Load = 'Uniform';
end
% End Textual Display 

nd = zeros(1,100); % Nondeflect zeros
astr={['Deflection of a/an ',Beam.Material,' ',Beam.CrossSection,' with a '],...
     [Beam.Load,' Load and ',Beam.Support,' Support']};
bstr=['Beam Displacement (in) (',num2str(Beam.Magnitude),'lbs)'];
P1 = plot(Beam.x1, nd, '-r', 'LineWidth',4);
hold on
P2 = plot(Beam.x2, nd, '-r', 'LineWidth',4);
P3 = plot(Beam.x1, -Beam.y1, 'b', 'LineWidth',3);
P4 = plot(Beam.x2, -Beam.y2, 'b', 'LineWidth',3);
hold off
grid on
title(astr,'fontsize',9,'fontweight','bold');
xlabel('Beam Length (in)');
ylabel(bstr);
end
