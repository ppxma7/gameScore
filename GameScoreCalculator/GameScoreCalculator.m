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

% Last Modified by GUIDE v2.5 21-Aug-2018 11:38:07

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




% --- Executes on button press in newEntryButton.
function newEntryButton_Callback(hObject, eventdata, handles)
% hObject    handle to newEntryButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% first we make a table to input these parameters
prompt = {'Game Name', 'Retail Cost', 'Mean Game Duration', 'Narrative', 'Replayability', 'Gameplay', 'Music', ...
    'Graphics', 'Challenge', 'Price Paid'};
title = 'Input';
dims = [1, 35];
numlines = 9;
answer = inputdlg(prompt,title, dims);

% this is to convert strings to numbers
counter = 2; % ignore the name and start from second parameter
for ii = 1:numlines
user_val(ii) = str2num(answer{counter});
counter = counter + 1;
end

gameName = answer{1,1};



keyboard


% --- Executes on button press in CalculateButton.
function CalculateButton_Callback(hObject, eventdata, handles)
% hObject    handle to CalculateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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
