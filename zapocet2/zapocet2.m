function varargout = zapocet2(varargin)
% ZAPOCET2 MATLAB code for zapocet2.fig
%      ZAPOCET2, by itself, creates a new ZAPOCET2 or raises the existing
%      singleton*.
%
%      H = ZAPOCET2 returns the handle to a new ZAPOCET2 or the handle to
%      the existing singleton*.
%
%      ZAPOCET2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZAPOCET2.M with the given input arguments.
%
%      ZAPOCET2('Property','Value',...) creates a new ZAPOCET2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zapocet2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zapocet2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zapocet2

% Last Modified by GUIDE v2.5 07-Dec-2022 13:59:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zapocet2_OpeningFcn, ...
                   'gui_OutputFcn',  @zapocet2_OutputFcn, ...
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


% --- Executes just before zapocet2 is made visible.
function zapocet2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zapocet2 (see VARARGIN)

% Choose default command line output for zapocet2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zapocet2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zapocet2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Menu_Callback(hObject, eventdata, handles)
% hObject    handle to Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function changeimg_main(handles, img, name)
    axes(handles.axes_main); imshow(img); 
    set(handles.text_main,'String',name);
    
function changeimg_1(handles, img, name)
    axes(handles.axes1); imshow(img); 
    set(handles.text1,'String',name);
    
function changeimg_2(handles, img, name)
    axes(handles.axes2); imshow(img); 
    set(handles.text2,'String',name);    
    
function changeimg_3(handles, img, name)
    axes(handles.axes3); imshow(img); 
    set(handles.text3,'String',name);    

    function changeimg_4(handles, img, name)
    axes(handles.axes4); imshow(img); 
    set(handles.text4,'String',name);

function db_load_Callback(hObject, eventdata, handles)
% hObject    handle to db_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    path = uigetdir('C:\Users\piXel\Google Drive\__Skola\UNIZA\_Ing\_3sem\DSO\Corel100');
    S = dir(fullfile(path,'*.jpg'));
    for k = 1:numel(S)
        handles.orig_DB{k,1} = S(k).name;
        handles.orig_DB{k,2} = fullfile(S(k).folder, S(k).name);
        handles.orig_DB{k,3} = imread(handles.orig_DB{k,2});
%         R
        handles.orig_DB{k,4} = sum(sum(handles.orig_DB{k,3}(:,:,1)));
%         G
        handles.orig_DB{k,5} = sum(sum(handles.orig_DB{k,3}(:,:,2)));
%         B
        handles.orig_DB{k,6} = sum(sum(handles.orig_DB{k,3}(:,:,3)));
%         GLCM
        handles.orig_DB{k,7} = graycomatrix(rgb2gray(handles.orig_DB{k,3}));
        stats = graycoprops( handles.orig_DB{k,7}, {'contrast','homogeneity'});
%         Contrast
        handles.orig_DB{k,8} = stats.Contrast;
%         Homo
        handles.orig_DB{k,9} = stats.Homogeneity;
%         set(handles.homogenity,'String', stats.Homogeneity);
%         set(handles.contrast,'String', stats.Contrast);
        
    end
%    axes(handles.axes_main); imshow(handles.orig_DB{1,2});
   handles.main_pos = 3;
   changeimg_main(handles, handles.orig_DB{1,3}, handles.orig_DB{1,1});
   changeimg_3(handles, handles.orig_DB{2,3}, handles.orig_DB{2,1});
   changeimg_4(handles, handles.orig_DB{3,3}, handles.orig_DB{3,1});
   
   
   guidata(hObject, handles);
% --------------------------------------------------------------------
function db_save_Callback(hObject, eventdata, handles)
% hObject    handle to db_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_exit_Callback(hObject, eventdata, handles)
% hObject    handle to menu_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_right.
function pushbutton_right_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(handles.main_pos <= 1 || handles.main_pos >= (size(handles.orig_DB,1)-1) )
    return;
end
    handles.main_pos = handles.main_pos+1;
    pos = handles.main_pos;
    set(handles.poss, 'String', pos);
    changeimg_main(handles, handles.orig_DB{pos,3}, handles.orig_DB{pos,1});
    
    if(handles.main_pos <= (size(handles.orig_DB,1)-2))
        changeimg_3(handles, handles.orig_DB{pos+1, 3}, handles.orig_DB{pos+1, 1});
        changeimg_4(handles, handles.orig_DB{pos+2, 3}, handles.orig_DB{pos+2, 1});
    end 
    if(handles.main_pos >= 2)
        changeimg_2(handles, handles.orig_DB{pos-1, 3}, handles.orig_DB{pos-1, 1});
        if(handles.main_pos >= 3)
            changeimg_1(handles, handles.orig_DB{pos-2, 3}, handles.orig_DB{pos-2, 1});
        end
    end
    guidata(hObject, handles);

% --- Executes on button press in pushbutton_left.
function pushbutton_left_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% treba dosiesit
if(handles.main_pos <= 1 || handles.main_pos >= (size(handles.orig_DB,1)-1) )
    return;
end
    handles.main_pos = handles.main_pos-1;
    pos = handles.main_pos;
    set(handles.poss, 'String', pos);
    changeimg_main(handles, handles.orig_DB{pos,3}, handles.orig_DB{pos,1});
    
    if(handles.main_pos <= (size(handles.orig_DB,1)-2))
        changeimg_3(handles, handles.orig_DB{pos+1, 3}, handles.orig_DB{pos+1, 1});
        changeimg_4(handles, handles.orig_DB{pos+2, 3}, handles.orig_DB{pos+2, 1});
    end    
    if(handles.main_pos >= 2)
        changeimg_2(handles, handles.orig_DB{pos-1, 3}, handles.orig_DB{pos-1, 1});
        if(handles.main_pos >= 3)
            changeimg_1(handles, handles.orig_DB{pos-2, 3}, handles.orig_DB{pos-2, 1});
        end
    end
    guidata(hObject, handles);


% --- Executes on selection change in pop_priznak.
function pop_priznak_Callback(hObject, eventdata, handles)
% hObject    handle to pop_priznak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_priznak contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_priznak

val = get(handles.pop_priznak, 'Value');
volba = val;
switch volba
    case 2 
        handles.sortedR = sortrows(handles.orig_DB, 4);
    case 3
        handles.sortedG = sortrows(handles.orig_DB, 5);
    case 4
        handles.sortedB = sortrows(handles.orig_DB, 6);
    case 5
        handles.sortedCor = sortrows(handles.orig_DB, 8);
    case 6
        handles.sortedHomo = sortrows(handles.orig_DB, 9);
        
end

% treba prerobit view functions


% --- Executes during object creation, after setting all properties.
function pop_priznak_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_priznak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --------------------------------------------------------------------
function execute_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to execute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
