function [start_sample,dur_sample,onsets,ends] = DrawSampleDiff(w,rect,num,set,expTimer)

%coloring
black = [0 0 0];
white = [255 255 255];

%screen parameters
mon_width   = 50;   % horizontal dimension of viewable screen (cm)
v_dist      = 60;   % viewing distance (cm)
fix_r       = 0.3; % radius of fixation point (deg)
[center(1), center(2)] = RectCenter(rect);
ppd = pi * (rect(3)-rect(1)) / atan(mon_width/v_dist/2) / 360;    % pixels per degree
fix_cord = [center-fix_r*ppd center+fix_r*ppd];
[X,Y] = RectCenter(rect);
FixCross = [X-2,Y-12,X+2,Y+12;X-12,Y-2,X+12,Y+2];


kc_esc = KbName('esc');


durations = zeros(num,1);
intervals = zeros(num-1,1);


durs = [0.07,0.085,0.1,0.2;0.2,0.1,0.085,0.07;0.07,0.07,0.07,0.07;0.07,0.07,0.07,0.07];
ints = [0.07,0.07,0.07,0.07;0.07,0.09,0.18,0.25;0.25,0.18,0.09,0.07;0.5,0.3,0.15,0.07];



jitCount = 1; %counter of the jitters already put

onsets = zeros(20,1); %holds the starting time of each visual flash
ends = zeros(20,1); %holds the end time of each visual flash


if num == 5 || num == 7
    size = 2;
    jitArray = [1,-1];
    jitArray = Shuffle(jitArray);
else
    size = 4;
    jitArray = [1,1,-1,-1];
    jitArray = Shuffle(jitArray);
end;
jitCount = 1; %counts the number of jitters already put

%size = floor(nums(i)/4);
indx = 0;
if num == 5
    indx = 1;
elseif num == 7
    indx = 2;
elseif num == 11
    indx = 3;
elseif num == 16
    indx = 4;
end;

a = randperm(num);
b = zeros(size,1);
for k = 1:size
    b(k,1) = a(k);
end;





for z = 1:num
    if ~ismember(z,b) && z ~= num
        durations(z,1) = durs(set,indx);
        intervals(z,1) = ints(set,indx);
    elseif ~ismember(z,b) && z == num
        durations(z,1) = durs(set,indx);
        intervals(z-1,1) = ints(set,indx);
    elseif ismember(z,b) && z ~= num
        durJit = durs(set,indx)-0.04;
        isiJit = ints(set,indx) -0.04;
        durations(z,1)= durs(set,indx)+jitArray(jitCount)*durJit;
        intervals(z,1) = ints(set,indx)-jitArray(jitCount)*isiJit;
        jitCount = jitCount + 1;
    else
        durJit = durs(set,indx)-0.04;
        isiJit = ints(set,indx) -0.04;
        durations(z,1) = durs(set,indx)+jitArray(jitCount)*durJit;
        intervals(z-1,1) = ints(set,indx)-jitArray(jitCount)*isiJit;
        jitCount = jitCount + 1;
    end;
end;

start_sample = toc(expTimer);
start_dots = tic();
for j = 1:num;
    t1 = timer('TimerFcn', 'stat=false','StartDelay',durations(j,1));
    if j ~= num
        t2 = timer('TimerFcn', 'stat=false','StartDelay',intervals(j,1));
    end;
    start(t1);
    locsx = randi([-50,50],1,1);
    locsy = randi([-50,50],1,1);
    newcenter = [center(1)+locsx center(2)+locsy];
    Screen('FillOval', w, white, [newcenter-fix_r*ppd newcenter+fix_r*ppd]);	% draw fixation dot (flip erases it)
    Screen('Flip',w);
    onsets(j,1) = toc(expTimer);
    while(strcmp(get(t1,'Running'),'on'))
        %             Screen('DrawDots', w, [0 0], 20, black, center,1);  % change 1 to 0 to draw square dots
        %             Screen('Flip',w);
        % now define a string for each type of key press.
        [keyIsDown secs keycodes] = KbCheck();
        if ~isempty(keycodes)
            if keycodes(kc_esc)
                Priority(0);
                ShowCursor;
                Screen('CloseAll');
            end;
        end;
    end;
    ends(j,1) = toc(expTimer);
    Screen('Flip',w);
    start(t2);
    while(strcmp(get(t2,'Running'),'on'))
        %Screen('Flip',w);
    end;
end;
dur_num = toc(start_dots);


t0 = timer('TimerFcn', 'stat=false','StartDelay',0.1);
start(t0);
while(strcmp(get(t0,'Running'),'on'))
    Screen('Flip',w);
end;

dur_sample = dur_num;
