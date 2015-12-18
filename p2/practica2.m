function varargout = practica2(varargin)
% PRACTICA2 MATLAB code for practica2.fig
%      PRACTICA2, by itself, creates a new PRACTICA2 or raises the existing
%      singleton*.
%
%      H = PRACTICA2 returns the handle to a new PRACTICA2 or the handle to
%      the existing singleton*.
%
%      PRACTICA2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRACTICA2.M with the given input arguments.
%
%      PRACTICA2('Property','Value',...) creates a new PRACTICA2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before practica2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to practica2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help practica2

% Last Modified by GUIDE v2.5 18-Dec-2015 22:40:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @practica2_OpeningFcn, ...
                   'gui_OutputFcn',  @practica2_OutputFcn, ...
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


% --- Executes just before practica2 is made visible.
function practica2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to practica2 (see VARARGIN)

% Choose default command line output for practica2
handles.output = hObject;

set(handles.btOpen, 'cdata', imresize(imread('res/box.png'), [24 24]));
set(handles.btSave, 'cdata', imresize(imread('res/floppy.png'), [24 24]));
set(handles.btColorbar, 'cdata', imresize(imread('res/color.png'), [24 24]));
handles.im = cell(1, 3);
handles.axes = {handles.axes1 handles.axes2 handles.axes3};
handles.ifile = 1;
handles.iorigin = 1;
handles.itarget = 2;
handles.hasColorbar = zeros(1, 3);
handles.sizes = {handles.txtSize1 handles.txtSize2 handles.txtSize3};
handles.noiseA = -5;
handles.noiseB = 5;
handles.noiseMean = 0;
handles.noiseVariance = 1;
handles.noiseAlpha = 0.1;
handles.noiseSalt = 5;
handles.noisePepper = 5;

hidepanels(handles);
set(handles.ppUniform, 'Visible', 'on');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes practica2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = practica2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function inNoisePepper_Callback(hObject, eventdata, handles)
% hObject    handle to inNoisePepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inNoisePepper as text
%        str2double(get(hObject,'String')) returns contents of inNoisePepper as a double


% --- Executes during object creation, after setting all properties.
function inNoisePepper_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inNoisePepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function inNoiseSalt_Callback(hObject, eventdata, handles)
% hObject    handle to inNoiseSalt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inNoiseSalt as text
%        str2double(get(hObject,'String')) returns contents of inNoiseSalt as a double


% --- Executes during object creation, after setting all properties.
function inNoiseSalt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inNoiseSalt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function inNoiseAlpha_Callback(hObject, eventdata, handles)
% hObject    handle to inNoiseAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inNoiseAlpha as text
%        str2double(get(hObject,'String')) returns contents of inNoiseAlpha as a double


% --- Executes during object creation, after setting all properties.
function inNoiseAlpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inNoiseAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function inNoiseMean_Callback(hObject, eventdata, handles)
% hObject    handle to inNoiseMean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inNoiseMean as text
%        str2double(get(hObject,'String')) returns contents of inNoiseMean as a double


% --- Executes during object creation, after setting all properties.
function inNoiseMean_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inNoiseMean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function inNoiseVariance_Callback(hObject, eventdata, handles)
% hObject    handle to inNoiseVariance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inNoiseVariance as text
%        str2double(get(hObject,'String')) returns contents of inNoiseVariance as a double


% --- Executes during object creation, after setting all properties.
function inNoiseVariance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inNoiseVariance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function inNoiseA_Callback(hObject, eventdata, handles)
% hObject    handle to inNoiseA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inNoiseA as text
%        str2double(get(hObject,'String')) returns contents of inNoiseA as a double


% --- Executes during object creation, after setting all properties.
function inNoiseA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inNoiseA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function inNoiseB_Callback(hObject, eventdata, handles)
% hObject    handle to inNoiseB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inNoiseB as text
%        str2double(get(hObject,'String')) returns contents of inNoiseB as a double


% --- Executes during object creation, after setting all properties.
function inNoiseB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inNoiseB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menuNoiseMethod.
function menuNoiseMethod_Callback(hObject, eventdata, handles)
% hObject    handle to menuNoiseMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menuNoiseMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menuNoiseMethod

hidepanels(handles);

switch get(hObject, 'Value')
    case 1 
        set(handles.ppUniform, 'Visible', 'on');
    case 2 
        set(handles.ppGaussAdd, 'Visible', 'on');
    case 3 
        set(handles.ppGaussMul, 'Visible', 'on');
    case 4 
        set(handles.ppSaltPepper, 'Visible', 'on');
end


% --- Executes during object creation, after setting all properties.
function menuNoiseMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menuNoiseMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boxContour.
function boxContour_Callback(hObject, eventdata, handles)
% hObject    handle to boxContour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of boxContour


% --- Executes on slider movement.
function barLine_Callback(hObject, eventdata, handles)
% hObject    handle to barLine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function barLine_CreateFcn(hObject, eventdata, handles)
% hObject    handle to barLine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
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

    i = handles.ifile;
    axes(handles.axes{i});
    imshow(im, []);
    handles.im{i} = im;
    updatesize(handles, i);
    guidata(hObject, handles);
end


% --- Executes on button press in btSave.
function btSave_Callback(hObject, eventdata, handles)
% hObject    handle to btSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.txtStatus, 'String', '');
filename = imputfile;

if (filename(2))
    imwrite(handles.im{handles.ifile}, filename);
end

i = handles.ifile;

if (handles.hasColorbar(i))
    colorbar(handles.axes{i}, 'off');
else
    colorbar(handles.axes{i});
end

handles.hasColorbar(i) = ~handles.hasColorbar(i);
guidata(hObject, handles);


% --- Executes on button press in btColorbar.
function btColorbar_Callback(hObject, eventdata, handles)
% hObject    handle to btColorbar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

i = handles.ifile;

if (handles.hasColorbar(i))
    colorbar(handles.axes{i}, 'off');
else
    colorbar(handles.axes{i});
end

handles.hasColorbar(i) = ~handles.hasColorbar(i);
guidata(hObject, handles);


% --- Executes on button press in btNoise.
function btNoise_Callback(hObject, eventdata, handles)
% hObject    handle to btNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (size(handles.im{1}) == [0 0])
    errordlg('No hay imagen de entrada.');
    return
end

switch get(handles.menuNoiseMethod, 'Value')
    case 1
        handles.im{2} = noiseuniform(handles);
    case 2
        handles.im{2} = noisegaussadd(handles);
    case 3
        handles.im{2} = noisegaussmul(handles);
    case 4
        handles.im{2} = noisesaltpepper(handles);
end

if size(handles.im{2}) ~= [0 0]
    e = mse(handles.im{1}, handles.im{2});
    s = snr(handles.im{1}, handles.im{2});
    
    axes(handles.axes{2});
    imshow(handles.im{2}, []);
    set(handles.txtNoiseMse, 'String', horzcat('MSE: ', num2str(e)));
    set(handles.txtNoiseSnr, 'String', horzcat('SNR: ', num2str(s), ' dB'));
    updatesize(handles, 2);
    guidata(hObject, handles);
end


% --- Executes on selection change in menuFilterMethod.
function menuFilterMethod_Callback(hObject, eventdata, handles)
% hObject    handle to menuFilterMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menuFilterMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menuFilterMethod

if get(hObject, 'Value') == 2
    set(handles.txtSigma, 'Visible', 'on');
    set(handles.inFilterSigma, 'Visible', 'on');
else
    set(handles.txtSigma, 'Visible', 'off');
    set(handles.inFilterSigma, 'Visible', 'off');
end


% --- Executes during object creation, after setting all properties.
function menuFilterMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menuFilterMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function inFilterSize_Callback(hObject, eventdata, handles)
% hObject    handle to inFilterSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inFilterSize as text
%        str2double(get(hObject,'String')) returns contents of inFilterSize as a double


% --- Executes during object creation, after setting all properties.
function inFilterSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inFilterSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btFilter.
function btFilter_Callback(hObject, eventdata, handles)
% hObject    handle to btFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (size(handles.im{2}) == [0 0])
    errordlg('No hay imagen observada.');
    return
end

[s status] = str2num(get(handles.inFilterSize, 'String'));

if status == 0 || s < 1
    errordlg('Tamaño incorrecto.');
    return
end

switch get(handles.menuFilterMethod, 'Value')
    case 1
        h = fspecial('average', s);
        handles.im{3} = imfilter(handles.im{2}, h, 'conv');
    case 2
        [sigma status] = str2num(get(handles.inFilterSigma, 'String'));
        
        if status == 0 || s < 0
            errordlg('Desviación incorrecta.');
            return
        end
        
        h = fspecial('gaussian', s, sigma);
        handles.im{3} = imfilter(handles.im{2}, h, 'conv');
    case 3
        handles.im{3} = medfilt2(handles.im{2}, [s s]);
    case 4
        handles.im{3} = ordfilt2(handles.im{2}, 1, ones(s));
    case 5
        handles.im{3} = ordfilt2(handles.im{2}, s * s, ones(s));
end

e = mse(handles.im{3}, handles.im{2});
s = snr(handles.im{3}, handles.im{2});
i = isnr(handles.im{1}, handles.im{2}, handles.im{3});
axes(handles.axes{3});
imshow(handles.im{3}, []);
set(handles.txtFilterMse, 'String', horzcat('MSE: ', num2str(e)));
set(handles.txtFilterSnr, 'String', horzcat('SNR: ', num2str(s), ' dB'));
set(handles.txtFilterIsnr, 'String', horzcat('ISNR: ', num2str(i), ' dB'));
updatesize(handles, 3);
guidata(hObject, handles);


% --- Executes on button press in btCompare.
function btCompare_Callback(hObject, eventdata, handles)
% hObject    handle to btCompare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btFile1.
function btFile1_Callback(hObject, eventdata, handles)
% hObject    handle to btFile1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btFile1

handles.ifile = 1;
guidata(hObject, handles);


% --- Executes on button press in btFile2.
function btFile2_Callback(hObject, eventdata, handles)
% hObject    handle to btFile2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btFile2

handles.ifile = 2;
guidata(hObject, handles);


% --- Executes on button press in btFile3.
function btFile3_Callback(hObject, eventdata, handles)
% hObject    handle to btFile3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btFile3

handles.ifile = 3;
guidata(hObject, handles);


% --- Actualiza la información del tamaño de imagen
function updatesize(handles, i)
% handles   manejadores
% i         índice de eje

s = size(handles.im{i});
set(handles.sizes{i}, 'String', horzcat(int2str(s(2)), ' x ', int2str(s(1))));

% --- Ocultar todos los paneles de parámetros
function hidepanels(handles)
% handles   manejadores

set(handles.ppUniform, 'Visible', 'off');
set(handles.ppGaussAdd, 'Visible', 'off');
set(handles.ppGaussMul, 'Visible', 'off');
set(handles.ppSaltPepper, 'Visible', 'off');


% --- Executes on button press in btOrig1.
function btOrig1_Callback(hObject, eventdata, handles)
% hObject    handle to btOrig1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btOrig1

handles.iorigin = 1;
guidata(hObject, handles);


% --- Executes on button press in btOrig2.
function btOrig2_Callback(hObject, eventdata, handles)
% hObject    handle to btOrig2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btOrig2

handles.iorigin = 2;
guidata(hObject, handles);


% --- Executes on button press in btOrig3.
function btOrig3_Callback(hObject, eventdata, handles)
% hObject    handle to btOrig3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btOrig3

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


% --- Ruido uniforme
function I = noiseuniform(handles)
% handles   manejadores

I = [];

[a status] = str2num(get(handles.inNoiseA, 'String'));

if status == 0
    errordlg('Parámetro A incorrecto.');
    return
end

[b status] = str2num(get(handles.inNoiseB, 'String'));

if status == 0
    errordlg('Parámetro B incorrecto.');
    return
end

if a > b
    [a b] = deal(b, a);
end

noise = rand(size(handles.im{1})) * (b - a) + a;
I = uint8(double(handles.im{1}) + noise);

% --- Ruido gaussiano aditivo
function I = noisegaussadd(handles)
% handles   manejadores

I = [];

[mean status] = str2num(get(handles.inNoiseMean, 'String'));

if status == 0
    errordlg('Media incorrecta.');
    return
end

[var status] = str2num(get(handles.inNoiseVariance, 'String'));

if status == 0 || var < 0
    errordlg('Varianza incorrecta.');
    return
end

noise = randn(size(handles.im{1})) * sqrt(var) + mean;
I = uint8(double(handles.im{1}) + noise);

% --- Ruido gaussiano multiplicativo
function I = noisegaussmul(handles)
% handles   manejadores

I = [];

[alpha status] = str2num(get(handles.inNoiseAlpha, 'String'));

if status == 0 || alpha < 0
    errordlg('Parámetro alfa incorrecto.');
    return
end

im = double(handles.im{1});
noise = randn(size(im)) .* sqrt(alpha * im);
I = uint8(im + noise);

% --- Ruido de sal y pimienta
function I = noisesaltpepper(handles)
% handles   manejadores

I = [];

[salt status] = str2num(get(handles.inNoiseSalt, 'String'));

if status == 0 || salt < 0
    errordlg('Porcentaje de sal incorrecto.');
    return
end

[pepper status] = str2num(get(handles.inNoisePepper, 'String'));

if status == 0 || salt < 0
    errordlg('Porcentaje de pimienta incorrecto.');
    return
end

if salt + pepper > 100
    errordlg('Suma de porcentajes incorrecto.');
    return
end

pepper = 1 - pepper / 100;
salt = pepper - salt / 100;

X = rand(size(handles.im{1}));
I = handles.im{1};
I(find(X >= salt & X < pepper)) = 255;
I(find(X >= pepper)) = 0;


% --- Error cuadratico medio
function error = mse(I, G)
% I     Imagen original
% G     Imagen observada

E = (I - G) .^ 2;
error = sum(E(:)) / prod(size(I));


% --- Relación señal/ruido
function db = snr(I, G)
% I     imagen original
% G     imagen observada

D = (I - mean2(I)) .^ 2;
E = (I - G) .^ 2;
db = 10 * log10(sum(D(:)) / sum(E(:)));


% --- Métrica de la mejora de SNR
function db = isnr(I, G, F)
% I     imagen original
% G     imagen observada
% F     imagen filtrada

E = (I - G) .^ 2;
D = (I - E) .^ 2;
db = 10 * log10(sum(E(:)) / sum(D(:)));


function inFilterSigma_Callback(hObject, eventdata, handles)
% hObject    handle to inFilterSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inFilterSigma as text
%        str2double(get(hObject,'String')) returns contents of inFilterSigma as a double


% --- Executes during object creation, after setting all properties.
function inFilterSigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inFilterSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
