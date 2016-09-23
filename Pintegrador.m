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

% Last Modified by GUIDE v2.5 23-Sep-2016 16:45:37

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
global ncont nact npl nsn A B C D TF TF2 A1 B1 C1 D1 Gm Gm2; 
% Gm -> Funci�n Original ; Gm2 -> Funci�n Aproximada
tft=((ncont*nact)*npl)/(1+((ncont*nact)*npl)*nsn);
Gm=tft;
[b,a]=tfdata(Gm,'v');
[A,B,C,D]=tf2ss(b,a);
syms s
num=strcat(char(vpa(poly2sym(Gm.num{1,1},s),3))); 
bar=strcat('-------------------------');
deno=strcat(char(vpa(poly2sym(Gm.den{1,1},s),3)));
TF={num;bar;deno}; %funci�n de transferencia(String)
set(handles.tfs,'String',TF);

Gm2=balred(tft,2); % Funci�n Aproximada de Segundo orden
[b1,a1]=tfdata(Gm2,'v');
[A1,B1,C1,D1]=tf2ss(b1,a1);
num=strcat(char(vpa(poly2sym(Gm2.num{1,1},s),3))); 
bar=strcat('-------------------------');
deno=strcat(char(vpa(poly2sym(Gm2.den{1,1},s),3)));
TF2={num;bar;deno}; %funci�n de transferencia(String)





function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ncont; %Controlador 
num=(get(handles.edit1,'String'));
den=(get(handles.edit2,'String'));
set_param('diagb/controlador','denominator',den);
set_param('diagb/controlador','numerator',num);
% num1num;
% den1=den;
num=str2num(num);
den=str2num(den);
ncont=tf(num,den); % TF controlador 
s=evalc('ncont');
idx = findstr(s,sprintf('\n'));
s = s(idx(3)+1:idx(end-2));
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
global ncont;
num=(get(handles.edit1,'String'));
den=(get(handles.edit2,'String'));
set_param('diagb/controlador','denominator',den);
set_param('diagb/controlador','numerator',num);
% num1num;
% den1=den;
num=str2num(num);
den=str2num(den);
ncont=tf(num,den);
s=evalc('ncont');
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
global nact;
num=(get(handles.edit3,'String'));
den=(get(handles.edit4,'String'));
set_param('diagb/actuador','denominator',den);
set_param('diagb/actuador','numerator',num);
num=str2num(num);
den=str2num(den);
nact=tf(num,den); % TF actuador 
s=evalc('nact');
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
global nact;
num=(get(handles.edit3,'String'));
den=(get(handles.edit4,'String'));
set_param('diagb/actuador','denominator',den);
set_param('diagb/actuador','numerator',num);
num=str2num(num);
den=str2num(den);
nact=tf(num,den); % TF actuador
s=evalc('nact');
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
global npl; % Variable TF planta
num=(get(handles.edit5,'String'));
den=(get(handles.edit6,'String'));
set_param('diagb/planta','denominator',den);
set_param('diagb/planta','numerator',num);
num=str2num(num);
den=str2num(den);
npl=tf(num,den); % TF planta
s=evalc('npl');
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
global npl ; % Variable Planta
num=(get(handles.edit5,'String'));
den=(get(handles.edit6,'String'));
set_param('diagb/planta','denominator',den);
set_param('diagb/planta','numerator',num);
num=str2num(num);
den=str2num(den);
npl=tf(num,den); % TF planta
s=evalc('npl');
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
global nsn; % Variable Sensor 
num=(get(handles.edit9,'String'));
den=(get(handles.edit10,'String'));
set_param('diagb/Sensor','denominator',den);
set_param('diagb/Sensor','numerator',num);
num=str2num(num);
den=str2num(den);
nsn=tf(num,den); % TF sensor 
s=evalc('nsn');
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
global nsn;  % Variable sensor 
num=(get(handles.edit9,'String'));
den=(get(handles.edit10,'String'));
set_param('diagb/Sensor','denominator',den);
set_param('diagb/Sensor','numerator',num);
num=str2num(num);
den=str2num(den);
nsn=tf(num,den);  % TF sensor 
s=evalc('nsn');
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


% --- Executes when selected object is changed in uipanel5.
function uipanel5_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel5 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global ncont nact npl nsn A B C D TF TF2 A1 B1 C1 D1; 

%if hObject == handles.TF

if hObject == handles.A
    select = get(handles.TF,'Value');
    if select == 1
        set(handles.tfs,'String',num2str(A));
    end
    select = get(handles.TF2,'Value');
    if select == 1
        set(handles.tfs,'String',num2str(A1));
    end
elseif hObject == handles.B
    
    select = get(handles.TF,'Value');
    if select == 1
        set(handles.tfs,'String',num2str(B));
    end
    select = get(handles.TF2,'Value');
    if select == 1
        set(handles.tfs,'String',num2str(B1));
    end
    
elseif hObject == handles.C
    
    select = get(handles.TF,'Value');
    if select == 1
        set(handles.tfs,'String',num2str(C));
    end
    select = get(handles.TF2,'Value');
    if select == 1
        set(handles.tfs,'String',num2str(C1));
    end

elseif hObject == handles.D
    
    select = get(handles.TF,'Value');
    if select == 1
        set(handles.tfs,'String',num2str(D));
    end
    select = get(handles.TF2,'Value');
    if select == 1
        set(handles.tfs,'String',num2str(D1));
    end
elseif hObject == handles.ft
    
    select = get(handles.TF,'Value');
    if select == 1
        set(handles.tfs,'String',TF);
    end
    select = get(handles.TF2,'Value');
    if select == 1
        set(handles.tfs,'String',TF2);
    end
end
%end


% --- Executes on button press in TF.
function TF_Callback(hObject, eventdata, handles)
% hObject    handle to TF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TF


% --- Executes on button press in TF2.
function TF2_Callback(hObject, eventdata, handles)
% hObject    handle to TF2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TF2
