%% Cool Calculation Loading Bar
% Calculation Loading Bar created by Adrian Gose
function loadbar
it = 1;
barnum = 1;
wbgui = waitbar(0, 'Calculating...');
while barnum <= 100
     waitbar(barnum/100,wbgui,['Calculating.                                 Progress:  ' num2str(barnum/100*100) '%'])
    randpause = 0.005 + (0.08-0.005).*rand(100,1);
    pause(randpause)
    barnum = barnum + 1;
end
delete(wbgui)