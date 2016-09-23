function varargout = Pintegrador(varargin)
% PINTEGRADOR MATLAB code for Pintegrador.fig
%      PINTEGRADOR, by itself, creates a new PINTEGRADOR or raises the existing
%      singleton*.
%
%      H = PINTEGRADOR returns the handle to a new PINTEGRADOR or the handle to
%      the existing singleton*.
%
%      PINTEGRADOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PINTEGRADOR.M with the given input arguments.
%
%      PINTEGRADOR('Property','Value',...) creates a new PINTEGRADOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Pintegrador_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Pintegrador_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Pintegrador

% Last Modified by GUIDE v2.5 23-Sep-2016 14:21:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Pintegrador_OpeningFcn, ...
                   'gui_OutputFcn',  @Pintegrador_OutputFcn, ...
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


% --- Executes just before Pintegrador is made visible.
function Pintegrador_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Pintegrador (see VARARGIN)
find_system('Name','diagb');
open_system('diagb');
handles.output = hObject;
%get data from Simulink
set(handles.edit2,'String',get_param('diagb/controlador','denominator'));
set(handles.edit1,'String',get_param('diagb/controlador','numerator'));

set(handles.edit4,'String',get_param('diagb/actuador','denominator'));
set(handles.edit3,'String',get_param('diagb/actuador','numerator'));

set(handles.edit6,'String',get_param('diagb/planta','denominator'));
set(handles.edit5,'String',get_param('diagb/planta','numerator'));

set(handles.edit10,'String',get_param('diagb/Sensor','denominator'));
set(handles.edit9,'String',get_param('diagb/Sensor','numerator'));
% Choose default command line output for Pintegrador
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Pintegrador wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Pintegrador_OutputFcn(hObject, eventdata, handles) 
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



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n1;
num=(get(handles.edit1,'String'));
den=(get(handles.edit2,'String'));
set_param('diagb/controlador','denominator',den);
set_param('diagb/controlador','numerator',num);
% num1num;
% den1=den;
num=str2num(num);
den=str2num(den);
n1=tf(num,den);
s=evalc('n1');
idx = findstr(s,sprintf('\n'));
s = s(idx(3)+1:idx(end-2));
disp(s)
set(handles.controlador,'String',s);

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n1;
num=(get(handles.edit1,'String'));
den=(get(handles.edit2,'String'));
set_param('diagb/controlador','denominator',den);
set_param('diagb/controlador','numerator',num);
% num1num;
% den1=den;
num=str2num(num);
den=str2num(den);
n1=tf(num,den);
s=evalc('n1');
idx = findstr(s,sprintf('\n'));
s = s(idx(3)+1:idx(end-2));
set(handles.controlador,'String',s);
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n2;
num=(get(handles.edit3,'String'));
den=(get(handles.edit4,'String'));
set_param('diagb/actuador','denominator',den);
set_param('diagb/actuador','numerator',num);
num=str2num(num);
den=str2num(den);
n2=tf(num,den);
s=evalc('n2');
idx = findstr(s,sprintf('\n'));
s = s(idx(3)+1:idx(end-2));
set(handles.actuador,'String',s);
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n2;
num=(get(handles.edit3,'String'));
den=(get(handles.edit4,'String'));
set_param('diagb/actuador','denominator',den);
set_param('diagb/actuador','numerator',num);
num=str2num(num);
den=str2num(den);
n2=tf(num,den);
s=evalc('n2');
idx = findstr(s,sprintf('\n'));
s = s(idx(3)+1:idx(end-2));
set(handles.actuador,'String',s);
% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n3 ;
num=(get(handles.edit5,'String'));
den=(get(handles.edit6,'String'));
set_param('diagb/planta','denominator',den);
set_param('diagb/planta','numerator',num);
num=str2num(num);
den=str2num(den);
n3=tf(num,den);
s=evalc('n3');
idx = findstr(s,sprintf('\n'));
s = s(idx(3)+1:idx(end-2));
set(handles.planta,'String',s);
% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n3 ;
num=(get(handles.edit5,'String'));
den=(get(handles.edit6,'String'));
set_param('diagb/planta','denominator',den);
set_param('diagb/planta','numerator',num);
num=str2num(num);
den=str2num(den);
n3=tf(num,den);
s=evalc('n3');
idx = findstr(s,sprintf('\n'));
s = s(idx(3)+1:idx(end-2));
set(handles.planta,'String',s);
% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n4;
num=(get(handles.edit9,'String'));
den=(get(handles.edit10,'String'));
set_param('diagb/Sensor','denominator',den);
set_param('diagb/Sensor','numerator',num);
num=str2num(num);
den=str2num(den);

n4=tf(num,den);
s=evalc('n4');
idx = findstr(s,sprintf('\n'));
s = s(idx(3)+1:idx(end-2));
set(handles.sensor,'String',s);
% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n4;
num=(get(handles.edit9,'String'));
den=(get(handles.edit10,'String'));
set_param('diagb/Sensor','denominator',den);
set_param('diagb/Sensor','numerator',num);
num=str2num(num);
den=str2num(den);

n4=tf(num,den);
s=evalc('n4');
idx = findstr(s,sprintf('\n'));
s = s(idx(3)+1:idx(end-2));
set(handles.sensor,'String',s);
% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function bloques_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bloques (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
p=imread('diag.jpg');
image(p);
axis off;
% Hint: place code in OpeningFcn to populate bloques


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
p=imread('diag.jpg');
image(p);
axis off;
% Hint: place code in OpeningFcn to populate axes4


% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
p=imread('ascensor.png');
image(p);
axis off;
% Hint: place code in OpeningFcn to populate axes4


% --- Executes during object creation, after setting all properties.
function axes6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4
