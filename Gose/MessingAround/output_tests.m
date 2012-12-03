%% test plot specific  KEEP!
% Test variables
Beam.Material='Gold';
Beam.Type='Hollow Rectangle';
Beam.Load='Point';
Beam.Support='Cantilevered';
Beam.Magnitude=num2str(100);
Beam.Length=21;
n=40;

% Output functions
% Output plot of beam deflection
astr=['Deflection of a ',Beam.Material,', ', Beam.Type,' with a ',Beam.Load,' Load and ',Beam.Support,' Support'];
bstr=['Beam Displacement (',Beam.Magnitude,'N)'];

x=[0:.25:Beam.Length];
Beam.y1=-.05*x.^2;

plot(x,Beam.y1)
set(plot(x,Beam.y1),'LineWidth',3);
set(gca,'XTick',0:5:Beam.Length)
grid on
title(astr,'fontsize',9,'fontweight','bold');
xlabel('Beam Length');
ylabel(bstr);
set(gca,'YLim',[-150 150]);
set(gca,'XLim',[0 Beam.Length]);

% Textual Display of other 2 functions
disp(sprintf('\nSpecial qualities of this beam include:'))
disp(sprintf('\n\tModulus of Elasticity: \t%8.2f pounds per square inch.',n))
disp(sprintf('\tMoment of Inertia: \t\t%8.2f pounds times square feet.',F))

%% Other

% b=.5;
% x=2;
% L=3;
% E=4;
% I=5;
% Beam.Length=50;
% 
% loadType = {'Point','Uniform'};
%     Beam.Load = listdlg('Name','Load Type','PromptString','Choose a Load Type:',...
%             'ListString',loadType,'SelectionMode','single','ListSize',[200,170]);               % This saves as number (position on the list, column wise) could be used in a switch situation
% 
%     supportP = {'Cantilevered','Simply Supported'};
%     Beam.Support = listdlg('Name','Support Type','PromptString','Choose a Support Type',...
%             'ListString',supportP,'SelectionMode','single','ListSize',[200,170]);               % This saves as number (position on the list, column wise) could be used in a switch situation
% 
%     Prompt = {'Please in a magnitude for the force:','Please state how far away the force is from the left edge of the beam (in.):'};
%     dlg_title = 'Magnitude and Location';
%     num_lines = 1;
%     def = {'20','3'};
%     options.Resize = 'on';
% 
%     MagLoc = inputdlg(Prompt,dlg_title,num_lines,def,options);
%     Beam.Magnitude = str2double(MagLoc(1,1));
%     Beam.Location = str2double(MagLoc(2,1));
% 
%     switch b_load
%         case 'Point'
%             switch b_support
%                 case 'Cantilevered'
%                     if 0 < x < a
%                         y=((Beam.Magnitude*x.^2)/(6*E*I))*(3*Beam.Location-x);
%                     elseif a < x < L
%                         y=((Beam.Magnitude*Beam.Location.^2)/(6*E*I))*(3*x-Beam.Location);
%                     end
%                 case 'Simply Supported'
%                     if 0 < x < a
%                         y=((Beam.Magnitude*b*x)/(6*L*E*I))*(L.^2-x.^2-b.^2);
%                     elseif a < x < L
%                         y=((Beam.Magnitude*b)/(6*L*E*I))*((L/b)*(x-Beam.Location)^3+(L.^2-b.^2)*(x-x.^3));
%                     end
%             end
%         case 'Uniform'
%             switch b_support
%                 case 'Cantilevered'
%                     y=((Beam.Magnitude/L)*(x.^2)/(24*E*I))*(x.^2+6*L.^2-4*L*x);
%                 case 'Simply Supported'
%                     y=((Beam.Magnitude/L)*(x)/(24*E*I))*(L.^3-2*L*x.^2+x.^3);
%             end
%         otherwise
%             y=0
%     end


% bm=100;
% bl=50;
% x=[1:8];
% E=50;
% I=10;
% y=((bm/bl)*(x.^2)/(24*E*I))*(x.^2+6*bl.^2-4*bl*x);



% F=40;
% test output for modulus of elasticity & ect.
% disp(sprintf('The modulus of elasticity for this beam is %f pounds per square inch.',F))
% disp(sprintf('The moment of inertia for this beam is %f pounds times square feet.',F))
% disp('The deflection of the beam is displayed in the plot window.',)



