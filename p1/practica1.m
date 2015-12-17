function varargout = practica1(varargin)
% PRACTICA1 MATLAB code for practica1.fig
%      PRACTICA1, by itself, creates a new PRACTICA1 or raises the existing
%      singleton*.
%
%      H = PRACTICA1 returns the handle to a new PRACTICA1 or the handle to
%      the existing singleton*.
%
%      PRACTICA1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRACTICA1.M with the given input arguments.
%
%      PRACTICA1('Property','Value',...) creates a new PRACTICA1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before practica1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to practica1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help practica1

% Last Modified by GUIDE v2.5 17-Dec-2015 21:24:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @practica1_OpeningFcn, ...
                   'gui_OutputFcn',  @practica1_OutputFcn, ...
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


% --- Executes just before practica1 is made visible.
function practica1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to practica1 (see VARARGIN)

% Choose default command line output for practica1
handles.output = hObject;

set(handles.btopen, 'cdata', imresize(imread('res/box.png'), [24 24]));
set(handles.btsave, 'cdata', imresize(imread('res/floppy.png'), [24 24]));
set(handles.btcolorbar, 'cdata', imresize(imread('res/color.png'), [24 24]));
handles.axes = {handles.axes1 handles.axes2 handles.axes3};
handles.ifile = 1;
handles.hasColorbar = zeros(1, 3);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes practica1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = practica1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btopen.
function btopen_Callback(hObject, eventdata, handles)
% hObject    handle to btopen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename = imgetfile;

if (filename(2))
    im = imread(filename);
    
    if (ndims(im) > 2)
        im = rgb2gray(im);
    end

    i = handles.ifile;
    axes(handles.axes{i});
    imshow(im);
    handles.im{i} = im;
    guidata(hObject, handles);
end


% --- Executes on button press in btsave.
function btsave_Callback(hObject, eventdata, handles)
% hObject    handle to btsave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename = imputfile;

if (filename(2))
    imwrite(handles.im{handles.ifile}, filename);
end


% --- Executes on button press in btcolorbar.
function btcolorbar_Callback(hObject, eventdata, handles)
% hObject    handle to btcolorbar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btcolorbar

i = handles.ifile;

if (handles.hasColorbar(i))
    colorbar(handles.axes{i}, 'off');
else
    colorbar(handles.axes{i});
end

handles.hasColorbar(i) = ~handles.hasColorbar(i);
guidata(hObject, handles);


% --- Executes on button press in btfile1.
function btfile1_Callback(hObject, eventdata, handles)
% hObject    handle to btfile1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btfile1

handles.ifile = 1;
guidata(hObject, handles);


% --- Executes on button press in btfile2.
function btfile2_Callback(hObject, eventdata, handles)
% hObject    handle to btfile2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btfile2

handles.ifile = 2;
guidata(hObject, handles);


% --- Executes on button press in btfile3.
function btfile3_Callback(hObject, eventdata, handles)
% hObject    handle to btfile3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btfile3

handles.ifile = 3;
guidata(hObject, handles);

% --- Executes on selection change in menuColor.
function menuColor_Callback(hObject, eventdata, handles)
% hObject    handle to menuColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menuColor contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menuColor

updatecolormap(handles, handles.ifile);


% --- Callback colectivo para el slider y el menu desplegable
function updatecolormap(handles, i)
% handles   estructura de manejadores
% i         endice de eje

string = cellstr(get(handles.menuColor, 'string'));
value = get(handles.menuColor, 'value');
name = string{value};
range = get(handles.slRange, 'value');
map = strcat(name, '(', int2str(range), ')');
colormap(handles.axes{i}, map);

% --- Executes during object creation, after setting all properties.
function menuColor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menuColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slRange_Callback(hObject, eventdata, handles)
% hObject    handle to slRange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

updatecolormap(handles, handles.ifile);


% --- Executes during object creation, after setting all properties.
function slRange_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slRange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
