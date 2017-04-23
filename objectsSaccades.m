function trialNo = objectsSaccades(subNo,trialNo,w,fix_cord,fix_cord2,fix_cord3,fid,rect,start_trigger)
trial_type = [6,4,5,4,5,4,6,4,6,4,6,4,6,4,6,4,5,4,5,4,5,4,5,4,6,4,6,4,5,4,5,4];
jitter = [0,5990,0,2971,0,9803,0,1171,0,5185,0,9691,0,8455,0,415,0,11030,0,9531,...
    0,990,0,7212,0,4716,0,8107,0,6821,0,3912];
jitter = jitter./1000;

obj1 = {'dummy.BMP','dummy.BMP','sshot-9.BMP','dummy.BMP','sshot-65.BMP',...
    'dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP',...
    'dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','sshot-57.BMP',...
    'dummy.BMP','sshot-27.BMP','dummy.BMP','sshot-6.BMP','dummy.BMP','sshot-1.BMP',...
    'dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','sshot-36.BMP',...
    'dummy.BMP','sshot-34.BMP','dummy.BMP'};

obj2 = {'dummy.BMP','dummy.BMP','sshot-11.BMP','dummy.BMP','sshot-41.BMP',...
    'dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP',...
    'dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','sshot-43.BMP',...
    'dummy.BMP','sshot-45.BMP','dummy.BMP','sshot-54.BMP','dummy.BMP','sshot-3.BMP',...
    'dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','sshot-64.BMP',...
    'dummy.BMP','sshot-20.BMP','dummy.BMP'};

obj3 = {'dummy.BMP','dummy.BMP','sshot-47.BMP','dummy.BMP','sshot-48.BMP',...
    'dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP',...
    'dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','sshot-13.BMP',...
    'dummy.BMP','sshot-5.BMP','dummy.BMP','sshot-32.BMP','dummy.BMP','sshot-29.BMP',...
    'dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','dummy.BMP','sshot-17.BMP',...
    'dummy.BMP','sshot-59.BMP','dummy.BMP'};
[center(1), center(2)] = RectCenter(rect);
center(1) = center(1) - 11;
center(2) = center(2) -22;

x1 = [center(1)-160,center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1)-256,center(1),center(1)+352,center(1),center(1)-192,center(1),...
    center(1)+200,center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1)-100,center(1),center(1)+256,...
    center(1),center(1),center(1),center(1),center(1)];

x1_2 = [center(1)-80,center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1)-128,center(1),center(1)+176,center(1),center(1)-96,...
    center(1),center(1)+100,center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1)-50,center(1),center(1)+128,...
    center(1),center(1),center(1),center(1),center(1)];

y1 = [center(2)-128,center(2),center(2),center(2),center(2),center(2),center(2)-192,center(2),center(2),center(2),center(2),center(2),center(2)+256,center(2),...
    center(2)-150,center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2)+200,center(2),center(2)+160,center(2),...
    center(2),center(2),center(2),center(2)];

y1_2 = [center(2)-64,center(2),center(2),center(2),center(2),center(2),center(2)-96,center(2),center(2),center(2),center(2),center(2),center(2)+128,center(2),...
    center(2)-75,center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2)+100,center(2),center(2)+80,center(2),...
    center(2),center(2),center(2),center(2)];

x2 = [center(1)-256,center(1),center(1),center(1),center(1),center(1),center(1)+256,center(1),center(1)+352,center(1),center(1),center(1),center(1),center(1),...
    center(1)-300,center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1)-300,center(1),center(1)+352,center(1),...
    center(1),center(1),center(1),center(1)];

x2_2 = [center(1)-128,center(1),center(1),center(1),center(1),center(1),center(1)+128,center(1),center(1)+176,center(1),center(1),center(1),center(1),center(1),...
    center(1)-150,center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1)-150,center(1),center(1)+ 176,center(1),...
    center(1),center(1),center(1),center(1)];

y2 = [center(2),center(2),center(2),center(2),center(2),center(2),center(2)+160,center(2),center(2),center(2),center(2)+352,center(2),center(2)+200,center(2),...
    center(2)-157,center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2)-200,center(2),center(2),center(2),...
    center(2),center(2),center(2),center(2)];

y2_2 = [center(2),center(2),center(2),center(2),center(2),center(2),center(2)+80,center(2),center(2),center(2),center(2)+176,center(2),center(2)+100,center(2),...
    center(2)-78.5,center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2)-100,center(2),center(2),...
    center(2),center(2),center(2),center(2),center(2)];

x3 = [center(1),center(1),center(1),center(1),center(1),center(1),center(1)+352,center(1),center(1)-160,center(1),center(1)-352,center(1),center(1)+160,...
    center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1)+150,center(1),center(1)-192,...
    center(1),center(1),center(1),center(1),center(1)];

x3_2 = [center(1),center(1),center(1),center(1),center(1),center(1),center(1)+176,center(1),center(1)-80,center(1),center(1)-176,center(1),center(1)+80,...
    center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1)+75,center(1),center(1)-96,center(1),...
    center(1),center(1),center(1),center(1)];

y3 = [center(2)+224,center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2)-128,center(2),center(2)-128,center(2),center(2)+128,center(2),...
    center(2)-200,center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),...
    center(2),center(2),center(2),center(2)];

y3_2 = [center(2)+112,center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2)-64,center(2),center(2)-64,center(2),center(2)+64,...
    center(2),center(2)-100,center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),...
    center(2),center(2),center(2),center(2)];

x4 = [center(1)+352,center(1),center(1),center(1),center(1),center(1),center(1)-160,center(1),center(1),center(1),center(1)+160,center(1),center(1)-160,...
    center(1),center(1)+200,center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1)+110,center(1),center(1),...
    center(1),center(1),center(1),center(1),center(1)];

x4_2 = [center(1)+176,center(1),center(1),center(1),center(1),center(1),center(1)-80,center(1),center(1),center(1),center(1)+80,center(1),center(1)-80,...
    center(1),center(1)+100,center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1),center(1)+55,center(1),center(1),center(1),...
    center(1),center(1),center(1),center(1)];

y4 = [center(2),center(2),center(2),center(2),center(2),center(2),center(2)-128,center(2),center(2)+352,center(2),center(2)+256,center(2),center(2)-128,...
    center(2),center(2)+160,center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2)+375,center(2),center(2)+224,...
    center(2),center(2),center(2),center(2),center(2)];

y4_2 = [center(2),center(2),center(2),center(2),center(2),center(2),center(2)-64,center(2),center(2)+176,center(2),center(2)+128,center(2),center(2)-64,...
    center(2),center(2)+80,center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2),center(2)+187,center(2),center(2)+112,...
    center(2),center(2),center(2),center(2),center(2)];

kc_esc = KbName('esc');

black = [0 0 0];
white = [255 255 255];

winWidth = rect(3);
winHeight = rect(4);


%initial flip
vbl = Screen('Flip', w);

ifi=Screen('GetFlipInterval', w);
waitframes = 1;


% Get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', w);

for i = 1:32
    if trial_type(i) == 5
        %%OBJECT SEQUENCE
        %display the first object
        fileName = strcat('C:\Users\bcanguest\Documents\PsychToolbox Experiments\AG_KNOPS\SedaProject2\localizer_files\',obj1{i});
        [img] = imread(fileName);
        disp(fileName);
        % Make the image into a texture
        imageTexture = Screen('MakeTexture', w, img);
        
        % Get the size of the image
        [s1, s2, s3] = size(img);
        
        % Get the aspect ratio of the image. We need this to maintain the aspect
        % ratio of the image when we draw it different sizes. Otherwise, if we
        % don't match the aspect ratio the image will appear warped / stretched
        aspectRatio = s2 / s1;
        
        % We will set the height of each drawn image to a fraction of the screens
        % height
        heightScalers = linspace(1, 0.2, 5);
        imageHeights = screenYpixels .* heightScalers;
        imageWidths = imageHeights .* aspectRatio;
        
        % Number of images we will draw
        numImages = 4;
        
        % Make the destination rectangles for our image. We will draw the image
        % multiple times over getting smaller on each iteration. So we need the big
        % dstRects first followed by the progressively smaller ones
        dstRects = zeros(4, numImages);
        for j = 1:numImages
            theRect = [0 0 imageWidths(j) imageHeights(j)];
            dstRects(:, j) = CenterRectOnPointd(theRect, screenXpixels / 2,...                 screenYpixels / i);
                screenYpixels / 2);
        end
        
       
        Priority(MaxPriority(w));
        numFrames = round(1.2/ ifi);
        for frame = 1:numFrames
            if trial_type(i) ~= 4
                Screen('DrawTextures', w, imageTexture, [], dstRects(:,4));
            end;
            
            if frame == 1
                obj1_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
                time_start = obj1_start;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
        end
        obj1_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);

        %%
        %the gap in between objects
        Priority(MaxPriority(w));
        numFrames = round(1.2/ ifi);
        for frame = 1:numFrames
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        Priority(0);
        
        %%
        %display the second object
        fileName = strcat('C:\Users\bcanguest\Documents\PsychToolbox Experiments\AG_KNOPS\SedaProject2\localizer_files\',obj2{i});
        [img] = imread(fileName);
        disp(fileName);
        % Make the image into a texture
        imageTexture = Screen('MakeTexture', w, img);
        
        % Get the size of the image
        [s1, s2, s3] = size(img);
        
        % Get the aspect ratio of the image. We need this to maintain the aspect
        % ratio of the image when we draw it different sizes. Otherwise, if we
        % don't match the aspect ratio the image will appear warped / stretched
        aspectRatio = s2 / s1;
        
        % We will set the height of each drawn image to a fraction of the screens
        % height
        heightScalers = linspace(1, 0.2, 5);
        imageHeights = screenYpixels .* heightScalers;
        imageWidths = imageHeights .* aspectRatio;
        
        % Number of images we will draw
        numImages = 4;
        
        % Make the destination rectangles for our image. We will draw the image
        % multiple times over getting smaller on each iteration. So we need the big
        % dstRects first followed by the progressively smaller ones
        dstRects = zeros(4, numImages);
        for j = 1:numImages
            theRect = [0 0 imageWidths(j) imageHeights(j)];
            dstRects(:, j) = CenterRectOnPointd(theRect, screenXpixels / 2,...                 screenYpixels / i);
                screenYpixels / 2);
        end
        

        Priority(MaxPriority(w));
        numFrames = round(1.2/ ifi);
        for frame = 1:numFrames
            if trial_type(i) ~= 4
                Screen('DrawTextures', w, imageTexture, [], dstRects(:,4));
            end;
            
            if frame == 1
                obj2_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
        end
        obj2_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);

        %%
        %the gap in between objects
        Priority(MaxPriority(w));
        numFrames = round(1.2/ ifi);
        for frame = 1:numFrames
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        Priority(0);
        
        
        %%
        %display the third object
        fileName = strcat('C:\Users\bcanguest\Documents\PsychToolbox Experiments\AG_KNOPS\SedaProject2\localizer_files\',obj3{i});
        [img] = imread(fileName);
        disp(fileName);
        % Make the image into a texture
        imageTexture = Screen('MakeTexture', w, img);
        
        % Get the size of the image
        [s1, s2, s3] = size(img);
        
        % Get the aspect ratio of the image. We need this to maintain the aspect
        % ratio of the image when we draw it different sizes. Otherwise, if we
        % don't match the aspect ratio the image will appear warped / stretched
        aspectRatio = s2 / s1;
        
        % We will set the height of each drawn image to a fraction of the screens
        % height
        heightScalers = linspace(1, 0.2, 5);
        imageHeights = screenYpixels .* heightScalers;
        imageWidths = imageHeights .* aspectRatio;
        
        % Number of images we will draw
        numImages = 4;
        
        % Make the destination rectangles for our image. We will draw the image
        % multiple times over getting smaller on each iteration. So we need the big
        % dstRects first followed by the progressively smaller ones
        dstRects = zeros(4, numImages);
        for j = 1:numImages
            theRect = [0 0 imageWidths(j) imageHeights(j)];
            dstRects(:, j) = CenterRectOnPointd(theRect, screenXpixels / 2,...                 screenYpixels / i);
                screenYpixels / 2);
        end
        

        Priority(MaxPriority(w));
        numFrames = round(1.2/ ifi);
        for frame = 1:numFrames
            if trial_type(i) ~= 4
                Screen('DrawTextures', w, imageTexture, [], dstRects(:,4));
            end;
            
            if frame == 1
                obj3_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
        end
        obj3_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        time_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);

        %%
        output_list = {int2str(subNo),int2str(trialNo),int2str(trial_type(i)),'',num2str(time_start,'%.4f'),num2str(time_end,'%.4f'),'','','','','','','','',...
            '','','','','','','','','',obj1{i},obj2{i},obj3{i},num2str(obj1_start),num2str(obj1_end),num2str(obj2_start),num2str(obj2_end),...
            num2str(obj3_start),num2str(obj3_end),'','','','','','','','','','','','','','','','','','','','','','','',''};
    elseif trial_type(i) == 6
        
        %%
        %SACCADES SEQUENCE
        %draw the + in the center
        Priority(MaxPriority(w));
        numFrames = round(0.2/ ifi);
        for frame = 1:numFrames
            Screen('DrawText', w, '+',center(1),center(2), white);
            
            if frame == 1
                fix1_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
                time_start = fix1_start;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        fix1_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);
        
        

        
        %%2nd position
        Priority(MaxPriority(w));
        numFrames = round(0.65/ ifi);
        for frame = 1:numFrames
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x1_2(i), y1_2(i),white);
            
            if frame == 1
                fix2_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        fix2_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);
        

        
        
        %3rd position
        Priority(MaxPriority(w));
        numFrames = round(0.65/ ifi);
        for frame = 1:numFrames
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x1(i), y1(i),white);
            
            if frame == 1
                fix3_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        fix3_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);
        
        

        
        %center again
        Priority(MaxPriority(w));
        numFrames = round(0.2/ ifi);
        for frame = 1:numFrames
            Screen('DrawText', w, '+',center(1),center(2), white);
            
            if frame == 1
                fix4_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        fix4_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);
        
        

        
        %5th position
        Priority(MaxPriority(w));
        numFrames = round(0.65/ ifi);
        for frame = 1:numFrames
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x2_2(i), y2_2(i),white);
            
            if frame == 1
                fix5_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        fix5_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);
        
        
        
       
        
        
        %6th position
        Priority(MaxPriority(w));
        numFrames = round(0.65/ ifi);
        for frame = 1:numFrames
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x2(i), y2(i),white);
            
            if frame == 1
                fix6_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        fix6_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);
        

        
        
        %center again
        Priority(MaxPriority(w));
        numFrames = round(0.2/ ifi);
        for frame = 1:numFrames
            Screen('DrawText', w, '+',center(1),center(2), white);
            
            if frame == 1
                fix7_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        fix7_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);
        

        
        %8th position
        Priority(MaxPriority(w));
        numFrames = round(0.65/ ifi);
        for frame = 1:numFrames
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x3_2(i), y3_2(i),white);
            
            if frame == 1
                fix8_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        fix8_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);
        

        
        
        %9th position
        Priority(MaxPriority(w));
        numFrames = round(0.65/ ifi);
        for frame = 1:numFrames
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x3(i), y3(i),white);
            
            if frame == 1
                fix9_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        fix9_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);
        
               
        
        
        %center again
        Priority(MaxPriority(w));
        numFrames = round(0.2/ ifi);
        for frame = 1:numFrames
            Screen('DrawText', w, '+',center(1),center(2), white);
            
            if frame == 1
                fix10_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        fix10_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);
        
        
        
        %11th position
        Priority(MaxPriority(w));
        numFrames = round(0.65/ ifi);
        for frame = 1:numFrames
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x4_2(i), y4_2(i),white);
            
            if frame == 1
                fix11_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        fix11_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);

        
        
        %12th position        
        Priority(MaxPriority(w));
        numFrames = round(0.65/ ifi);
        for frame = 1:numFrames
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x4(i), y4(i),white);
            
            if frame == 1
                fix12_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        fix12_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        time_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);
        
        output_list = {int2str(subNo),int2str(trialNo),int2str(trial_type(i)),'',num2str(time_start,'%.4f'),num2str(time_end,'%.4f'),'','','','','','','','',...
            '','','','','','','','','','','','','','','','','','',num2str(fix1_start,'%.4f'),num2str(fix1_end,'%.4f'),num2str(fix2_start,'%.4f'),num2str(fix2_end,'%.4f'),num2str(fix3_start,'%.4f'),...
            num2str(fix3_end,'%.4f'),num2str(fix4_start,'%.4f'),num2str(fix4_end,'%.4f'),num2str(fix5_start,'%.4f'),num2str(fix5_end,'%.4f'),num2str(fix6_start,'%.4f'),num2str(fix6_end,'%.4f'),...
            num2str(fix7_start,'%.4f'),num2str(fix7_end,'%.4f'),num2str(fix8_start,'%.4f'),num2str(fix8_end,'%.4f'),num2str(fix9_start,'%.4f'),num2str(fix9_end,'%.4f'),num2str(fix10_start,'%.4f'),...
            num2str(fix10_end,'%.4f'),num2str(fix11_start,'%.4f'),num2str(fix11_end,'%.4f'),num2str(fix12_start,'%.4f'),num2str(fix12_end,'%.4f')};
    else
        %%
        %jitter
        numFrames = round(jitter(i)/ ifi);
        for frame = 1:numFrames
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
            
            if frame == 1
                time_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
                jitter_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
            % check if esc is pressed or not
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end
        jitter_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        time_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        
        
        
        output_list = {int2str(subNo),int2str(trialNo),int2str(trial_type(i)),'',num2str(time_start,'%.4f'),num2str(time_end,'%.4f'),'','','','','','','','',...
            '','','','',num2str(jitter(i),'%.4f'),num2str(jitter_start,'%.4f'),num2str(jitter_end,'%.4f'),'','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','',''};
    end;
    
    %% now define a string for each type of key press.
    [keyIsDown secs keycodes] = KbCheck();
    if ~isempty(keycodes)
        if keycodes(kc_esc)
            Priority(0);
            ShowCursor;
            Screen('CloseAll');
        end;
    end;
    
    
    
    for z = 1:length(output_list)
        fprintf(fid,'%s\t',output_list{z});
    end;
    %jump to the next line in the output file
    fprintf(fid,'%s\n',' ');
    trialNo = trialNo + 1;
    %%
end;