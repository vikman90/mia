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

% Last Modified by GUIDE v2.5 18-Dec-2015 16:13:08

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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes on selection change in menuNoiseMethod.
function menuNoiseMethod_Callback(hObject, eventdata, handles)
% hObject    handle to menuNoiseMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menuNoiseMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menuNoiseMethod


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


% --- Executes on button press in btSave.
function btSave_Callback(hObject, eventdata, handles)
% hObject    handle to btSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btColorbar.
function btColorbar_Callback(hObject, eventdata, handles)
% hObject    handle to btColorbar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btNoise.
function btNoise_Callback(hObject, eventdata, handles)
% hObject    handle to btNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in menuFilterMethod.
function menuFilterMethod_Callback(hObject, eventdata, handles)
% hObject    handle to menuFilterMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menuFilterMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menuFilterMethod


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


% --- Executes on button press in btCompare.
function btCompare_Callback(hObject, eventdata, handles)
% hObject    handle to btCompare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
