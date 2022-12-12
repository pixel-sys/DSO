function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 07-Dec-2022 05:52:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in GLCM.
function GLCM_Callback(hObject, eventdata, handles)
% hObject    handle to GLCM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Set the distance and angle parameters
    distance = 1;
    angle = 0;

% Create the GLCM
    glcm = graycomatrix(handles.origImg_gray, 'Offset', [distance, angle], 'NumLevels', size(handles.origImg_gray,2));
    axes(handles.GLCM_axes);
    imshow(glcm);
    stats = graycoprops(glcm, {'contrast','homogeneity'});
    set(handles.homogenity,'String', stats.Homogeneity);
    set(handles.contrast,'String', stats.Contrast);
    guidata(hObject, handles);

 % --- Executes on button press in BG_remove.
function BG_remove_Callback(hObject, eventdata, handles)
% hObject    handle to BG_remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    tresh = get(handles.BG_tresh, 'Value');
    mask = imbinarize(handles.origImg_gray, 'adaptive', 'Sensitivity', tresh);
    % Remove the background from the original image
    img_no_bg = handles.origImg .* uint8(mask);

    axes(handles.noBG_axes);
    imshow(img_no_bg);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function text1_Callback(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of text1 as text
%        str2double(get(hObject,'String')) returns contents of text1 as a double


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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


% --- Executes on slider movement.
function filter_treshold_Callback(hObject, eventdata, handles)
% hObject    handle to filter_treshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    handles.img_denoised = filtruj_vo_freq(handles.zigDCT, get(handles.filter_treshold, 'Value'));
    axes(handles.filtered_img_freq_axes);
    imshow(handles.img_denoised);
    guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function filter_treshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filter_treshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in noise_target.
function  noise_target_Callback(hObject, eventdata, handles)
% hObject    handle to noise_target (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns noise_target contents as cell array
%        contents{get(hObject,'Value')} returns selected item from noise_target

    pozicia = get(hObject,'Value');
    text = get(hObject,'String');
    text = string(text(pozicia));
    handles.noisedImg = imnoise(handles.origImg_gray, text);
    guidata(hObject, handles);
    axes(handles.noised_img_axes);
    imshow(handles.noisedImg);
    
    [handles.dctMatrix, handles.zigDCT] = spravDCT(handles.noisedImg);
    img_denoised = filtruj_vo_freq(handles.zigDCT, get(handles.filter_treshold, 'Value')); 
    axes(handles.filtered_img_freq_axes);
    imshow(img_denoised);

    guidata(hObject, handles);

function out = filtruj_vo_freq(DCT, range)
%     dimension = 8;
%     nuluj_od = round((dimension^2) * range)+1;
%     
%     for i = 1:dimension:(size(image, 1))
%         for j = 1:dimension:(size(image, 2))
%             dctKoefMatrix = dct2(image(i:i+dimension-1, j:j+dimension-1));
%             
%             [zigDCT] = zigsc(dctKoefMatrix,dimension);
%             zigDCT(nuluj_od : size(zigDCT, 2)) = 0;
%             izigDCT= izigsc(zigDCT, dimension);
%     
%             dct_spatna = idct2(izigDCT);
%             outputImg(i:i+dimension-1,j:j+dimension-1) = uint8(dct_spatna);
%         end
%     end 
% 
%     out = outputImg;

    dimension = size(DCT,1)*size(DCT,2);
    nuluj_od = round((dimension * range))+1;
    
    DCT(nuluj_od : dimension) = 0;
    izigDCT= izigsc(DCT, sqrt(size(DCT,2)));
    filtered_img = idct2(izigDCT);
    
    out = uint8(filtered_img);

function [dctMatrix, zigDCT] = spravDCT(image)
    dctMatrix = dct2(image);
    zigDCT = zigsc(dctMatrix,size(dctMatrix,1));

%     guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function noise_target_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noise_target (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edge_type.
function edge_type_Callback(hObject, eventdata, handles)
% hObject    handle to edge_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns edge_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edge_type
    img = handles.origImg_gray;
    pozicia = get(hObject,'Value');
    text = get(hObject,'String');
    text = string(text(pozicia));
    
    edgemap = edge(img, text);
    handles.edgemap = edgemap;
    axes(handles.edge_detector_axes);
    imshow(edgemap);
    
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edge_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edge_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function openFile_Callback(hObject, eventdata, handles)
% hObject    handle to openFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile('*.jpg;*.png;*.bmp', 'Select the image file');
if isequal(filename,0) || isequal(pathname,0)
   return; % User cancelled
end

handles.orig_img_axes.Visible = true;
handles.origImg = imread(fullfile(pathname, filename));
handles.origImg_gray = rgb2gray(handles.origImg);

axes(handles.orig_img_axes);
imshow(handles.origImg);

noise_target_Callback(handles.noise_target, eventdata, handles);

% guidata(hObject, handles);


% --- Executes on slider movement.
function BG_tresh_Callback(hObject, eventdata, handles)
% hObject    handle to BG_tresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
BG_remove_Callback(handles.BG_remove,eventdata,handles);

% --- Executes during object creation, after setting all properties.
function BG_tresh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BG_tresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
