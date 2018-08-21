function [weightCorrected] = gameFormula(game, myweights)
%gameFormula: This is a function that provides some quantitative metrics on
% personal game rankings
%
%
% Give it a struct for one game, which includes a set of parameters, these
% should be consistent across subjects, e.g. narrative structure.
%
% Another column should be your personal weightings for that game, e.g.
% narrative structure of the game was 0.9, but you didn't like the story so
% you give it a 0.3
%
% these two columns can be used to spit out a set of new weights that are
% specific to that game. Putting these into a formula will give you some
% sort of metric that defines that video game. Running this multiple times
% on a different video games will eventually give you a list of metrics,
% and ultimately a ranking. 
%
% It would be cool to use this ranking as a training dataset, i.e. given
% your ranking, and knowledge of the gameValues, derive a new set of
% weights that provide you with a "generalised game metric" which would be
% consistent across all games.
%
% ideas from J. Smith
% written by [ma] August 2018
% 
% Struct should be of the following form:
% game.()
%              cost: 46
%        retailcost: 46
%       hoursPlayed: 25
%              HLTB: 19.5000
%         narrative: 1
%     replayability: 0.7000
%      gameplayLoop: 0.8000
%             music: 0.7000
%          graphics: 1
%         challenge: 0.6000
%
% Then make a vector of your weights for the last 6 fields in the game
% struct

% if nargin == 1
%     % check that you are rerunning a previously run struct
%     if ischar(rerun)
%         load(rerun)
%     end
%     
% elseif nargin == 0
%     prompt = 'What did you pay? ';
%     game.cost = input(prompt);
%     prompt = 'Retail cost? ';
%     game.retailcost = input(prompt);
%     prompt = 'How many hours did you play? ';
%     game.hoursPlayed = input(prompt);
%     prompt = 'Mean game length from HLTB? ';
%     game.HLTB = input(prompt);
%     prompt = 'Narrative? ';
%     game.narrative = input(prompt);
%     prompt = 'Replayability? ';
%     game.replayability = input(prompt);
%     prompt = 'Gameplay loop? ';
%     game.gameplayLoop = input(prompt);
%     prompt = 'Music? ';
%     game.music = input(prompt);
%     prompt = 'Graphics? ';
%     game.graphics = input(prompt);
%     prompt = 'Challenge? ';
%     game.challenge = input(prompt);
%     
% end

%prompt = 'Now give me your weights for the last 6 parameters as a vector: ';

gamefromStruct = [game.narrative; game.replayability; game.gameplayLoop; game.music; game.graphics; game.challenge];

gameWeights = myweights' .* gamefromStruct;
meanWeight = mean(gameWeights);

% could just take the mean of the gameWeights?
% ok, but now we need to correct this value based on cost, game length...

costCorrection = game.cost ./ game.retailcost;
%costFactor = 10; % this is a correction factor to lessen the effect of the costCorrection
%costWeight = meanWeight ./ (costFactor .* costCorrection); 
costWeight = meanWeight ./ costCorrection; % is this too strong an effect?

playtimeCorrection = game.hoursPlayed ./ game.HLTB;

weightCorrected = costWeight .* playtimeCorrection;

%fprintf('\n Game metric: %.3f\n', weightCorrected)

%prompt = 'Save name?: ';
%filename = input(prompt);
%save(filename, game, weightCorrected);








end

