%%
%Date: 00.02.2015
%Author: Seda Cavdaroglu
%Localizer task to isolate reading, subtraction and fixation
%related regions of interest

%This is a fast localizer that takes around ~8 mins in total

%Converted into Matlab from Curren Katz's original localizer task that was
%coded in OpenSesame


function localizerWithoutGrasping()

AssertOpenGL;


%get subject number before starting the task
prompt = {'Subject Number:'};
dlg_title = 'Input';
num_lines = 1;
def = {' '};
answer = inputdlg(prompt,dlg_title,num_lines,def);
subNo =str2num(char(answer(1)));




%define colors
black = [0 0 0];
white = [255 255 255];

screens=Screen('Screens');
screenNumber=max(screens);
[w, rect] = Screen('OpenWindow', screenNumber, black);

%screen parameters
kc_esc = KbName('esc');
mon_width   = 50;   % horizontal dimension of viewable screen (cm)
v_dist      = 60;   % viewing distance (cm)
fix_r       = 0.2; % radius of fixation point (deg)
[center(1), center(2)] = RectCenter(rect);
ppd = pi * (rect(3)-rect(1)) / atan(mon_width/v_dist/2) / 360;    % pixels per degree
fix_cord = [center-fix_r*ppd center+fix_r*ppd]; %white fixation
disp(fix_cord);
fix_cord2 = [center-fix_r*ppd/3 center+fix_r*ppd/3]; %small black fixation within white
fix_cord3 = [center-fix_r*ppd*2 center+fix_r*ppd*2]; 
disp(fix_cord3);
[X,Y] = RectCenter(rect);
FixCross = [X-2,Y-12,X+2,Y+12;X-12,Y-2,X+12,Y+2];

% Do initial flip...
Screen('Flip',w);
[center(1), center(2)] = RectCenter(rect);
disp(center);
%use the s char to start the task
kc_s = KbName('5%');
% Screen('TextFont',w, 'Mono');
Screen('TextSize',w, 18);


[keyIsDown secs keycodes] = KbCheck();
while isempty(keycodes) || ~keycodes(kc_s)
    Screen('DrawText', w, 'Waiting for the trigger...', center(1)-200, center(2),white);
    Screen('Flip', w);
    [keyIsDown secs keycodes] = KbCheck();
end;
HideCursor;	% Hide the mouse cursor
Priority(MaxPriority(w));
expTimer = tic();
start_trigger = toc(expTimer);

logFile = strcat('log_files\',num2str(subNo),'_localizer.txt');

%open the text file to write the output
fid = fopen(logFile,'at');



trialNo = 1;


output_list = {'subject','trial_no','type','start_trigger','time_start','time_end','word1','word2','word3','word4','word1_start','word1_end','word2_start','word2_end','word3_start','word3_end','word4_start','word4_end',...
    'jitter','jitter_start','jitter_end','answer_start','answer_end','ob1','ob2','obj3','ob1_start','obj1_end','obj2_start','obj2_end','obj3_start','obj3_end','fix1_start','fix1_end','fix2_start','fix2_end',...
    'fix3_start','fix3_end','fix4_start','fix4_end','fix5_start','fix5_end','fix6_start','fix6_end','fix7_start','fix7_end','fix8_start','fix8_end','fix9_start','fix9_end','fix10_start','fix10_end',...
    'fix11_start','fix11_end','fix12_start','fix12_end'};

for z = 1:length(output_list)
    fprintf(fid,'%s\t',output_list{z});
end;
%jump to the next line in the output file
fprintf(fid,'%s\n',' ');

Screen('TextSize',w, 30);
%Sentences Block:
trialNo = drawSentences(subNo,trialNo,w,fix_cord,fix_cord2,fid,expTimer,start_trigger);

%Roof Colors Block:
trialNo = roofColors(subNo,trialNo,w,fix_cord,fix_cord2,fid,expTimer,rect);

%Objects_Saccades Block:
trialNo = objectsSaccades(subNo,trialNo,w,fix_cord,fix_cord2,fix_cord3,fid,expTimer,rect);


fclose(fid);
[keyIsDown secs keycodes] = KbCheck();
while ~keyIsDown
    [keyIsDown secs keycodes] = KbCheck();
    Screen('DrawText', w, 'End of the block... You can relax...', center(1)-300, center(2));
    Screen('Flip', w);
end;
%clean the screen
Screen('Flip', w);

Screen('CloseAll');


