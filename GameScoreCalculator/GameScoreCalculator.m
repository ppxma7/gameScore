function varargout = GameScoreCalculator(varargin)
% GAMESCORECALCULATOR MATLAB code for GameScoreCalculator.fig
%      GAMESCORECALCULATOR, by itself, creates a new GAMESCORECALCULATOR or raises the existing
%      singleton*.
%
%      H = GAMESCORECALCULATOR returns the handle to a new GAMESCORECALCULATOR or the handle to
%      the existing singleton*.
%
%      GAMESCORECALCULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAMESCORECALCULATOR.M with the given input arguments.
%
%      GAMESCORECALCULATOR('Property','Value',...) creates a new GAMESCORECALCULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GameScoreCalculator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GameScoreCalculator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GameScoreCalculator

% Last Modified by GUIDE v2.5 22-Aug-2018 11:11:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GameScoreCalculator_OpeningFcn, ...
                   'gui_OutputFcn',  @GameScoreCalculator_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GameScoreCalculator is made visible.
function GameScoreCalculator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GameScoreCalculator (see VARARGIN)

% Choose default command line output for GameScoreCalculator
handles.output = hObject;

addpath(genpath('Supporting Functions'));
addpath(genpath('Database'));
handles.setting.savePath = 'Database/';

handles.data.PlayerWeights= [1,1,1,1,1,1];

autosaveExist = exist('autoSave.mat','file');

if autosaveExist

resumeExisting = questdlg('Previous Player Database found, load data base?');    

if strcmpi(resumeExisting,'Yes')
   load('autoSave.mat')
   handles.uitable1.Data = saveData.table;
   handles.NarrInput.String = num2str(saveData.playerWeighting(1), '%0.1g');
   handles.replayInput.String = num2str(saveData.playerWeighting(2), '%0.1g');
   handles.PlayabilityInput.String = num2str(saveData.playerWeighting(3), '%0.1g');
   handles.MusicInput.String = num2str(saveData.playerWeighting(4), '%0.1g');
   handles.GraphicsInput.String = num2str(saveData.playerWeighting(5), '%0.1g');
   handles.ChallengeInput.String = num2str(saveData.playerWeighting(6), '%0.1g');
elseif strcmpi(resumeExisting,'Cancel')

end
    
end

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes GameScoreCalculator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GameScoreCalculator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in LoadEntryButton.
function LoadEntryButton_Callback(hObject, eventdata, handles)
% hObject    handle to LoadEntryButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%cd(handles.setting.savePath)
[loadedGame, path] = uigetfile;
load(loadedGame);

% find free rows
emptyTestL = cellfun(@isempty,handles.uitable1.Data(:,1));
if all(~emptyTestL)
    idx = size(handles.uitable1.Data,1) +1;
else
    idx = min(find(double(emptyTestL)));
end

% populate row with loaded game
handles.uitable1.Data{idx,1} = game.Name;

% is there a better way to do this than getfield?
handles.uitable1.Data{idx, 1} = getfield(game, 'Name');
handles.uitable1.Data{idx, 2} = getfield(game, 'RetailCost');
handles.uitable1.Data{idx, 3} = getfield(game, 'MeanGameDuration');
handles.uitable1.Data{idx, 4} = getfield(game, 'NarrativeStructure');
handles.uitable1.Data{idx, 5} = getfield(game, 'NarrativePerformance');
handles.uitable1.Data{idx, 6} = getfield(game, 'ReplayabilityStructure');
handles.uitable1.Data{idx, 7} = getfield(game, 'ReplayabilityPerformance');
handles.uitable1.Data{idx, 8} = getfield(game, 'GameplayStructure');
handles.uitable1.Data{idx, 9} = getfield(game, 'GameplayPerformance');
handles.uitable1.Data{idx, 10} = getfield(game, 'MusicStructure');
handles.uitable1.Data{idx, 11} = getfield(game, 'MusicPerformance');
handles.uitable1.Data{idx, 12} = getfield(game, 'GraphicsStructure');
handles.uitable1.Data{idx, 13} = getfield(game, 'GraphicsPerformance');
handles.uitable1.Data{idx, 14} = getfield(game, 'ChallengeStructure');
handles.uitable1.Data{idx, 15} = getfield(game, 'ChallengePerformance');


guidata(hObject, handles);



% --- Executes on button press in newEntryButton.
function newEntryButton_Callback(hObject, eventdata, handles)
% hObject    handle to newEntryButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% first we make a table to input these parameters
prompt = {'Game Name', 'Retail Cost', 'Mean Game Duration', 'Narrative (Structure)'...
    'Narrative (Performance)', 'Replayability (Structure)', ...
    'Replayability (Performance)', 'Gameplay (Structure)', ...
    'Gameplay (Performance)', 'Music (Structure)', 'Music (Performance)', ...
    'Graphics (Structure)', 'Graphics (Performance)', 'Challenge (Structure)', ...
    'Challenge (Performance)'};
title = 'Input';
dims = [1, 35];
numlines = 14;
answer = inputdlg(prompt,title, dims);

% this is to convert strings to numbers
counter = 2; % ignore the name and start from second parameter
for ii = 1:numlines
user_val(ii) = str2num(answer{counter});
counter = counter + 1;
end

gameName = answer{1,1};

%% Save input data to txt file

savePath = handles.setting.savePath;
% this is a temp fix 
if ~strcmpi(handles.setting.savePath, 'Database/')
    handles.setting.savePath = 'Database/';
end


game.Name = gameName;
game.RetailCost = user_val(1);
game.MeanGameDuration = user_val(2);
game.NarrativeStructure = user_val(3);
game.NarrativePerformance = user_val(4);
game.ReplayabilityStructure = user_val(5);
game.ReplayabilityStructure = user_val(6);
game.GameplayStructure = user_val(7);
game.GameplayPerformance = user_val(8);
game.MusicStructure = user_val(9);
game.MusicPerformance = user_val(10);
game.GraphicsStructure = user_val(11);
game.GraphicsPerformance = user_val(12);
game.ChallengeStructure = user_val(13);
game.ChallengePerformance = user_val(14);

filename = [gameName,'.mat'];

exTest = exist([savePath,filename],'file');

response = 'Yes';
if exTest
    response = questdlg([filename, ' already exists. Overwrite?']);
end

if strcmpi(response,'cancel')
    return
end

if strcmpi(response,'Yes')
    save([savePath,filename],'game')
end


%% add data to table
emptyTest = cellfun(@isempty,handles.uitable1.Data(:,1));
if all(~emptyTest)
    ind = size(handles.uitable1.Data,1) +1;
else
    ind = min(find(double(emptyTest)));
end



handles.uitable1.Data{ind,1} = gameName;
for ii = 1:numlines
handles.uitable1.Data{ind,ii+1} = user_val(ii);
end
guidata(hObject, handles);



% --- Executes on button press in CalculateButton.
function CalculateButton_Callback(hObject, eventdata, handles)
% hObject    handle to CalculateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


handles.data.PlayerWeights(1) = str2double(handles.NarrInput.String);
handles.data.PlayerWeights(2) = str2double(handles.replayInput.String);
handles.data.PlayerWeights(3) = str2double(handles.PlayabilityInput.String);
handles.data.PlayerWeights(4) = str2double(handles.MusicInput.String);
handles.data.PlayerWeights(5) = str2double(handles.GraphicsInput.String);
handles.data.PlayerWeights(6) = str2double(handles.ChallengeInput.String);

emptyTest = cellfun(@isempty,handles.uitable1.Data(:,1));

for entry = 1:length(emptyTest)
    if ~emptyTest(entry)
        game.retailcost = handles.uitable1.Data{entry,2};
        game.HLTB = handles.uitable1.Data{entry,3};
        game.narrative = handles.uitable1.Data{entry,4};
        game.narrativeP = handles.uitable1.Data{entry,5};
        game.replayability = handles.uitable1.Data{entry,6};
        game.replayabilityP = handles.uitable1.Data{entry,7};
        game.gameplayLoop = handles.uitable1.Data{entry,8};
        game.gameplayLoopP = handles.uitable1.Data{entry,9};
        game.music = handles.uitable1.Data{entry,10};
        game.musicP = handles.uitable1.Data{entry,11};
        game.graphics = handles.uitable1.Data{entry,12};
        game.graphicsP = handles.uitable1.Data{entry,13};
        game.challenge = handles.uitable1.Data{entry,14};
        game.challengeP = handles.uitable1.Data{entry,15};
        game.hoursPlayed = handles.uitable1.Data{entry,16};
        game.cost = handles.uitable1.Data{entry,17};
        
        score = gameFormula(game, handles.data.PlayerWeights);
        handles.uitable1.Data{entry,18} = score;
    end
end
guidata(hObject, handles);



function NarrInput_Callback(hObject, eventdata, handles)
% hObject    handle to NarrInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NarrInput as text
%        str2double(get(hObject,'String')) returns contents of NarrInput as a double



% --- Executes during object creation, after setting all properties.
function NarrInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NarrInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function replayInput_Callback(hObject, eventdata, handles)
% hObject    handle to replayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of replayInput as text
%        str2double(get(hObject,'String')) returns contents of replayInput as a double


% --- Executes during object creation, after setting all properties.
function replayInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to replayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PlayabilityInput_Callback(hObject, eventdata, handles)
% hObject    handle to PlayabilityInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PlayabilityInput as text
%        str2double(get(hObject,'String')) returns contents of PlayabilityInput as a double


% --- Executes during object creation, after setting all properties.
function PlayabilityInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlayabilityInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MusicInput_Callback(hObject, eventdata, handles)
% hObject    handle to MusicInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MusicInput as text
%        str2double(get(hObject,'String')) returns contents of MusicInput as a double


% --- Executes during object creation, after setting all properties.
function MusicInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MusicInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GraphicsInput_Callback(hObject, eventdata, handles)
% hObject    handle to GraphicsInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GraphicsInput as text
%        str2double(get(hObject,'String')) returns contents of GraphicsInput as a double


% --- Executes during object creation, after setting all properties.
function GraphicsInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GraphicsInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ChallengeInput_Callback(hObject, eventdata, handles)
% hObject    handle to ChallengeInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ChallengeInput as text
%        str2double(get(hObject,'String')) returns contents of ChallengeInput as a double
mychallengeWeight = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function ChallengeInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChallengeInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

emptyTest = cellfun(@isempty,handles.uitable1.Data(:,1));
saveData.table = handles.uitable1.Data;
saveData.playerWeighting = handles.data.PlayerWeights;
if any(~emptyTest)
    save('autoSave.mat','saveData')   
end

% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

% this is a popup menu to sort the rows by column

fudge = handles.uitable1.Data;
emptyCells = cellfun('isempty', fudge);
fudge(all(emptyCells,2), :) = []; % get rid of empty columns (this might break later)
dataTable = cell2table(fudge); % convert to table to use sortrows

switch get(handles.popupmenu1, 'Value')
    case 1 %'Retail Cost'
        sortedTable = sortrows(dataTable, 2, 'descend');
        sortedData = table2cell(sortedTable); % turn back to cell array
    case 2 %'Mean Game Duration'
        sortedTable = sortrows(dataTable, 3, 'descend');
        sortedData = table2cell(sortedTable);
    case 3 %'Narrative'
        sortedTable = sortrows(dataTable, 4, 'descend');
        sortedData = table2cell(sortedTable);
    case 4 %'NarrativeP'
        sortedTable = sortrows(dataTable, 5, 'descend');
        sortedData = table2cell(sortedTable);
    case 5 %'Replaybility'
        sortedTable = sortrows(dataTable, 6, 'descend');
        sortedData = table2cell(sortedTable);
    case 6 %'ReplaybilityP'
        sortedTable = sortrows(dataTable, 7, 'descend');
        sortedData = table2cell(sortedTable);
    case 7 %'Gameplay'
        sortedTable = sortrows(dataTable, 8, 'descend');
        sortedData = table2cell(sortedTable);
    case 8 %'GameplayP'
        sortedTable = sortrows(dataTable, 9, 'descend');
        sortedData = table2cell(sortedTable);
    case 9 %'Music'
        sortedTable = sortrows(dataTable, 10, 'descend');
        sortedData = table2cell(sortedTable);
    case 10 %'MusicP'
        sortedTable = sortrows(dataTable, 11, 'descend');
        sortedData = table2cell(sortedTable);
    case 11 %'Graphics'
        sortedTable = sortrows(dataTable, 12, 'descend');
        sortedData = table2cell(sortedTable);
    case 12 %'GraphicsP'
        sortedTable = sortrows(dataTable, 13, 'descend');
        sortedData = table2cell(sortedTable);
    case 13 %'Challenge'
        sortedTable = sortrows(dataTable, 14, 'descend');
        sortedData = table2cell(sortedTable);
    case 14 %'ChallengeP'
        sortedTable = sortrows(dataTable, 15, 'descend');
        sortedData = table2cell(sortedTable);
    case 15 %'Hours Played'
        sortedTable = sortrows(dataTable, 16, 'descend');
        sortedData = table2cell(sortedTable);
    case 16 %'Price Paid'
        sortedTable = sortrows(dataTable, 17, 'descend');
        sortedData = table2cell(sortedTable);
    case 17 %'Score'
        sortedTable = sortrows(dataTable, 18, 'descend');
        sortedData = table2cell(sortedTable);
           
end

% populate new table with sortedData
handles.uitable1.Data = sortedData; % update data
guidata(hObject, handles);




% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
