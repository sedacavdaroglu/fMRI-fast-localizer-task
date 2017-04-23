function trialNo = roofColors(subNo,trialNo,w,fix_cord,fix_cord2,fid,rect,start_trigger)

trial_type = [7,4,7,4,7,4,7,4,7,4,7,4,7,4,7,4];
jitter = [0,2587,0,3158,0,3798,0,2302,0,5479,0,4278,0,3788,0,6610];
jitter = jitter./1000;

obj1 = {'ygreen1.png','dummy.BMP','yred1.png','dummy.BMP','ybrown1.png',...
    'dummy.BMP','ygrey2.png','dummy.BMP','yblue1.png','dummy.BMP','ygreen1.png',...
    'dummy.BMP','ywhite2.png','dummy.BMP','ygrey2.png','dummy.BMP'};

obj2 = {'ywhite1.png','dummy.BMP','ygrey1.png','dummy.BMP','yblue2.png',...
    'dummy.BMP','yred2.png','dummy.BMP','ybrown1.png','dummy.BMP','yred1.png',...
    'dummy.BMP','yblue2.png','dummy.BMP','ybrown2.png','dummy.BMP'};

obj3 = {'yblue1.png','dummy.BMP','ygreen2.png','dummy.BMP','ywhite2.png',...
    'dummy.BMP','ybrown2.png','dummy.BMP','ywhite1.png','dummy.BMP','ygrey1.png',...
    'dummy.BMP','yred2.png','dummy.BMP','ygreen2.png','dummy.BMP'};

kc_esc = KbName('esc');
winWidth = rect(3);
winHeight = rect(4);

black = [0 0 0];
white = [255 255 255];

% Get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', w);


%initial flip
vbl = Screen('Flip', w);
ifi=Screen('GetFlipInterval', w);
waitframes = 1;


for i = 1:16
    if trial_type(i) == 7
        %display the first object
        fileName = strcat('C:\Users\bcanguest\Documents\PsychToolbox Experiments\AG_KNOPS\SedaProject2\localizer_files\',obj1{i});
        [img] = imread(fileName);
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
        
        
        
        numFrames = round(1.2/ ifi);
        for frame = 1:numFrames
            if trial_type(i) ~= 4
                Screen('DrawTextures', w, imageTexture, [], dstRects(:,4));
            end;
            
            if frame == 1
                obj1_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
                time_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
        end
        obj1_end = vbl + (waitframes - 0.5) * ifi - start_trigger;
        Priority(0);

        %%
        %the gap in between objects
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
        %the gap in between objects
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

        %%write the output info to the log file
        output_list = {int2str(subNo),int2str(trialNo),int2str(trial_type(i)),'',num2str(time_start,'%.4f'),num2str(time_end,'%.4f'),'','','','','','','','',...
            '','','','',num2str(jitter(i),'%.4f'),'','','','',obj1{i},obj2{i},obj3{i},num2str(obj1_start),num2str(obj1_end),num2str(obj2_start),num2str(obj2_end),...
            num2str(obj3_start),num2str(obj3_end),'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''};
    else
        %%
        %rest
        numFrames = round(jitter(i)/ ifi);
        for frame = 1:numFrames
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
            
            if frame == 1
                jitter_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
                time_start = vbl + (waitframes - 0.5) * ifi-start_trigger;
            end;
            vbl = Screen('Flip', w, vbl + (waitframes - 0.5) * ifi);
        end
        jitter_end = vbl + (waitframes - 0.5) * ifi-start_trigger;
        time_end = vbl + (waitframes - 0.5) * ifi-start_trigger;
        Priority(0);


        %% now define a string for each type of key press.
        [keyIsDown secs keycodes] = KbCheck();
        if ~isempty(keycodes)
            if keycodes(kc_esc)
                Priority(0);
                ShowCursor;
                Screen('CloseAll');
            end;
        end;
        %%write the output info to the log file
        output_list = {int2str(subNo),int2str(trialNo),int2str(trial_type(i)),'',num2str(time_start,'%.4f'),num2str(time_end,'%.4f'),'','','','','','','','',...
            '','','','',num2str(jitter(i),'%.4f'),num2str(jitter_start,'%.4f'),num2str(jitter_end,'%.4f'),'','',obj1{i},obj2{i},obj3{i},num2str(obj1_start),num2str(obj1_end),num2str(obj2_start),num2str(obj2_end),...
            num2str(obj3_start),num2str(obj3_end),'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''};
    end;
    
    
    
    for z = 1:length(output_list)
        fprintf(fid,'%s\t',output_list{z});
    end;
    %jump to the next line in the output file
    fprintf(fid,'%s\n',' ');
    trialNo = trialNo + 1;
end;
