% script to visualise values from autosave

load('MichaelValues.mat')

numgames = 17;
myfontsize = 14;

matvalsr = reshape(matvals, [numgames.*numgames 1]);
thenamesr = repmat(thenames', numgames, 1);
mystring = {'RetailCost', 'MeanGameDuration', 'NarrativeStructure', ...
    'NarrativePerformance', 'ReplayabilityStructure', 'ReplayabilityPerformance', ...
    'GameplayStructure', 'GameplayPerformance', 'MusicStructure', 'MusicPerformance', ...
    'GraphicsStructure', 'GraphicsPerformance', 'ChallengeStructure', 'ChallengePerformance',...
    'HoursPlayed', 'CostPaid', 'Score'}';

params = repmat(mystring', numgames,1);
paramsr = reshape(params, [numgames.*numgames 1]);
%% by score
g = gramm('x', thenames', 'y', matvals(:,17));
g.geom_bar()
g.set_text_options('font', 'Menlo', 'base_size', myfontsize)
g.set_point_options('markers', {'o'} ,'base_size',15)
g.draw()


%% by all!?
g = gramm('x', thenamesr, 'y', matvalsr, 'color', paramsr);
g.geom_point()
g.set_text_options('font', 'Menlo', 'base_size', myfontsize)
g.set_point_options('markers', {'o'} ,'base_size',15)
g.draw()