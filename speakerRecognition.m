function speakerRecognition()

global code;
code = [];
global wordArray;
global nameArray;
global recObj;

recObj = audiorecorder(16000,16,1);

nameArray = [];

wordArray = [];

figureHandle = figure('Units','normalized','Position',[0.01 0.1 0.98 0.7]);
set(figureHandle,'Resize','off');

nextButton = uicontrol('Style','PushButton','Units','normalized','String','Next','Position', [0.65 0.2 0.25 0.6],'FontSize',40,'Enable','on');
set(nextButton,'Callback',{@nextButtonPressed});

name1Box = uicontrol('Style','edit','Units','normalized','String','Name','Position', [0.05 0.8 0.1 0.1],'FontSize',20,'Enable','on');
name2Box = uicontrol('Style','edit','Units','normalized','String','Name','Position', [0.05 0.6 0.1 0.1],'FontSize',20,'Enable','on');
name3Box = uicontrol('Style','edit','Units','normalized','String','Name','Position', [0.05 0.4 0.1 0.1],'FontSize',20,'Enable','on');
name4Box = uicontrol('Style','edit','Units','normalized','String','Name','Position', [0.05 0.2 0.1 0.1],'FontSize',20,'Enable','on');

global nameObjectArray;

nameObjectArray = [name1Box;name2Box;name3Box;name4Box];

for i = 1:length(nameObjectArray)
    nameObject = nameObjectArray(i);
    set(nameObject,'Callback',{@nameChanged});
end

global wordObjectArray;

word11Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.2 0.86 0.08 0.03],'FontSize',12,'Enable','on');
word21Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.2 0.66 0.08 0.03],'FontSize',12,'Enable','on');
word31Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.2 0.46 0.08 0.03],'FontSize',12,'Enable','on');
word41Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.2 0.26 0.08 0.03],'FontSize',12,'Enable','on');

wordObjectArray(:,1) = [word11Box;word21Box;word31Box;word41Box];

word12Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.3 0.86 0.08 0.03],'FontSize',12,'Enable','on');
word22Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.3 0.66 0.08 0.03],'FontSize',12,'Enable','on');
word32Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.3 0.46 0.08 0.03],'FontSize',12,'Enable','on');
word42Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.3 0.26 0.08 0.03],'FontSize',12,'Enable','on');

wordObjectArray(:,2) = [word12Box;word22Box;word32Box;word42Box];

word13Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.4 0.86 0.08 0.03],'FontSize',12,'Enable','on');
word23Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.4 0.66 0.08 0.03],'FontSize',12,'Enable','on');
word33Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.4 0.46 0.08 0.03],'FontSize',12,'Enable','on');
word43Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.4 0.26 0.08 0.03],'FontSize',12,'Enable','on');

wordObjectArray(:,3) = [word13Box;word23Box;word33Box;word43Box];

word14Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.5 0.86 0.08 0.03],'FontSize',12,'Enable','on');
word24Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.5 0.66 0.08 0.03],'FontSize',12,'Enable','on');
word34Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.5 0.46 0.08 0.03],'FontSize',12,'Enable','on');
word44Box = uicontrol('Style','edit','Units','normalized','String','','Position', [0.5 0.26 0.08 0.03],'FontSize',12,'Enable','on');

wordObjectArray(:,4) = [word14Box;word24Box;word34Box;word44Box];

for i = 1:size(wordObjectArray,1)
    for j = 1:size(wordObjectArray,2)
        word = wordObjectArray(i,j);
        set(word,'Callback',{@wordChanged});
    end
end


global buttonArray;

push11Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.2 0.81 0.08 0.03],'FontSize',12,'Enable','on');
push21Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.2 0.61 0.08 0.03],'FontSize',12,'Enable','on');
push31Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.2 0.41 0.08 0.03],'FontSize',12,'Enable','on');
push41Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.2 0.21 0.08 0.03],'FontSize',12,'Enable','on');

buttonArray(:,1) = [push11Box; push21Box;push31Box;push41Box];

push12Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.3 0.81 0.08 0.03],'FontSize',12,'Enable','on');
push22Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.3 0.61 0.08 0.03],'FontSize',12,'Enable','on');
push32Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.3 0.41 0.08 0.03],'FontSize',12,'Enable','on');
push42Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.3 0.21 0.08 0.03],'FontSize',12,'Enable','on');

buttonArray(:,2) = [push12Box; push22Box;push32Box;push42Box];

push13Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.4 0.81 0.08 0.03],'FontSize',12,'Enable','on');
push23Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.4 0.61 0.08 0.03],'FontSize',12,'Enable','on');
push33Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.4 0.41 0.08 0.03],'FontSize',12,'Enable','on');
push43Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.4 0.21 0.08 0.03],'FontSize',12,'Enable','on');

buttonArray(:,3) = [push13Box; push23Box;push33Box;push43Box];

push14Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.5 0.81 0.08 0.03],'FontSize',12,'Enable','on');
push24Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.5 0.61 0.08 0.03],'FontSize',12,'Enable','on');
push34Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.5 0.41 0.08 0.03],'FontSize',12,'Enable','on');
push44Box = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.5 0.21 0.08 0.03],'FontSize',12,'Enable','on');

buttonArray(:,4) = [push14Box; push24Box;push34Box;push44Box];

for i = 1:size(buttonArray,1)
    for j = 1:size(buttonArray,2)
        button = buttonArray(i,j);
        set(button,'Callback',{@recordButtonPressed});
    end
end


end


function recordButtonPressed(hObject,eventdata) %abaa

global buttonArray;
global recObj;
global code;

set(hObject,'ForeGround','green');

if get(hObject,'Value') == 1
    record(recObj);
else
    stop(recObj);
    y = getaudiodata(recObj);
    ySegments = detectVoiced(y,16000);
    v = [];
    
    for i = 1:length(ySegments)
        v = vertcat(v,mfcc(ySegments{i}, 16000));
    end
    
    [r,c] = find(buttonArray == hObject);
    code{r,c} = vqlbg(v', 16);      % Train VQ codebook
end

end



function wordChanged(hObject,eventdata) %abaa
global wordArray;
global wordObjectArray;

s = get(hObject,'string');

[r,c] = find(wordObjectArray == hObject);

wordArray{r,c} = s;


end


function nameChanged(hObject,eventdata) %abaa
global nameArray;
global nameObjectArray;

s = get(hObject,'string');

[r,c] = find(nameObjectArray == hObject);

nameArray{r,c} = s;

end


function nextButtonPressed(hObject,eventdata)

h = get(hObject,'parent');
close(h);

global textBox;

figureHandle = figure('Units','normalized','Position',[0.01 0.1 0.98 0.7]);
set(figureHandle,'Resize','off');
recordButton = uicontrol('Style','togglebutton','Units','normalized','String','Record','Position', [0.2 0.6 0.6 0.3],'FontSize',30,'Enable','on');
textBox = uicontrol('Style','text','Units','normalized','String','','Position', [0.2 0.1 0.6 0.3],'FontSize',30,'Enable','on');
set(textBox,'ForegroundColor','green');

set(recordButton,'Callback',{@recButtonPressed});

end


function recButtonPressed(hObject,eventdata)

global recObj;
global code;
global nameArray;
global wordArray;
global textBox;

if get(hObject,'Value') == 1
    record(recObj);
else
    stop(recObj);
    y = getaudiodata(recObj);
    ySegments = detectVoiced(y,16000);
        
    v = [];
    
    for i = 1:length(ySegments)
        v = vertcat(v,mfcc(ySegments{i}, 16000));
    end
    
    distmin = inf;
    
    speaker = 0;
    word = 0;
    
    v2 = [];
    
    for i = 1:size(v,2)
        if isempty(find(isnan(v(:,i))))
            v2(:,end+1) = v(:,i);
        end
    end
    
    v = v2;
    
    for i = 1:size(code,1)      % each trained codebook, compute distortion
        for j = 1:size(code,2)
            if ~isempty(code{i,j})
                d = disteu(v, code{i,j});
                dist = sum(min(d,[],2)) / size(d,1);
                
                if dist < distmin
                    distmin = dist;
                    speaker = i;
                    word = j;
                end
            end
        end
    end
    
        
    set(textBox,'String',sprintf('Speaker %s, Word %s', nameArray{speaker}, wordArray{speaker,word}));
    
    pause(2);
    set(textBox,'String','');
    pause(2);
end
end
