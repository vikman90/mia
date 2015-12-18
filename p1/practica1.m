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

% Last Modified by GUIDE v2.5 18-Dec-2015 10:22:55

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
handles.im = cell(1, 3);
handles.axes = {handles.axes1 handles.axes2 handles.axes3};
handles.ifile = 1;
handles.iorigin = 1;
handles.itarget = 2;
handles.hasColorbar = zeros(1, 3);
handles.curColormap = 'gray';
handles.sizes = {handles.txtSize1 handles.txtSize2 handles.txtSize3};
handles.methods = {'nearest', 'bilinear', 'bicubic'};
handles.method = 'nearest';
handles.argtype = 1; % 1: factor, 2: tamaño
handles.subFactor = 2;
handles.interFactor = 2;
handles.interWidth = 128;
handles.interHeight = 128;
handles.useMean = false;

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

set(handles.txtStatus, 'String', '');
filename = imgetfile;

if (filename)
    im = imread(filename);
    
    if (ndims(im) > 2)
        im = rgb2gray(im);
    end

    i = handles.ifile;
    axes(handles.axes{i});
    imshow(im, []);
    colormap(handles.curColormap);
    handles.im{i} = im;
    updatesize(handles, i);
    guidata(hObject, handles);
end


% --- Executes on button press in btsave.
function btsave_Callback(hObject, eventdata, handles)
% hObject    handle to btsave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.txtStatus, 'String', '');
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

updatecolormap(hObject, handles);


% --- Callback colectivo para el slider y el menu desplegable
function updatecolormap(hObject, handles)
% hObject   manejador de objeto (solo importa el padre, para guidata)
% handles   estructura de manejadores

string = cellstr(get(handles.menuColor, 'String'));
value = get(handles.menuColor, 'Value');
name = string{value};
range = get(handles.slRange, 'Value');

handles.curColormap = strcat(name, '(', int2str(range), ')');
colormap(handles.curColormap);
guidata(hObject, handles);

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

updatecolormap(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slRange_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slRange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btOrigin1.
function btOrigin1_Callback(hObject, eventdata, handles)
% hObject    handle to btOrigin1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btOrigin1

handles.iorigin = 1;
guidata(hObject, handles);


% --- Executes on button press in btOrigin2.
function btOrigin2_Callback(hObject, eventdata, handles)
% hObject    handle to btOrigin2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btOrigin2

handles.iorigin = 2;
guidata(hObject, handles);


% --- Executes on button press in btOrigin3.
function btOrigin3_Callback(hObject, eventdata, handles)
% hObject    handle to btOrigin3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btOrigin3

handles.iorigin = 3;
guidata(hObject, handles);


% --- Executes on button press in btTarget1.
function btTarget1_Callback(hObject, eventdata, handles)
% hObject    handle to btTarget1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btTarget1

handles.itarget = 1;
guidata(hObject, handles);


% --- Executes on button press in btTarget2.
function btTarget2_Callback(hObject, eventdata, handles)
% hObject    handle to btTarget2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btTarget2

handles.itarget = 2;
guidata(hObject, handles);


% --- Executes on button press in btTarget3.
function btTarget3_Callback(hObject, eventdata, handles)
% hObject    handle to btTarget3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btTarget3

handles.itarget = 3;
guidata(hObject, handles);

% --- Actualiza la información del tamaño de imagen
function updatesize(handles, i)
% handles   manejadores
% i         índice de eje

s = size(handles.im{i});
set(handles.sizes{i}, 'String', horzcat(int2str(s(2)), ' x ', int2str(s(1))));


% --- Executes on button press in btFactor.
function btFactor_Callback(hObject, eventdata, handles)
% hObject    handle to btFactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btFactor

handles.argtype = 1;
guidata(hObject, handles);


% --- Executes on button press in btSize.
function btSize_Callback(hObject, eventdata, handles)
% hObject    handle to btSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btSize

handles.argtype = 2;
guidata(hObject, handles);


% --- Executes on button press in btSubsample.
function btSubsample_Callback(hObject, eventdata, handles)
% hObject    handle to btSubsample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

i = handles.iorigin;
j = handles.itarget;
f = handles.subFactor;
[m, n] = size(handles.im{i});

set(handles.txtStatus, 'String', '');

if ([m n] == [0 0])
    set(handles.txtStatus, 'String', 'La ventana de origen está vacía.');
    return;
elseif (f < 1)
    set(handles.txtStatus, 'String', 'Especifique un factor mayor que 0.');
    return;
end

if (handles.useMean)
    im = immean(handles.im{i}, handles.subFactor);
    handles.im{j} = im(1:f:m, 1:f:n);
else
    handles.im{j} = handles.im{i}(1:f:m, 1:f:n);
end

axes(handles.axes{j});
imshow(handles.im{j}, []);
colormap(handles.curColormap);
updatesize(handles, j);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function txtSubFactor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSubFactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btDiff.
function btDiff_Callback(hObject, eventdata, handles)
% hObject    handle to btDiff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

i = handles.iorigin;
j = handles.itarget;
s1 = size(handles.im{i});
s2 = size(handles.im{j});

if (s1 == [0 0]) 
    set(handles.txtStatus, 'String', 'La ventana A está vacía.');
    return;
elseif (s2 == [0 0]) 
    set(handles.txtStatus, 'String', 'La ventana B está vacía.');
    return;
elseif (s1 - s2 ~= [0 0])
    set(handles.txtStatus, 'String', 'El tamaño de las imágenes difiere.');
    return;
end

figure;
imshow(handles.im{i} - handles.im{j}, []);

% --- Executes on button press in btError.
function btError_Callback(hObject, eventdata, handles)
% hObject    handle to btError (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

i = handles.iorigin;
j = handles.itarget;
s1 = size(handles.im{i});
s2 = size(handles.im{j});

if (s1 == [0 0]) 
    set(handles.txtStatus, 'String', 'La ventana A está vacía.');
    return;
elseif (s2 == [0 0]) 
    set(handles.txtStatus, 'String', 'La ventana B está vacía.');
    return;
elseif (s1 - s2 ~= [0 0])
    set(handles.txtStatus, 'String', 'El tamaño de las imágenes difiere.');
    return;
end

error = sum(sum(im2double(handles.im{i} - handles.im{j}).^2)) / prod(s1);
set(handles.txtError, 'String', num2str(error));


% --- Executes on button press in btInterpolate.
function btInterpolate_Callback(hObject, eventdata, handles)
% hObject    handle to btInterpolate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

i = handles.iorigin;
j = handles.itarget;
f = handles.interFactor;
w = handles.interWidth;
h = handles.interHeight;
[m, n] = size(handles.im{i});

set(handles.txtStatus, 'String', '');

if ([m n] == [0 0])
    set(handles.txtStatus, 'String', 'La ventana de origen está vacía.');
    return;
end

if (handles.argtype == 1)
    if (f < 1)
        set(handles.txtStatus, 'String', 'Especifique un factor mayor que 0.');
        return;
    end
    
    handles.im{j} = imresize(handles.im{i}, f, handles.method);
else
    if (w < 1)
        set(handles.txtStatus, 'String', 'Especifique un ancho mayor que 0.');
        return
    elseif (h < 1)
        set(handles.txtStatus, 'String', 'Especifique un alto mayor que 0.');
        return;
    end
    
    handles.im{j} = imresize(handles.im{i}, [w h], handles.method);
end

axes(handles.axes{j});
imshow(handles.im{j}, []);
colormap(handles.curColormap);
updatesize(handles, j);
guidata(hObject, handles);


function txtInterFactor_Callback(hObject, eventdata, handles)
% hObject    handle to txtInterFactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtInterFactor as text
%        str2double(get(hObject,'String')) returns contents of txtInterFactor as a double

[x, status] = str2num(get(hObject, 'String'));

if (status)
    handles.interFactor = x;
else
    handles.interFactor = 0;
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function txtInterFactor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtInterFactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtInterWidth_Callback(hObject, eventdata, handles)
% hObject    handle to txtInterWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtInterWidth as text
%        str2double(get(hObject,'String')) returns contents of txtInterWidth as a double

[x, status] = str2num(get(hObject, 'String'));

if (status)
    handles.interWidth = x;
else
    handles.interWidth = 0;
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function txtInterWidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtInterWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtInterHeight_Callback(hObject, eventdata, handles)
% hObject    handle to txtInterHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtInterHeight as text
%        str2double(get(hObject,'String')) returns contents of txtInterHeight as a double

[x, status] = str2num(get(hObject, 'String'));

if (status)
    handles.interHeight = x;
else
    handles.interHeight = 0;
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function txtInterHeight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtInterHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menuMethod.
function menuMethod_Callback(hObject, eventdata, handles)
% hObject    handle to menuMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menuMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menuMethod

i = get(hObject, 'Value');
handles.method = handles.methods{i};
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function menuMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menuMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtSubFactor_Callback(hObject, eventdata, handles)
% hObject    handle to txtSubFactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSubFactor as text
%        str2double(get(hObject,'String')) returns contents of txtSubFactor as a double

[x, status] = str2num(get(hObject, 'String'));

if (status)
    handles.subFactor = x;
else
    handles.subFactor = 0;
end

guidata(hObject, handles);


% --- Executes on button press in boxMean.
function boxMean_Callback(hObject, eventdata, handles)
% hObject    handle to boxMean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of boxMean

handles.useMean = get(hObject, 'Value');
guidata(hObject, handles);

% --- Suavizar imagen mediante la media
function I2 = immean(I, factor)
% I         imagen de entrada
% factor    factor de suavizado

h = ones(factor) / factor^2;

%if (mod(factor, 2) == 0)
%    h(:, factor + 1) = 0;
%    h(factor + 1, :) = 0;
%end

I2 = imfilter(I, h, 'conv');    % Por defecto: 'same'
