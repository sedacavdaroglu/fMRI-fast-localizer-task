%%
%Date: 05.02.2015
%Author: Seda Cavdaroglu
%This function draws the sentences part of the localizer task
%%
function trialNo = drawSentences(subNo,trialNo,w,fix_cord,fix_cord2,fid,start_trigger)

word1 = {'Der Geburtstag',' ','Der Sturm','Die Katzen','Das Datum','Berechne','Das Verlies','Wir sahen','Das Datum','Berechne','Berechne','Bären',' ','In der Stadt',...
'Die Kälte','Das Datum',' ','Das Datum','Berechne','Der Tag','Es gibt','Das Datum',' ',' ',' ','Berechne','Berechne','Das Datum','Der Geburtstag','Der Anschlag',...
'Der Regen','Berechne','Rosen',' ',' ','Berechne',' ',' ','Berechne','Berechne'};
word2 = {'meines',' ','hat die Tiere','suchen','von','sechzehn','des Schlosses','die Parade','der','zehn','elf','mögen',' ','fanden wir','des Winters','von',' ',...
    'meines','zwölf','der','viele Brücken','von',' ',' ',' ','neunzehn','sechzehn','von','meiner','auf das','machte','dreizehn','sind schön',' ',' ','neunzehn',...
    ' ',' ','elf','siebzehn'};
word3 = {'Vaters',' ','im Zoo','nach einem Vogel','Heiligabend','minus','zerfällt','vom','Euroeinführung','minus','minus','Lachs',' ','leicht','ließ den See',...
    'Neujahr',' ','Geburtstages','minus','deutschen Einheit','in','Sylvester',' ',' ',' ','minus','minus','Halloween','Mutter','World Trade Center','die Straße',...
    'minus','aber',' ',' ','minus',' ',' ','minus','minus'};
word4 = {'ist am ____________',' ','verängstigt','auf der Mauer','ist ________________','acht','zu Ruinen','Balkon aus','ist ________________','zwei','neun',...
    'und Honig',' ','ein Taxi','gefrieren','ist ________________',' ','ist ________________','vier','ist ________________','Paris','ist ________________',' ',' ',' ',...
    'sechs','zwei','ist ________________','ist am ____________','war am____________','gefährlich','sieben','stechen',' ',' ','sieben',' ',' ','drei','sechs'};

trial_type = [3,4,2,2,3,1,2,2,3,1,1,2,4,2,2,3,4,3,1,3,2,3,4,4,4,1,1,3,3,3,2,1,2,4,4,1,4,4,1,1];

jitter = [2355,1608,1332,3738,2160,3930,2014,1684,1446,654,615,297,2919,1474,2657,1518,1086,752,733,2899,3603,2318,418,1451,3758,1357,2605,3969,458,2418,3068,...
    1703,3448,1511,2469,1253,387,1839,2120,3976];
jitter = jitter./1000;

kc_esc = KbName('esc');
black = [0 0 0];
white = [255 255 255];
%initial flip
vbl = Screen('Flip', w);
ifi=Screen('GetFlipInterval', w);
waitframes = 1;

for i = 1:40
    %%word1
    Priority(MaxPriority(w));
    numFrames = round(0.25 / ifi);    
    for frame = 1:numFrames
        if trial_type(i) ~= 4
            [nx, ny, bbox] = DrawFormattedText(w, word1{i}, 'center', 'center', white);
            % Tell PTB no more drawing commands will be issued until the next flip
            Screen('DrawingFinished', w);
        else
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
        end;
        
        % Flip to the screen
        if frame == 1
            time_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            word1_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
        end;        
        vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
    end
    Priority(0);
    word1_end = vbl + (waitframes-0.5)*ifi-start_trigger;
    
    
    Priority(MaxPriority(w));
    numFrames = round(0.1 / ifi);
    for frame = 1:numFrames
        if trial_type(i) == 4 %draw a fixation point
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
        end;
        vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
    end
    Priority(0);

    %%
    %word2
    Priority(MaxPriority(w));
    numFrames = round(0.25 / ifi);    
    for frame = 1:numFrames
        if trial_type(i) ~= 4
            [nx, ny, bbox] = DrawFormattedText(w, word2{i}, 'center', 'center', white);
            % Tell PTB no more drawing commands will be issued until the next flip
            Screen('DrawingFinished', w);
        else
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
        end;
        
        % Flip to the screen
        if frame == 1
            word2_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
        end;        
        vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
    end
    Priority(0);
    word2_end = vbl + (waitframes-0.5)*ifi-start_trigger;
    
    Priority(MaxPriority(w));
    numFrames = round(0.1 / ifi);
    for frame = 1:numFrames
        if trial_type(i) == 4 %draw a fixation point
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
        end;
        vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
    end
    Priority(0);
    %%
    %word3
    Priority(MaxPriority(w));
    numFrames = round(0.25 / ifi);    
    for frame = 1:numFrames
        if trial_type(i) ~= 4
            [nx, ny, bbox] = DrawFormattedText(w, word3{i}, 'center', 'center', white);
            % Tell PTB no more drawing commands will be issued until the next flip
            Screen('DrawingFinished', w);
        else
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
        end;
        
        % Flip to the screen
        if frame == 1
            word3_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
        end;     
        vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
    end
    Priority(0);
    word3_end = vbl + (waitframes-0.5)*ifi-start_trigger;
    
    Priority(MaxPriority(w));
    numFrames = round(0.1 / ifi);
    for frame = 1:numFrames
        if trial_type(i) == 4 %draw a fixation point
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
        end;
        vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
    end
    Priority(0);
    
    %%
    %word4
    Priority(MaxPriority(w));
    numFrames = round(0.25 / ifi);    
    for frame = 1:numFrames
        if trial_type(i) ~= 4
            [nx, ny, bbox] = DrawFormattedText(w, word4{i}, 'center', 'center', white);
            % Tell PTB no more drawing commands will be issued until the next flip
            Screen('DrawingFinished', w);
        else
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
        end;
       
        % Flip to the screen
        if frame == 1
            word4_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
        end;        
        vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
    end
    Priority(0);
    word4_end = vbl + (waitframes-0.5)*ifi-start_trigger;
    time_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
    
    Priority(MaxPriority(w));
    numFrames = round(0.1 / ifi);
    for frame = 1:numFrames
        if trial_type(i) == 4 %draw a fixation point
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
        end;
        vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
    end
    Priority(0);
    
    %%
    %answer wait
    Priority(MaxPriority(w));
    numFrames = round(0.9 / ifi);
    for frame = 1:numFrames
        Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
        Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
        if frame == 1
            answer_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
        end;
        vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
    end
    answer_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
    Priority(0);
    
    %%
    %jitter
    Priority(MaxPriority(w));
    numFrames = round(jitter(i)/ ifi);
    for frame = 1:numFrames
        Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
        Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
        if frame == 1
            jitter_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
        end;
        vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
    end
    jitter_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
    Priority(0);
    
    %%
    
    % now define a string for each type of key press.
    [keyIsDown secs keycodes] = KbCheck();
    if ~isempty(keycodes)
        if keycodes(kc_esc)
            Priority(0);
            ShowCursor;
            Screen('CloseAll');
        end;
    end;
    
    
    %write the output info to the log file
    output_list = {int2str(subNo),int2str(trialNo),int2str(trial_type(i)),num2str(start_trigger,'%.4f'),num2str(time_start,'%.4f'),num2str(time_end,'%.4f'),word1{i},word2{i},word3{i},word4{i},num2str(word1_start,'%.4f'),num2str(word1_end,'%.4f'),num2str(word2_start,'%.4f'),num2str(word2_end,'%.4f'),...
        num2str(word3_start,'%.4f'),num2str(word3_end,'%.4f'),num2str(word4_start,'%.4f'),num2str(word4_end,'%.4f'),num2str(jitter(i),'%.4f'),num2str(jitter_start,'%.4f'),num2str(jitter_end,'%.4f'),num2str(answer_start),num2str(answer_end),...
        '','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''};
    for z = 1:length(output_list)
        fprintf(fid,'%s\t',output_list{z});
    end;
    %jump to the next line in the output file
    fprintf(fid,'%s\n',' ');
    
    
    trialNo = trialNo + 1;
end;