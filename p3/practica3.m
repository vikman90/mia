function varargout = practica3(varargin)
% PRACTICA3 MATLAB code for practica3.fig
%      PRACTICA3, by itself, creates a new PRACTICA3 or raises the existing
%      singleton*.
%
%      H = PRACTICA3 returns the handle to a new PRACTICA3 or the handle to
%      the existing singleton*.
%
%      PRACTICA3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRACTICA3.M with the given input arguments.
%
%      PRACTICA3('Property','Value',...) creates a new PRACTICA3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before practica3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to practica3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help practica3

% Last Modified by GUIDE v2.5 19-Dec-2015 15:42:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @practica3_OpeningFcn, ...
                   'gui_OutputFcn',  @practica3_OutputFcn, ...
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


% --- Executes just before practica3 is made visible.
function practica3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to practica3 (see VARARGIN)

% Choose default command line output for practica3
handles.output = hObject;

set(handles.btOpen, 'cdata', imresize(imread('res/box.png'), [24 24]));
set(handles.btSave, 'cdata', imresize(imread('res/floppy.png'), [24 24]));
handles.im = cell(1, 3);
handles.axes = {handles.axes1 handles.axes2 handles.axes3};

for i = 1:3
    axes(handles.axes{i});
    imshow([]);
end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes practica3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = practica3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function menuSmooth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menuSmooth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function inSmoothSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inSmoothSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btSmooth.
function btSmooth_Callback(hObject, eventdata, handles)
% hObject    handle to btSmooth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (size(handles.im{1}) == [0 0])
    errordlg('No hay imagen cargada.');
    return
end

[s status] = str2num(get(handles.inSmoothSize, 'String'));

if status == 0 || s < 1
    errordlg('Tamaño incorrecto.');
    return
end

switch get(handles.menuSmooth, 'Value')
    case 1
        h = fspecial('average', s);
        handles.im{1} = imfilter(handles.im{1}, h, 'conv');
    case 2
        [sigma, status] = str2num(get(handles.inSmoothSigma, 'String'));
        
        if status == 0 || s < 0
            errordlg('Desviación incorrecta.');
            return
        end
        
        h = fspecial('gaussian', s, sigma);
        handles.im{1} = imfilter(handles.im{1}, h, 'conv');
    case 3
        handles.im{1} = medfilt2(handles.im{1}, [s s]);
    case 4
        handles.im{1} = ordfilt2(handles.im{1}, 1, ones(s));
    case 5
        handles.im{1} = ordfilt2(handles.im{1}, s * s, ones(s));
end

axes(handles.axes{1});
imshow(handles.im{1}, []);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function inSmoothSigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inSmoothSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btOpen.
function btOpen_Callback(hObject, eventdata, handles)
% hObject    handle to btOpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename = imgetfile;

if (filename)
    im = imread(filename);
    
    if (ndims(im) > 2)
        im = rgb2gray(im);
    end

    handles.im{1} = im;
    axes(handles.axes{1});
    imshow(im, []);
    guidata(hObject, handles);
end


% --- Executes on button press in btSave.
function btSave_Callback(hObject, eventdata, handles)
% hObject    handle to btSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(handles.btFile1, 'Value')
    ifile = 1;
elseif get(handles.btFile2, 'Value')
    ifile = 2;
else
    ifile = 3;
end

if size(handles.im{ifile}) == [0 0]
    errordlg('No hay imagen para guardar.');
    return
end

filename = imputfile;

if (filename)
    imwrite(handles.im{ifile}, filename);
end


% --- Executes during object creation, after setting all properties.
function menuEdge_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menuEdge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function inEdgeThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inEdgeThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btEdge.
function btEdge_Callback(hObject, eventdata, handles)
% hObject    handle to btEdge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if size(handles.im{1}) == [0 0]
    errordlg('No hay imagen cargada.');
    return
end

if get(handles.bxAutoThreshold, 'Value')
    threshold = [];
else
    [threshold, status] = str2num(get(handles.inEdgeThreshold, 'String'));
    
    if status == 0 || threshold < 0 || threshold > 1
        errordlg('El umbral debe estar entre 0 y 1.');
        return
    end
end

switch get(handles.menuEdge, 'Value')
    case 1
        handles.im{2} = edge(handles.im{1}, 'Roberts', threshold);
    case 2
        handles.im{2} = edge(handles.im{1}, 'Sobel', threshold);
    case 3
        handles.im{2} = edge(handles.im{1}, 'Prewitt', threshold);
    case 4
        handles.im{2} = edge(handles.im{1}, 'Canny', threshold);
end

axes(handles.axes{2});
imshow(handles.im{2}, []);
guidata(hObject, handles);


% --- Executes on button press in btEigvalues.
function btEigvalues_Callback(hObject, eventdata, handles)
% hObject    handle to btEigvalues (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btGradient.
function btGradient_Callback(hObject, eventdata, handles)
% hObject    handle to btGradient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btCorner.
function btCorner_Callback(hObject, eventdata, handles)
% hObject    handle to btCorner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[threshold, status] = str2num(get(handles.inCornerThreshold, 'String'));
    
if status == 0 || threshold < 0
    errordlg('El umbral debe ser un número positivo.');
    return
end

[wsize, status] = str2num(get(handles.inCornerSize, 'String'));
    
if status == 0 || wsize < 0 || mod(wsize, 2) == 0
    errordlg('El tamaño de ventana debe ser un número positivo impar.');
    return
end

if size(handles.im{1}) == [0 0]
    errordlg('No hay imagen cargada.');
    return
end

% Matriz de gradientes

I = double(handles.im{1});
h = [-1 0 1];
Ix = imfilter(I, h, 'replicate');
Iy = imfilter(I, h', 'replicate');

% 3 matrices de sumatorias de gradientes vecinos

h = ones(wsize);
sumIx2 = imfilter(Ix .^ 2, h, 'replicate');
sumIy2 = imfilter(Iy .^ 2, h, 'replicate');
sumIxy = imfilter(Ix .* Iy, h, 'replicate');

% E <= matriz de mínimos autovalores

[m, n] = size(I);
E = zeros(m, n);

for i = 1:m
    for j = 1:n
        C = [sumIx2(i, j) sumIxy(i, j); sumIxy(i, j) sumIy2(i, j)];
        E(i, j) = min(eig(C));
    end
end

if get(handles.bxRemoveNoMaximum, 'Value')
    [wsize, status] = str2num(get(handles.inRemoveSize, 'String'));
    
    if status == 0 || wsize < 0
        errordlg('El tamaño de ventana de eliminación debe ser un número positivo.');
        return
    end
    
    E = removemax(E, threshold, wsize);
    [f, c] = find(E);
else
    [f, c] = find(E > threshold);
end

axes(handles.axes{3});
imshow(I, []);
hold on;
plot(c, f, 'ys');


% --- Eliminar no-máximos
function M = removemax(E, threshold, wsize)
% E             matriz de autovalores
% threahold     Umbral
% wsize         tamaño del vecindario

% Umbralizar pero mantener valor
M = (E > threshold) .* E;
[f c v] = find(M);

% Tabla de índices de fila, de columna y valor final
T = [f c v];

% Ordenamos en función de la 3ª columna (valor), descendentemente (-)
S = sortrows(T, -3);

% Diferencia máxima
d = floor(wsize / 2);

[m n] = size(S);

for i = 1:m-1
    for j = i+1:m
        if abs(S(i, 1) - S(j, 1)) <= d && abs(S(i, 2) - S(j, 2)) <= d
            M(S(j, 1), S(j, 2)) = 0;
        end
    end
end


% --- Executes during object creation, after setting all properties.
function inCornerThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inCornerThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function inRemoveSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inRemoveSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function inCornerSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inCornerSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function menuGradient_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menuGradient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bxAutoThreshold.
function bxAutoThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to bxAutoThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bxAutoThreshold

if get(hObject, 'Value')
    set(handles.inEdgeThreshold, 'Enable', 'off');
else
    set(handles.inEdgeThreshold, 'Enable', 'on');
end


% --- Executes on button press in bxRemoveNoMaximum.
function bxRemoveNoMaximum_Callback(hObject, eventdata, handles)
% hObject    handle to bxRemoveNoMaximum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bxRemoveNoMaximum

if get(hObject, 'Value')
    set(handles.inRemoveSize, 'Enable', 'on');
else
    set(handles.inRemoveSize, 'Enable', 'off');
end


% --- Executes on selection change in menuSmooth.
function menuSmooth_Callback(hObject, eventdata, handles)
% hObject    handle to menuSmooth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menuSmooth contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menuSmooth

if get(hObject, 'Value') == 2
    set(handles.inSmoothSigma, 'Enable', 'on');
else
    set(handles.inSmoothSigma, 'Enable', 'off');
end
