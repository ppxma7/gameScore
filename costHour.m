% script to tabulate cost of video game by hours played (ratio)
%
% original idea: Jim Smith
%
% [ma] August 2018

myGames = {'Far Cry 5', 'Watch Dogs 2', 'AC Origins', 'Persona 5', ...
    'Horizon', 'Fe', 'Life is Strange', 'MGSV', 'Crash', ...
    'Inside', 'Rise of TR', 'Nier Automata', ...
    'God of War', 'Journey', 'Alien Iso', 'Resi 7' ...
    'Arkham Knight', 'NMS', 'Witcher 3', 'Rayman', ... 
    'Ratchet Clank', 'Uncharted 4', 'Infamous SS', ...
    'Octodad', 'Transistor', 'FFXV', 'AC Unity', 'Wipeout', 'Until Dawn', ...
    'Yakuza 0'}';
theCosts = [48 42 34.99 24.99 44 15.99 2.99 7.99 27.99 5.99 24.99 24.99 46 9.99 18.99 24.99 39.85 46 34.99 9.99 27.99 ...
    42 40 11.99 11.99 17.85 14.43 25 26.99 17.25]';
hoursPlayed = [30 25 32 32 60 8 8 5 20 2 25 40 30 6 2 2 25 20 1 20 20 20 30 5 15 8 20 15 8 3]';

hourPerCost = hoursPlayed ./ theCosts;
hourPerCost_sorted = sort(hourPerCost, 'descend');

figure
g = gramm('x', myGames, 'y', hourPerCost);
g.geom_bar()
g.set_point_options('markers', {'o'} ,'base_size',15)
g.draw()