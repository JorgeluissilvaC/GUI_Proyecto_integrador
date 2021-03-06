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

% Last Modified by GUIDE v2.5 20-Oct-2016 15:07:59

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
%get_param('diagb/PID','DialogParameters')
k=(get(handles.k,'String'));
set_param('diagb/PID','P',k,'I','0','D','0')


set_param('diagb/PID','P',k)
set(handles.edit4,'String',get_param('diagb/actuador','denominator'));
set(handles.edit3,'String',get_param('diagb/actuador','numerator'));

set(handles.edit6,'String',get_param('diagb/planta','denominator'));
set(handles.edit5,'String',get_param('diagb/planta','numerator'));

set(handles.edit10,'String',get_param('diagb/Sensor','denominator'));
set(handles.edit9,'String',get_param('diagb/Sensor','numerator'));
evalin('base','clear all')
global cont
cont=0;
% Choose default command line output for Pintegrador
handles.output = hObject;

% Set the colors indicating a selected/unselected tab
handles.unselectedTabColor=get(handles.tab1text,'BackgroundColor');
handles.selectedTabColor=handles.unselectedTabColor-0.1;

% Set units to normalize for easier handling
set(handles.tab1text,'Units','normalized')
set(handles.tab2text,'Units','normalized')
%set(handles.tab3text,'Units','normalized')
set(handles.tab1Panel,'Units','normalized')
set(handles.tab2Panel,'Units','normalized')
%set(handles.tab3Panel,'Units','normalized')

% Create tab labels (as many as you want according to following code template)

% Tab 1
pos1=get(handles.tab1text,'Position');
handles.a1=axes('Units','normalized',...
    'Box','on',...
    'XTick',[],...
    'YTick',[],...
    'Color',handles.selectedTabColor,...
    'Position',[pos1(1) pos1(2) pos1(3) pos1(4)+0.01],...
    'ButtonDownFcn','Pintegrador(''a1bd'',gcbo,[],guidata(gcbo))');
handles.t1=text('String','Tab 1',...
    'Units','normalized',...
    'Position',[(pos1(3)-pos1(1))/2,pos1(2)/2+pos1(4)],...
    'HorizontalAlignment','left',...
    'VerticalAlignment','middle',...
    'Margin',0.001,...
    'FontSize',8,...
    'Backgroundcolor',handles.selectedTabColor,...
    'ButtonDownFcn','Pintegrador(''t1bd'',gcbo,[],guidata(gcbo))');

% Tab 2
pos2=get(handles.tab2text,'Position');
pos2(1)=pos1(1)+pos1(3);
handles.a2=axes('Units','normalized',...
    'Box','on',...
    'XTick',[],...
    'YTick',[],...
    'Color',handles.unselectedTabColor,...
    'Position',[pos2(1) pos2(2) pos2(3) pos2(4)+0.01],...
    'ButtonDownFcn','Pintegrador(''a2bd'',gcbo,[],guidata(gcbo))');
handles.t2=text('String','Tab 2',...
    'Units','normalized',...
    'Position',[pos2(3)/2,pos2(2)/2+pos2(4)],...
    'HorizontalAlignment','left',...
    'VerticalAlignment','middle',...
    'Margin',0.001,...
    'FontSize',8,...
    'Backgroundcolor',handles.unselectedTabColor,...
    'ButtonDownFcn','Pintegrador(''t2bd'',gcbo,[],guidata(gcbo))');
% Tab 3
% pos3=get(handles.tab3text,'Position');
% pos3(1)=pos2(1)+pos2(3);
% handles.a3=axes('Units','normalized',...
%                 'Box','on',...
%                 'XTick',[],...
%                 'YTick',[],...
%                 'Color',handles.unselectedTabColor,...
%                 'Position',[pos3(1) pos3(2) pos3(3) pos3(4)+0.01],...
%                 'ButtonDownFcn','Pintegrador(''a3bd'',gcbo,[],guidata(gcbo))');
% handles.t3=text('String','Tab 3',...
%                 'Units','normalized',...
%                 'Position',[pos3(3)/2,pos3(2)/2+pos3(4)],...
%                 'HorizontalAlignment','left',...
%                 'VerticalAlignment','middle',...
%                 'Margin',0.001,...
%                 'FontSize',8,...
%                 'Backgroundcolor',handles.unselectedTabColor,...
%                 'ButtonDownFcn','Pintegrador(''t3bd'',gcbo,[],guidata(gcbo))');

% Manage panels (place them in the correct position and manage visibilities)
pan1pos=get(handles.tab1Panel,'Position');
set(handles.tab2Panel,'Position',pan1pos)
%set(handles.tab3Panel,'Position',pan1pos)
set(handles.tab2Panel,'Visible','off')
%set(handles.tab3Panel,'Visible','off')

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Pintegrador wait for user response (see UIRESUME)
% uiwait(handles.figure1);
function t1bd(hObject,eventdata,handles)

set(hObject,'BackgroundColor',handles.selectedTabColor)
set(handles.t2,'BackgroundColor',handles.unselectedTabColor)
%set(handles.t3,'BackgroundColor',handles.unselectedTabColor)
set(handles.a1,'Color',handles.selectedTabColor)
set(handles.a2,'Color',handles.unselectedTabColor)
%set(handles.a3,'Color',handles.unselectedTabColor)
set(handles.tab1Panel,'Visible','on')
set(handles.tab2Panel,'Visible','off')
%set(handles.tab3Panel,'Visible','off')

function t2bd(hObject,eventdata,handles)

set(hObject,'BackgroundColor',handles.selectedTabColor)
set(handles.t1,'BackgroundColor',handles.unselectedTabColor)
%set(handles.t3,'BackgroundColor',handles.unselectedTabColor)
set(handles.a2,'Color',handles.selectedTabColor)
set(handles.a1,'Color',handles.unselectedTabColor)
%set(handles.a3,'Color',handles.unselectedTabColor)
set(handles.tab2Panel,'Visible','on')
set(handles.tab1Panel,'Visible','off')
%set(handles.tab3Panel,'Visible','off')

% function t3bd(hObject,eventdata,handles)
%
% set(hObject,'BackgroundColor',handles.selectedTabColor)
% set(handles.t1,'BackgroundColor',handles.unselectedTabColor)
% set(handles.t2,'BackgroundColor',handles.unselectedTabColor)
% set(handles.a3,'Color',handles.selectedTabColor)
% set(handles.a1,'Color',handles.unselectedTabColor)
% set(handles.a2,'Color',handles.unselectedTabColor)
% set(handles.tab3Panel,'Visible','on')
% set(handles.tab1panel,'Visible','off')
% set(handles.tab2panel,'Visible','off')

% Axes object 1 callback (tab 1)
function a1bd(hObject,eventdata,handles)

set(hObject,'Color',handles.selectedTabColor)
set(handles.a2,'Color',handles.unselectedTabColor)
%set(handles.a3,'Color',handles.unselectedTabColor)
set(handles.t1,'BackgroundColor',handles.selectedTabColor)
set(handles.t2,'BackgroundColor',handles.unselectedTabColor)
%set(handles.t3,'BackgroundColor',handles.unselectedTabColor)
set(handles.tab1Panel,'Visible','on')
set(handles.tab2Panel,'Visible','off')
%set(handles.tab3Panel,'Visible','off')


% Axes object 2 callback (tab 2)
function a2bd(hObject,eventdata,handles)

set(hObject,'Color',handles.selectedTabColor)
set(handles.a1,'Color',handles.unselectedTabColor)
%set(handles.a3,'Color',handles.unselectedTabColor)
set(handles.t2,'BackgroundColor',handles.selectedTabColor)
set(handles.t1,'BackgroundColor',handles.unselectedTabColor)
%set(handles.t3,'BackgroundColor',handles.unselectedTabColor)
set(handles.tab2Panel,'Visible','on')
set(handles.tab1Panel,'Visible','off')
%set(handles.tab3Panel,'Visible','off')


% Axes object 3 callback (tab 3)
% function a3bd(hObject,eventdata,handles)
%
% set(hObject,'Color',handles.selectedTabColor)
% set(handles.a1,'Color',handles.unselectedTabColor)
% set(handles.a2,'Color',handles.unselectedTabColor)
% set(handles.t3,'BackgroundColor',handles.selectedTabColor)
% set(handles.t1,'BackgroundColor',handles.unselectedTabColor)
% set(handles.t2,'BackgroundColor',handles.unselectedTabColor)
% set(handles.tab3Panel,'Visible','on')
% set(handles.tab1panel,'Visible','off')
% set(handles.tab2panel,'Visible','off')



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

global ncont nact npl nsn A B C D TF TF2 A1 B1 C1 D1 Gm Gm2
% Gm -> Funci�n Original ; Gm2 -> Funci�n Aproximada
%----------------------------------------------------------
a='Escal�n';
c='Parabola';
b='Rampa';
d='Impulso';
xo = {a;b;c;d};
set(handles.popupmenu1,'string',xo)

%-----------------------------------------------------
tft=((ncont*nact)*npl)/(1+((ncont*nact)*npl)*nsn);
Gm=tft;
[b,a]=tfdata(Gm,'v');
[A,B,C,D]=tf2ss(b,a);
disp(B)
disp(A)
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
norm=Gm2.den{1,1}./Gm2.den{1,1}(1);
cita=norm(2)/(2*norm(3));
own=sqrt(norm(3));
%Calculo de error
syms s
syms x
% en laplace
escalon=1/s;
rampa=1/s^2;
parabola=1/s^3;
impulso=1;
%en el tiempo
escalonx=1;
rampax=x;
parabolax=x^2/2;
impulsox=dirac(x);
[num,den]=tfdata(Gm2,'v');
nume=poly2sym(num,s);
deno=poly2sym(den,s);
c_t=ilaplace((nume/deno)*escalon,s,x);
e_escalon=abs(limit(escalonx-c_t,x,inf));
c_t=ilaplace((nume/deno)*rampa,s,x);
e_rampa=abs(limit(rampax-c_t,x,inf));
c_t=ilaplace((nume/deno)*parabola,s,x);
e_parabola=abs(limit(parabolax-c_t,x,inf));
c_t=ilaplace((nume/deno)*impulso,s,x);
e_impulso=abs(limit(impulsox-c_t,x,inf));
%disp(Gm);disp(Gm2)
bb=stepinfo(Gm2);
a=strcat('tr=',num2str(bb.RiseTime));
b=strcat('tp=',num2str(bb.PeakTime));
c=strcat('ts=',num2str(bb.SettlingTime));
d=strcat('Mp%=',num2str(bb.Overshoot));
e=strcat('K=',(get(handles.edit1,'String')));
f=strcat('Er step=',num2str(sym2poly(e_escalon)));
g=strcat('Er ramp=',num2str(sym2poly(e_rampa)));
h=strcat('Er par=',num2str(sym2poly(e_parabola)));
i=strcat('Er imp=',num2str(sym2poly(e_impulso)));
%f=strcat('error=');
xl = {a;b;c;d;e;f;g;h;i};
set(handles.params,'string',xl)
%set(handles.actuador,'String',s);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ncont; %Controlador
num=(get(handles.edit1,'String'));
den=(get(handles.edit2,'String'));
%set_param('diagb/controlador','numerator',num);
% num1num;
% den1=den;
num=str2num(num);
den=str2num('1');
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
%den=(get(handles.edit2,'String'));
set_param('diagb/controlador','denominator',den);
set_param('diagb/controlador','numerator',num);
% num1num;
% den1=den;
num=str2num(num);
den=str2num('1');
ncont=tf(num,1);
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
% H int: place code in OpeningFcn to populate axes4


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
    disp(B)
    select = get(handles.TF,'Value');
    if select == 1
        set(handles.tfs,'String',num2str(A));
        
    end
    
    select = get(handles.TF2,'Value');
    if select == 1
        set(handles.tfs,'String',num2str(A1));
    end
    
    
elseif hObject == handles.C
    disp(B)
    select = get(handles.TF,'Value');
    if select == 1
        set(handles.tfs,'String',num2str(C));
    end
    select = get(handles.TF2,'Value');
    if select == 1
        set(handles.tfs,'String',num2str(C1));
    end
    
elseif hObject == handles.nb
    
    select = get(handles.TF,'Value');
    if select == 1
        set(handles.tfs,'String',num2str(B));
    end
    select = get(handles.TF2,'Value');
    if select == 1
        set(handles.tfs,'String',num2str(B1));
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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Gm Gm2 numH denH num den cont
Plo = get(handles.popupmenu1,'value');
time =str2double(get(handles.time,'String'));
h =str2double(get(handles.h,'String'));
Res = get(handles.radiobutton9, 'Value');   %Superponer

t=0:h:time;
u_t=0.*(t<0)+1.*(t>=0);     %Escalon
p_t=t.^2/2;                 %Parabola
r_t=t;                      %Rampa
%i_t=1.*(t==0);              %Impulso
switch Plo
    case 1
        if(Res)
            cont=cont+1;
            assignin('base','cont',cont);
            [num,den]=tfdata(Gm);
            assignin('base','num',num);
            assignin('base','den',den);
            numH{cont}=num;
            denH{cont}=den;
            assignin('base','numH',numH);
            assignin('base','denH',denH);
            
            cla(handles.axes6)
            for i=1:1:length(numH)
                [s,t]=lsim(tf(numH{i},denH{i}),u_t,t);
                hold(handles.axes6,'on')
                plot(t,s,'parent',handles.axes6);
                plot(t,u_t,'k','parent',handles.axes6);
            end
        else
            evalin('base','clearvars -except cont')
            clear global numH;
            clear global denH;
            cont=0;
            assignin('base','cont',cont);
            [s,t]=lsim(Gm,u_t,t);
            cla(handles.axes6);
            hold(handles.axes6,'on')
            plot(t,s,'parent',handles.axes6);
            plot(t,u_t,'k','parent',handles.axes6);
        end
    case 2
        if (Res)
            
            cont=cont+1;
            assignin('base','cont',cont);
            [num,den]=tfdata(Gm);
            assignin('base','num',num);
            assignin('base','den',den);
            numH{cont}=num;
            denH{cont}=den;
            assignin('base','numH',numH);
            assignin('base','denH',denH);
            cla(handles.axes6)
            for i=1:1:length(numH)
                [d,t]=lsim(tf(numH{i},denH{i}),r_t,t);
                hold(handles.axes6,'on')
                plot(t,d,'parent',handles.axes6);
                plot(t,r_t,'k','parent',handles.axes6);
            end
        else
            evalin('base','clearvars -except cont')
            clear global numH;
            clear global denH;
            cont=0;
            assignin('base','cont',cont);
            cla(handles.axes6);
            [d,t]=lsim(Gm,r_t,t);
            hold(handles.axes6,'on')
            plot(t,d,'parent',handles.axes6);
            plot(t,r_t,'k','parent',handles.axes6);
        end
    case 3
        if (Res)
            
            cont=cont+1;
            assignin('base','cont',cont);
            [num,den]=tfdata(Gm);
            assignin('base','num',num);
            assignin('base','den',den);
            numH{cont}=num;
            denH{cont}=den;
            assignin('base','numH',numH);
            assignin('base','denH',denH);
            cla(handles.axes6)
            for i=1:1:length(numH)
                [d,t]=lsim(tf(numH{i},denH{i}),p_t,t);
                hold(handles.axes6,'on')
                plot(t,d,'parent',handles.axes6);
                plot(t,p_t,'k','parent',handles.axes6);
            end
        else
            evalin('base','clearvars -except cont')
            clear global numH;
            clear global denH;
            cont=0;
            assignin('base','cont',cont);
            cla(handles.axes6);
            [d,t]=lsim(Gm,p_t,t);
            hold(handles.axes6,'on')
            plot(t,d,'parent',handles.axes6);
            plot(t,p_t,'k','parent',handles.axes6);
        end
    case 4
        if (Res)
            
            cont=cont+1;
            assignin('base','cont',cont);
            [num,den]=tfdata(Gm);
            assignin('base','num',num);
            assignin('base','den',den);
            numH{cont}=num;
            denH{cont}=den;
            assignin('base','numH',numH);
            assignin('base','denH',denH);
            cla(handles.axes6)
            for i=1:1:length(numH)
                [d,ti]=impulse(tf(numH{i},denH{i}),time);
                i_t=0.*(ti~=0)+1.*(ti==0);
                hold(handles.axes6,'on')
                plot(ti,d,'parent',handles.axes6);
                plot(ti,i_t,'k','parent',handles.axes6);
            end
        else
            evalin('base','clearvars -except cont')
            clear global numH;
            clear global denH;
            cont=0;
            assignin('base','cont',cont);
            cla(handles.axes6);
            [d,ti]=impulse(Gm,time);
            i_t=0.*(ti~=0)+1.*(ti==0);
            hold(handles.axes6,'on')
            plot(ti,d,'parent',handles.axes6);
            plot(ti,i_t,'k','parent',handles.axes6);
        end
end
switch Plo
    case 1
        if(Res)
            cont=cont+1;
            assignin('base','cont',cont);
            [num,den]=tfdata(Gm2);
            assignin('base','num',num);
            assignin('base','den',den);
            numH{cont}=num;
            denH{cont}=den;
            assignin('base','numH',numH);
            assignin('base','denH',denH);
            
            cla(handles.axes10)
            for i=1:1:length(numH)
                [s,t]=lsim(tf(numH{i},denH{i}),u_t,t);
                hold(handles.axes10,'on')
                plot(t,s,'parent',handles.axes10);
                plot(t,u_t,'k','parent',handles.axes10);
            end
        else
            evalin('base','clearvars -except cont')
            clear global numH;
            clear global denH;
            cont=0;
            assignin('base','cont',cont);
            [s,t]=lsim(Gm2,u_t,t);
            cla(handles.axes10);
            hold(handles.axes10,'on')
            plot(t,s,'parent',handles.axes10);
            plot(t,u_t,'k','parent',handles.axes10);
        end
    case 2
        if (Res)
            
            cont=cont+1;
            assignin('base','cont',cont);
            [num,den]=tfdata(Gm2);
            assignin('base','num',num);
            assignin('base','den',den);
            numH{cont}=num;
            denH{cont}=den;
            assignin('base','numH',numH);
            assignin('base','denH',denH);
            cla(handles.axes10)
            for i=1:1:length(numH)
                [d,t]=lsim(tf(numH{i},denH{i}),r_t,t);
                hold(handles.axes10,'on')
                plot(t,d,'parent',handles.axes10);
                plot(t,r_t,'k','parent',handles.axes10);
            end
        else
            evalin('base','clearvars -except cont')
            clear global numH;
            clear global denH;
            cont=0;
            assignin('base','cont',cont);
            cla(handles.axes10);
            [d,t]=lsim(Gm2,r_t,t);
            hold(handles.axes10,'on')
            plot(t,d,'parent',handles.axes10);
            plot(t,r_t,'k','parent',handles.axes10);
        end
    case 3
        if (Res)
            
            cont=cont+1;
            assignin('base','cont',cont);
            [num,den]=tfdata(Gm2);
            assignin('base','num',num);
            assignin('base','den',den);
            numH{cont}=num;
            denH{cont}=den;
            assignin('base','numH',numH);
            assignin('base','denH',denH);
            cla(handles.axes10)
            for i=1:1:length(numH)
                [d,t]=lsim(tf(numH{i},denH{i}),p_t,t);
                hold(handles.axes10,'on')
                plot(t,d,'parent',handles.axes10);
                plot(t,p_t,'k','parent',handles.axes10);
            end
        else
            evalin('base','clearvars -except cont')
            clear global numH;
            clear global denH;
            cont=0;
            assignin('base','cont',cont);
            cla(handles.axes10);
            [d,t]=lsim(Gm2,p_t,t);
            hold(handles.axes10,'on')
            plot(t,d,'parent',handles.axes10);
            plot(t,p_t,'k','parent',handles.axes10);
        end
    case 4
        if (Res)
            
            cont=cont+1;
            assignin('base','cont',cont);
            [num,den]=tfdata(Gm2);
            assignin('base','num',num);
            assignin('base','den',den);
            numH{cont}=num;
            denH{cont}=den;
            assignin('base','numH',numH);
            assignin('base','denH',denH);
            cla(handles.axes10)
            for i=1:1:length(numH)
                [d,ti]=impulse(tf(numH{i},denH{i}),time);
                i_t=0.*(ti~=0)+1.*(ti==0);
                hold(handles.axes10,'on')
                plot(ti,d,'parent',handles.axes10);
                plot(ti,i_t,'k','parent',handles.axes10);
            end
        else
            evalin('base','clearvars -except cont')
            clear global numH;
            clear global denH;
            cont=0;
            assignin('base','cont',cont);
            cla(handles.axes10);
            [d,ti]=impulse(Gm2,time);
            i_t=0.*(ti~=0)+1.*(ti==0);
            hold(handles.axes10,'on')
            plot(ti,d,'parent',handles.axes10);
            plot(ti,i_t,'k','parent',handles.axes10);
        end
end

% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9



function time_Callback(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time as text
%        str2double(get(hObject,'String')) returns contents of time as a double


% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cont_Callback(hObject, eventdata, handles)
% hObject    handle to cont (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cont as text
%        str2double(get(hObject,'String')) returns contents of cont as a double


% --- Executes during object creation, after setting all properties.
function cont_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cont (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function h_Callback(hObject, eventdata, handles)
% hObject    handle to h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of h as text
%        str2double(get(hObject,'String')) returns contents of h as a double


% --- Executes during object creation, after setting all properties.
function h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function params_CreateFcn(hObject, eventdata, handles)
% hObject    handle to params (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in Bank.
function Bank_Callback(hObject, eventdata, handles)
% hObject    handle to Bank (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Bank


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
saveas(handles.axes6,'Sistema.png')



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y=evalin('base','yi');t=evalin('base','tout');
hold(handles.axes15,'off')
plot(handles.axes15,t,y(:,2),'r');
hold(handles.axes15,'on')
plot(handles.axes15,t,y(:,1),'k');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tp=get(handles.seg,'Value');
time1=str2num(get(handles.tiempo1,'String'));
m=5000;
t=linspace(0,time1,m);
hold off
switch tp
     case 1
        sig(1:m)=0;
    case 3
      zz(1:199)=0;
      zz(200:m)=1;
      sig=zz;
    case 2
      imp(1:m)=0;
      imp(400:405)=20;
      sig=imp;
    case 4
       sig=t;
    case 5
       sig=t.^2/2;
   
end
 xi=[t' sig'];
 %plot(handles.axes16,t,sig)
assignin('base','xi',xi);

aa=get(handles.Control,'Value');

switch aa
    case 2
        k=get(handles.k,'String');
        set_param('diagb/PID','P',k);
    case 3
        k=str2num(get(handles.k,'String'));
        ti=str2num(get(handles.ti,'String'));
        ti=k/ti;
        set_param('diagb/PID','P',num2str(k),'I',num2str(ti),'D','0');
    case 4
        k=str2num(get(handles.k,'String'));
        td=str2num(get(handles.td,'String'));
        td=td*k;
        set_param('diagb/PID','P',num2str(k),'I','0','D',num2str(td));        
end
tp1=get(handles.perr,'Value');
hold off
disp('este')
disp(tp1)
disp('este')
switch tp1
    case 1
        sig(1:m)=0;
    case 2
      imp(1:m)=0;
      imp(200:205)=20;
      sig=imp;
      disp('hola')
    case 3
      zz(1:199)=0;
      zz(200:m)=1;
      sig=zz;
    case 4
       sig=t;
    case 5
       sig=t.^2/2; 
end

 per=[t' sig'];
 %plot(handles.axes16,t,sig)
assignin('base','per',per);
set_param('diagb', 'StopTime', num2str(time1))
set_param('diagb', 'SimulationCommand', 'start')

% --- Executes on button press in consig.
function consig_Callback(hObject, eventdata, handles)
% hObject    handle to consig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function Consigg_Callback(hObject, eventdata, handles)
% hObject    handle to Consigg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Consigg as text
%        str2double(get(hObject,'String')) returns contents of Consigg as a double


% --- Executes during object creation, after setting all properties.
function Consigg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Consigg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pertu.
function pertu_Callback(hObject, eventdata, handles)
% hObject    handle to pertu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on selection change in perr.
function perr_Callback(hObject, eventdata, handles)
% hObject    handle to perr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns perr contents as cell array
%        contents{get(hObject,'Value')} returns selected item from perr


% --- Executes during object creation, after setting all properties.
function perr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to perr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in contro.
function contro_Callback(hObject, eventdata, handles)
% hObject    handle to contro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





% --- Executes on selection change in Control.
function Control_Callback(hObject, eventdata, handles)
% hObject    handle to Control (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Control contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Control


% --- Executes during object creation, after setting all properties.
function Control_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Control (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ti_Callback(hObject, eventdata, handles)
% hObject    handle to ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ti as text
%        str2double(get(hObject,'String')) returns contents of ti as a double


% --- Executes during object creation, after setting all properties.
function ti_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function td_Callback(hObject, eventdata, handles)
% hObject    handle to td (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of td as text
%        str2double(get(hObject,'String')) returns contents of td as a double


% --- Executes during object creation, after setting all properties.
function td_CreateFcn(hObject, eventdata, handles)
% hObject    handle to td (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit35_Callback(hObject, eventdata, handles)
% hObject    handle to edit35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit35 as text
%        str2double(get(hObject,'String')) returns contents of edit35 as a double


% --- Executes during object creation, after setting all properties.
function edit35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in seg.
function seg_Callback(hObject, eventdata, handles)
% hObject    handle to seg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns seg contents as cell array
%        contents{get(hObject,'Value')} returns selected item from seg


% --- Executes during object creation, after setting all properties.
function seg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tiempo1_Callback(hObject, eventdata, handles)
% hObject    handle to tiempo1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tiempo1 as text
%        str2double(get(hObject,'String')) returns contents of tiempo1 as a double


% --- Executes during object creation, after setting all properties.
function tiempo1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tiempo1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
