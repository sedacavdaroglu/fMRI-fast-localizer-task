function trialNo = saccades(subNo,trialNo,w,fix_cord,fix_cord2,fix_cord3,fid,expTimer,rect)
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

% Get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', w);

for i = 1:32
    time_start = toc(expTimer);
    if trial_type(i) == 5
        %%OBJECT SEQUENCE
        %display the first object
%         fileName = strcat('C:\Users\cavdaros\Desktop\Seda\fMRI2\localizer_files\',obj1{i});
%         [img] = imread(fileName);
%         disp(fileName);
%         % Make the image into a texture
%         imageTexture = Screen('MakeTexture', w, img);
%         
%         % Get the size of the image
%         [s1, s2, s3] = size(img);
%         
%         % Get the aspect ratio of the image. We need this to maintain the aspect
%         % ratio of the image when we draw it different sizes. Otherwise, if we
%         % don't match the aspect ratio the image will appear warped / stretched
%         aspectRatio = s2 / s1;
%         
%         % We will set the height of each drawn image to a fraction of the screens
%         % height
%         heightScalers = linspace(1, 0.2, 5);
%         imageHeights = screenYpixels .* heightScalers;
%         imageWidths = imageHeights .* aspectRatio;
%         
%         % Number of images we will draw
%         numImages = 4;
%         
%         % Make the destination rectangles for our image. We will draw the image
%         % multiple times over getting smaller on each iteration. So we need the big
%         % dstRects first followed by the progressively smaller ones
%         dstRects = zeros(4, numImages);
%         for j = 1:numImages
%             theRect = [0 0 imageWidths(j) imageHeights(j)];
%             dstRects(:, j) = CenterRectOnPointd(theRect, screenXpixels / 2,...                 screenYpixels / i);
%                 screenYpixels / 2);
%         end
%         
%        
%             
%         t0 = timer('TimerFcn', 'stat=false','StartDelay',1.2);
%         start(t0);
%         
%         
%         obj1_start = toc(expTimer);
%         while(strcmp(get(t0,'Running'),'on'))
%             % Draw the image to the screen, unless otherwise specified PTB will draw
%             % the texture full size in the center of the screen.
%             Screen('DrawTextures', w, imageTexture, [], dstRects(:,4));
%             Screen('Flip',w);
%             % now define a string for each type of key press.
%             [keyIsDown secs keycodes] = KbCheck();
%             if ~isempty(keycodes)
%                 if keycodes(kc_esc)
%                     Priority(0);
%                     ShowCursor;
%                     Screen('CloseAll');
%                 end;
%             end;
%         end;
%         obj1_end = toc(expTimer);
%         
%         %%
%         %the gap in between objects
%         t1 = timer('TimerFcn', 'stat=false','StartDelay',1.2);
%         start(t1);
%         while(strcmp(get(t1,'Running'),'on'))
%             Screen('Flip',w);
%             % now define a string for each type of key press.
%             [keyIsDown secs keycodes] = KbCheck();
%             if ~isempty(keycodes)
%                 if keycodes(kc_esc)
%                     Priority(0);
%                     ShowCursor;
%                     Screen('CloseAll');
%                 end;
%             end;
%         end;
%         
%         %%
%         %display the second object
%         fileName = strcat('C:\Users\cavdaros\Desktop\Seda\fMRI2\localizer_files\',obj2{i});
%         [img] = imread(fileName);
%         disp(fileName);
%         % Make the image into a texture
%         imageTexture = Screen('MakeTexture', w, img);
%         
%         % Get the size of the image
%         [s1, s2, s3] = size(img);
%         
%         % Get the aspect ratio of the image. We need this to maintain the aspect
%         % ratio of the image when we draw it different sizes. Otherwise, if we
%         % don't match the aspect ratio the image will appear warped / stretched
%         aspectRatio = s2 / s1;
%         
%         % We will set the height of each drawn image to a fraction of the screens
%         % height
%         heightScalers = linspace(1, 0.2, 5);
%         imageHeights = screenYpixels .* heightScalers;
%         imageWidths = imageHeights .* aspectRatio;
%         
%         % Number of images we will draw
%         numImages = 4;
%         
%         % Make the destination rectangles for our image. We will draw the image
%         % multiple times over getting smaller on each iteration. So we need the big
%         % dstRects first followed by the progressively smaller ones
%         dstRects = zeros(4, numImages);
%         for j = 1:numImages
%             theRect = [0 0 imageWidths(j) imageHeights(j)];
%             dstRects(:, j) = CenterRectOnPointd(theRect, screenXpixels / 2,...                 screenYpixels / i);
%                 screenYpixels / 2);
%         end
%         
% 
%             
%         t2 = timer('TimerFcn', 'stat=false','StartDelay',1.2);
%         start(t2);
%         obj2_start = toc(expTimer);
%         while(strcmp(get(t2,'Running'),'on'))
%             % Draw the image to the screen, unless otherwise specified PTB will draw
%             % the texture full size in the center of the screen.
%             Screen('DrawTextures', w, imageTexture, [], dstRects(:,4));
%             Screen('Flip',w);
%             % now define a string for each type of key press.
%             [keyIsDown secs keycodes] = KbCheck();
%             if ~isempty(keycodes)
%                 if keycodes(kc_esc)
%                     Priority(0);
%                     ShowCursor;
%                     Screen('CloseAll');
%                 end;
%             end;
%         end;
%         obj2_end = toc(expTimer);
%         
%         
%         %%
%         %the gap in between objects
%         t3 = timer('TimerFcn', 'stat=false','StartDelay',1.2);
%         start(t3);
%         while(strcmp(get(t3,'Running'),'on'))
%             Screen('Flip',w);
%             % now define a string for each type of key press.
%             [keyIsDown secs keycodes] = KbCheck();
%             if ~isempty(keycodes)
%                 if keycodes(kc_esc)
%                     Priority(0);
%                     ShowCursor;
%                     Screen('CloseAll');
%                 end;
%             end;
%         end;
%         
%         
%         %%
%         %display the third object
%         fileName = strcat('C:\Users\cavdaros\Desktop\Seda\fMRI2\localizer_files\',obj3{i});
%         [img] = imread(fileName);
%         disp(fileName);
%         % Make the image into a texture
%         imageTexture = Screen('MakeTexture', w, img);
%         
%         % Get the size of the image
%         [s1, s2, s3] = size(img);
%         
%         % Get the aspect ratio of the image. We need this to maintain the aspect
%         % ratio of the image when we draw it different sizes. Otherwise, if we
%         % don't match the aspect ratio the image will appear warped / stretched
%         aspectRatio = s2 / s1;
%         
%         % We will set the height of each drawn image to a fraction of the screens
%         % height
%         heightScalers = linspace(1, 0.2, 5);
%         imageHeights = screenYpixels .* heightScalers;
%         imageWidths = imageHeights .* aspectRatio;
%         
%         % Number of images we will draw
%         numImages = 4;
%         
%         % Make the destination rectangles for our image. We will draw the image
%         % multiple times over getting smaller on each iteration. So we need the big
%         % dstRects first followed by the progressively smaller ones
%         dstRects = zeros(4, numImages);
%         for j = 1:numImages
%             theRect = [0 0 imageWidths(j) imageHeights(j)];
%             dstRects(:, j) = CenterRectOnPointd(theRect, screenXpixels / 2,...                 screenYpixels / i);
%                 screenYpixels / 2);
%         end
%         
% 
%             
%         t4 = timer('TimerFcn', 'stat=false','StartDelay',1.2);
%         start(t4);
%         obj3_start = toc(expTimer);
%         while(strcmp(get(t4,'Running'),'on'))
%             %             tex=Screen('MakeTexture', w,img);
%             % Draw the image to the screen, unless otherwise specified PTB will draw
%             % the texture full size in the center of the screen.
%             Screen('DrawTextures', w, imageTexture, [], dstRects(:,4));
%             Screen('Flip',w);
%             % now define a string for each type of key press.
%             [keyIsDown secs keycodes] = KbCheck();
%             if ~isempty(keycodes)
%                 if keycodes(kc_esc)
%                     Priority(0);
%                     ShowCursor;
%                     Screen('CloseAll');
%                 end;
%             end;
%         end;
%         obj3_end = toc(expTimer);
%         output_list = {int2str(subNo),int2str(trialNo),int2str(trial_type(i)),'',num2str(time_start,'%.4f'),num2str(time_end,'%.4f'),'','','','','','','','',...
%             '','','','','','','','','',obj1{1},num2str(obj1_start),num2str(obj1_end),obj2{2},num2str(obj2_start),num2str(obj2_end),...
%             obj3{1},num2str(obj3_start),num2str(obj3_end),'','','','','','','','','','','','','','','','','','','','','','','',''};
    elseif trial_type(i) == 6
        
        %%
        %SACCADES SEQUENCE
        %draw the + in the center
        t0 = timer('TimerFcn', 'stat=false','StartDelay',0.2);
        start(t0);
        
        fix1_start = toc(expTimer);
        while(strcmp(get(t0,'Running'),'on'))
%             Screen('FrameOval', w, white, fix_cord);	%
%             [nx, ny, bbox] = DrawFormattedText(w, '+', 'center', 'center', white);
%             Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+',center(1),center(2), white);
            Screen('Flip',w);
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
        fix1_end = toc(expTimer);
        
        %%2nd position
        t0 = timer('TimerFcn', 'stat=false','StartDelay',0.65);
        start(t0);
        
        fix2_start = toc(expTimer);
        while(strcmp(get(t0,'Running'),'on'))
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x1_2(i), y1_2(i),white);
            Screen('Flip',w);
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
        fix2_end = toc(expTimer);
        
        
        %3rd position
        t0 = timer('TimerFcn', 'stat=false','StartDelay',0.65);
        start(t0);
        
        fix3_start = toc(expTimer);
        while(strcmp(get(t0,'Running'),'on'))
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x1(i), y1(i),white);
            Screen('Flip',w);
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
        fix3_end = toc(expTimer);
        
        %center again
        t0 = timer('TimerFcn', 'stat=false','StartDelay',0.2);
        start(t0);
        
        
        fix4_start = toc(expTimer);
        while(strcmp(get(t0,'Running'),'on'))
            Screen('FrameOval', w, white, fix_cord3);	%
%             [nx, ny, bbox] = DrawFormattedText(w, '+', 'center', 'center', white);
            Screen('DrawText', w, '+',center(1),center(2), white);
%             [nx, ny, bbox] = DrawFormattedText(w, '+', 'center', 'center', white);
            Screen('Flip',w);
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
        fix4_end = toc(expTimer);
        
        %5th position
        t0 = timer('TimerFcn', 'stat=false','StartDelay',0.65);
        start(t0);
        fix5_start = toc(expTimer);
        while(strcmp(get(t0,'Running'),'on'))
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x2_2(i), y2_2(i),white);
            Screen('Flip',w);
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
        fix5_end = toc(expTimer);
        
        
        %6th position
        t0 = timer('TimerFcn', 'stat=false','StartDelay',0.65);
        start(t0);
        
        fix6_start = toc(expTimer);
        while(strcmp(get(t0,'Running'),'on'))
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x2(i), y2(i),white);
            Screen('Flip',w);
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
        fix6_end = toc(expTimer);
        
        
        %center again
        t0 = timer('TimerFcn', 'stat=false','StartDelay',0.2);
        start(t0);
        
        fix7_start = toc(expTimer);
        while(strcmp(get(t0,'Running'),'on'))
            Screen('FrameOval', w, white, fix_cord3);	%
%             [nx, ny, bbox] = DrawFormattedText(w, '+', 'center', 'center', white);
            Screen('DrawText', w, '+',center(1),center(2), white);
            Screen('Flip',w);
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
        fix7_end = toc(expTimer);
        
        %8th position
        t0 = timer('TimerFcn', 'stat=false','StartDelay',0.65);
        start(t0);
        fix8_start = toc(expTimer);
        while(strcmp(get(t0,'Running'),'on'))
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x3_2(i), y3_2(i),white);
            Screen('Flip',w);
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
        fix8_end = toc(expTimer);
        
        
        %9th position
        t0 = timer('TimerFcn', 'stat=false','StartDelay',0.65);
        start(t0);
        
        fix9_start = toc(expTimer);
        while(strcmp(get(t0,'Running'),'on'))
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x3(i), y3(i),white);
            Screen('Flip',w);
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
        fix9_end = toc(expTimer);
        
        
        
        %center again
        t0 = timer('TimerFcn', 'stat=false','StartDelay',0.2);
        start(t0);
        
        fix10_start = toc(expTimer);
        while(strcmp(get(t0,'Running'),'on'))
            Screen('FrameOval', w, white, fix_cord3);	%
%             [nx, ny, bbox] = DrawFormattedText(w, '+', 'center', 'center', white);
            Screen('DrawText', w, '+',center(1),center(2), white);
            Screen('Flip',w);
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
        fix10_end = toc(expTimer);
        
        %11th position
        t0 = timer('TimerFcn', 'stat=false','StartDelay',0.65);
        start(t0);
        fix11_start = toc(expTimer);
        while(strcmp(get(t0,'Running'),'on'))
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x4_2(i), y4_2(i),white);
            Screen('Flip',w);
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
        fix11_end = toc(expTimer);
        
        
        %12th position
        t0 = timer('TimerFcn', 'stat=false','StartDelay',0.65);
        start(t0);
        
        fix12_start = toc(expTimer);
        while(strcmp(get(t0,'Running'),'on'))
            Screen('FrameOval', w, white, fix_cord3);	%
            Screen('DrawText', w, '+', x4(i), y4(i),white);
            Screen('Flip',w);
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
        fix12_end = toc(expTimer);
        time_end = toc(expTimer);
        output_list = {int2str(subNo),int2str(trialNo),int2str(trial_type(i)),'',num2str(time_start,'%.4f'),num2str(time_end,'%.4f'),'','','','','','','','',...
            '','','','','','','','','','','','','','','','','','',num2str(fix1_start,'%.4f'),num2str(fix1_end,'%.4f'),num2str(fix2_start,'%.4f'),num2str(fix2_end,'%.4f'),num2str(fix3_start,'%.4f'),...
            num2str(fix3_end,'%.4f'),num2str(fix4_start,'%.4f'),num2str(fix4_end,'%.4f'),num2str(fix5_start,'%.4f'),num2str(fix5_end,'%.4f'),num2str(fix6_start,'%.4f'),num2str(fix6_end,'%.4f'),...
            num2str(fix7_start,'%.4f'),num2str(fix7_end,'%.4f'),num2str(fix8_start,'%.4f'),num2str(fix8_end,'%.4f'),num2str(fix9_start,'%.4f'),num2str(fix9_end,'%.4f'),num2str(fix10_start,'%.4f'),...
            num2str(fix10_end,'%.4f'),num2str(fix11_start,'%.4f'),num2str(fix11_end,'%.4f'),num2str(fix12_start,'%.4f'),num2str(fix12_end,'%.4f')};
    else
        %%
        %jitter
        t5 = timer('TimerFcn', 'stat=false','StartDelay',jitter(i));
        start(t5);
        jitter_start = toc(expTimer);
        while(strcmp(get(t5,'Running'),'on'))
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
            Screen('Flip', w);
        end;
        jitter_end = toc(expTimer);
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