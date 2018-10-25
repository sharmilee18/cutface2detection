function varargout = object_edit(varargin)
% OBJECT_EDIT MATLAB code for object_edit.fig
%      OBJECT_EDIT, by itself, creates a new OBJECT_EDIT or raises the existing
%      singleton*.
%
%      H = OBJECT_EDIT returns the handle to a new OBJECT_EDIT or the handle to
%      the existing singleton*.
%
%      OBJECT_EDIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OBJECT_EDIT.M with the given input arguments.
%
%      OBJECT_EDIT('Property','Value',...) creates a new OBJECT_EDIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before object_edit_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to object_edit_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help object_edit

% Last Modified by GUIDE v2.5 02-Mar-2018 01:40:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @object_edit_OpeningFcn, ...
                   'gui_OutputFcn',  @object_edit_OutputFcn, ...
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


% --- Executes just before object_edit is made visible.
function object_edit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to object_edit (see VARARGIN)

% Choose default command line output for object_edit
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes object_edit wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = object_edit_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% For convenience in browsing, set a starting folder from which to browse.
global I
startingFolder = 'C:\Program Files\MATLAB';
if ~exist(startingFolder, 'dir')
    % If that folder doesn't exist, just start in the current folder.
    startingFolder = pwd;
end
% Get the name of the file that the user wants to use.
defaultFileName = fullfile(startingFolder, '*.jpg');
[baseFileName, folder] = uigetfile(defaultFileName, 'Select a file');
if baseFileName == 0
    % User clicked the Cancel button.
    return;
end
fullFileName = fullfile(folder, baseFileName);
I = imread(fullFileName);
axes(handles.axes1);
imshow(I)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
%To detect Face
FDetect = vision.CascadeObjectDetector;

%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);

axes(handles.axes2);
imshow(I); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end
title('Face Detection');
hold off;




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I
%To detect Nose
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',16);

BB=step(NoseDetect,I);


axes(handles.axes2);
imshow(I); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','b');
end
title('Nose Detection');
hold off;


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called





% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
hold off;
cla reset;
axes(handles.axes2);
hold off;
cla reset;
axes(handles.axes3);
hold off;
cla reset;


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
startingFolder = 'C:\Program Files\MATLAB';
if ~exist(startingFolder, 'dir')
    % If that folder doesn't exist, just start in the current folder.
    startingFolder = pwd;
end
% Get the name of the file that the user wants to use.
defaultFileName = fullfile(startingFolder, '*.jpg');
[baseFileName, folder] = uigetfile(defaultFileName, 'Select a file');
if baseFileName == 0
    % User clicked the Cancel button.
    return;
end
fullFileName = fullfile(folder, baseFileName);
I1 = imread(fullFileName);
axes(handles.axes1);
imshow(I1)

I2 = imcrop(I1);
axes(handles.axes1);
imshow(I2)
title('Original Image')

axes(handles.axes3);
imshow(I2)
title('Cropped Image')
axes(handles.axes1);
imshow(I1)
imsave
title('Original Image')




% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
startingFolder = 'C:\Program Files\MATLAB';
if ~exist(startingFolder, 'dir')
    % If that folder doesn't exist, just start in the current folder.
    startingFolder = pwd;
end
% Get the name of the file that the user wants to use.
defaultFileName = fullfile(startingFolder, '*.jpg');
[baseFileName, folder] = uigetfile(defaultFileName, 'Select a file');
if baseFileName == 0
    % User clicked the Cancel button.
    return;
end
fullFileName = fullfile(folder, baseFileName);
I3 = imread(fullFileName);
axes(handles.axes1);
imshow(I3)

axes(handles.axes1);
imshow(I3)
H=imrect(gca);
pos=wait(H);
close all
I3(pos(1,2):pos(1,2)+pos(1,4),pos(1,1):pos(1,1)+pos(1,3))=0;
imshow(I3);
imsave


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
hold off;
cla reset;
