function visualiseTracksAndFrames(handles)
% visualiseTracksAndFrames. Tool to dynamically visualise the tracks from
% structure handles, that allows the user to change the parameters of
% plotTracksAndFrame in the same GUI.
%
% USAGE:
%       visualiseTracksAndFrames(handles)
%
% INPUT:
%               handles := structure containing
%                   nodeNetwork : [numRBC detected x 12 params]
%                   finalNetwork: either 1 track or [depth of tracks x numTracks]
%                   dataRe      : string with path to Reduced data (mat_Re)
%                   dataLa      : string with path to Labelled data (mat_La)
%
%
% see also plotTracks, PLOTTRACKSANDFRAME
%

if nargin < 1
    fprintf('%s: No handles structure specified. Loading GUI.\n', mfilename);
    [filename, pathname] = uigetfile({'*.mat';'*.*'}, ...
        'Select your handles.mat file');
    load(fullfile(pathname, filename));
end

thisFrame = 1;
zwinsize = 20;
stepsWinsize = 5:5:round(handles.numFrames/2);
numstepswin = length(stepsWinsize)-1;

% figure
f = gcf;
set(f, 'position', [53 42 869 954]);
clf

ax = axes('Parent',f,'position',[0.13 0.29  0.77 0.64]);
b = uicontrol('Parent',f,'Style','slider','Position',[81,54,419,23],...
    'value',zwinsize, 'min',stepsWinsize(1), 'max',stepsWinsize(end), ...
    'SliderStep', [1/numstepswin , 1/numstepswin]);
bgcolor = f.Color;
bl1 = uicontrol('Parent',f,'Style','text','Position',[50,54,23,23],...
    'String',num2str(stepsWinsize(1)),'BackgroundColor',bgcolor);
bl2 = uicontrol('Parent',f,'Style','text','Position',[500,54,23,23],...
    'String',num2str(stepsWinsize(end)),'BackgroundColor',bgcolor);
bl3 = uicontrol('Parent',f,'Style','text','Position',[240,25,100,23],...
    'String','Window size','BackgroundColor',bgcolor);

b2 = uicontrol('Parent',f,'Style','slider','Position',[81,104,419,23],...
    'value',thisFrame, 'min',1, 'max',handles.numFrames, ...
    'SliderStep', [1/(handles.numFrames-1) , 1/(handles.numFrames-1) ]);
b2l1 = uicontrol('Parent',f,'Style','text','Position',[50,104,23,23],...
    'String','1','BackgroundColor',bgcolor);
b2l2 = uicontrol('Parent',f,'Style','text','Position',[500,104,23,23],...
    'String',num2str(handles.numFrames),'BackgroundColor',bgcolor);
b2l3 = uicontrol('Parent',f,'Style','text','Position',[240,80,100,23],...
    'String','Time frame selected','BackgroundColor',bgcolor);

b3 = uicontrol('Style', 'popup', 'String', {'La', 'Re', 'none'}, ...
    'Position', [550,54,121,23]);
b3l = uicontrol('Parent',f,'Style','text','Position',[550,30,61,23],...
    'String','Data to plot','BackgroundColor',bgcolor);

stringvar = {'1 = longer in distance','2 = faster branches',...
    '3 = longer in number of frames','4 = shorter branches',...
    '5 = slower branches', '6 = smaller branches',...
    '7 = discard branches with small total distance',...
    '8 = discard branches with less than 3 nodes', ...
    '9 = branches crossing the present frame', '10 = labels for the tracks',...
    '11 = all tracks in green', '12 = all tracks in red', ...
    '13 = top in red, bottom in green', '14 = top in green, bottom in red',...
    'Short in RED, Long in GREEN'};

b4 = uicontrol('Style', 'popup', 'String', stringvar, ...
    'Position', [550,104,121,23]);
b4l = uicontrol('Parent',f,'Style','text','Position',[550,80,61,23],...
    'String','Type of Plot','BackgroundColor',bgcolor);

stringvar2 = strsplit(num2str(...
    unique([50 100 fix(linspace(10, handles.numFrames, 4))])),' ');
stringvar2{end+1} = 'none';

b5 = uicontrol('Style', 'popup', 'String', stringvar2, ...
    'Position', [690,104,101,23]);
b5l = uicontrol('Parent',f,'Style','text','Position',[690,80,101,23],...
    'String','Min number of Hops','BackgroundColor',bgcolor);

options.typeOfPlot = [];
options.typeOfData = 'La';
options.numHops = 50;

b.Callback = @(es,ed) plotTracksAndFrame(handles,...
    round(b2.Value), round(es.Value), ...
    setfield(setfield(setfield(options,...
    'typeOfData', b3.String{b3.Value}), ...
    'typeOfPlot', b4.String{b4.Value}(1:2)),...
    'numHops',b5.String{b5.Value}));
b2.Callback = @(es,ed) plotTracksAndFrame(handles, ...
    round(es.Value), round(b.Value), ...
    setfield(setfield(setfield(options, ...
    'typeOfData', b3.String{b3.Value}),...
    'typeOfPlot', b4.String{b4.Value}(1:2)),...
    'numHops',b5.String{b5.Value}));
b3.Callback = @(es, ed)  plotTracksAndFrame(handles, ...
    round(b2.Value), round(b.Value), ...
    setfield(setfield(setfield(options, ...
    'typeOfData', es.String{es.Value}),...
    'typeOfPlot', b4.String{b4.Value}(1:2)),...
    'numHops',b5.String{b5.Value}));
b4.Callback = @(es, ed)  plotTracksAndFrame(handles, ...
    round(b2.Value), round(b.Value), ...
<<<<<<< HEAD
    setfield(setfield(setfield(options,...
    'typeOfData', b3.String{b3.Value}),...
    'typeOfPlot', es.String{es.Value}(1:2)),...
    'numHops',b5.String{b5.Value}));
b5.Callback = @(es,ed) plotTracksAndFrame(handles,...
    round(b2.Value), round(b.Value), ...
    setfield(setfield(setfield(options,...
    'typeOfData', b3.String{b3.Value}), ...
    'typeOfPlot', b4.String{b4.Value}(1:2)),...
    'numHops',es.String{es.Value}));
=======
    setfield(setfield(options, 'typeOfData', b3.String{b3.Value}),...
    'typeOfPlot', es.String{es.Value}(1:2)));
>>>>>>> origin/dev
