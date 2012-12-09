function loadbar(speed)

%LOADBAR Displays a random loadbar that does nothing else but makes the person wait unnecessarily for the program to end. 
%
%     Syntax: loadbar(speed) Speeds 1-10, 1 is Slowest, 10 being Fastest
%
%     Input:
%      speed = Speeds 1-10, 1 is Slowest, 10 being Fastest
%
%     Output:
%      GUI Output of a Loadbar
%
%   Adrian Gose
%   Hoover High School
%   0 Period - Mrs. Harris
%   December 9, 2012
%

speed1arr = linspace(0.0001,0.1,10);
speed1 = speed1arr(speed);
barnum = 1;
wbgui = waitbar(0, 'Calculating...');

while barnum <= 100
    waitbar(barnum/100,wbgui,['Calculating.                                 Progress:  ' num2str(barnum/100*100) '%'])
    randpause = 0.005 + (speed1-0.005).*rand(100,1);
    pause(randpause)
    barnum = barnum + 1;
end

delete(wbgui)
end