function motion(subNo,w,fix_cord,fix_cord2,fid,rect,start_trigger)

%author: Seda Cavdaroglu, 01/04/15

AssertOpenGL;

% ------------------------
% set dot field parameters
% ------------------------


nframes     = 60; % number of animation frames in loop
mon_width   = 50;   % horizontal dimension of viewable screen (cm)
v_dist      = 60;   % viewing distance (cm)
dot_speed   = 8;    % dot speed (deg/sec)
lifeTime      = 10; % life time of each dot in frames
ndots       = 200; % number of dots
dot_w       = 0.25;  % width of dot (deg)
radius = 10; %degrees
blockDur = 12; %in secs
waitframes = 1;
reps = 9;



kc_esc = KbName('esc');
% Enable alpha blending with proper blend-function. We need it
% for drawing of smoothed points:
Screen('BlendFunction', w, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
[center(1), center(2)] = RectCenter(rect);

fps=Screen('FrameRate',w);      % frames per second
ifi=Screen('GetFlipInterval', w);
if fps==0
    fps=1/ifi;
end;
ppd = pi * (rect(3)-rect(1)) / atan(mon_width/v_dist/2) / 360;    % pixels per degree
pixels_radius = ppd*radius;
pfs = dot_speed * ppd / fps;                            % dot speed (pixels/frame)
s = dot_w * ppd;

[center(1), center(2)] = RectCenter(rect);
fix_cord4 = [center-pixels_radius center+pixels_radius]; %white fixation

black = [0 0 0];
white = [255 255 255];
red = [255 0 0];

HideCursor;	% Hide the mouse cursor
Priority(MaxPriority(w));

%initial flip
vbl = Screen('Flip', w);

%assign an initial direction of movement to all the points
dirs = [-1,1];
shuffle(dirs);
dir = dirs(1);



for k = 1:reps
    % ---------------------------------------
    % initialize dot positions and velocities
    % ---------------------------------------
    x = unifrnd (-pixels_radius , pixels_radius, ndots, 1);
    y = unifrnd (-pixels_radius , pixels_radius, ndots, 1);
    
    
    %check if any of the dots fall outside of the circle or inside the
    %fixation point
    distances = check_dist(x,y);
    outsideIndx = find(distances>=pixels_radius);
    insideIndx = find(distances <= 0.3*ppd);
    while ~isempty(outsideIndx) || ~isempty(insideIndx)
        x(outsideIndx) = unifrnd (-pixels_radius , pixels_radius, length(outsideIndx), 1);
        y(outsideIndx) = unifrnd (-pixels_radius , pixels_radius, length(outsideIndx), 1);
        x(insideIndx) = unifrnd (-pixels_radius , pixels_radius, length(insideIndx), 1);
        y(insideIndx) = unifrnd (-pixels_radius , pixels_radius, length(insideIndx), 1);
        distances = check_dist(x,y);
        outsideIndx = find(distances>=pixels_radius);
        insideIndx = find(distances <= 0.3*ppd);
    end
    
    %check if any of the dots collide and change the position if so
    pairwise_dist = check_collision(x,y,s);
    [tooSmallDistX,tooSmallDistY] = find(pairwise_dist<=s);
    tooSmallDistX = unique(tooSmallDistX);
    
    while ~isempty(tooSmallDistX)
        %move them by s/2 to overcome overlap
        x(tooSmallDistX) = unifrnd (-pixels_radius , pixels_radius, length(tooSmallDistX), 1);
        y(tooSmallDistX) = unifrnd (-pixels_radius , pixels_radius, length(tooSmallDistX), 1);
%         for z = 1:length(tooSmallDistX)
%             new_x =(sqrt(x(tooSmallDistX(z))^2+y(tooSmallDistX(z))^2)-dir*s/2)*x(tooSmallDistX(z))/(sqrt(x(tooSmallDistX(z))^2+y(tooSmallDistX(z))^2));
%             y(tooSmallDistX(z)) = (sqrt(x(tooSmallDistX(z))^2+y(tooSmallDistX(z))^2)-dir*s/2)*y(tooSmallDistX(z))/(sqrt(x(tooSmallDistX(z))^2+y(tooSmallDistX(z))^2));
%             x(tooSmallDistX(z))= new_x;
%         end;

        %check if any of the dots fall outside of the circle or inside the
        %fixation point
        distances = check_dist(x,y);
        outsideIndx = find(distances>=pixels_radius);
        insideIndx = find(distances <= 0.3*ppd);
        while ~isempty(outsideIndx) || ~isempty(insideIndx)
            x(outsideIndx) = unifrnd (-pixels_radius , pixels_radius, length(outsideIndx), 1);
            y(outsideIndx) = unifrnd (-pixels_radius , pixels_radius, length(outsideIndx), 1);
            x(insideIndx) = unifrnd (-pixels_radius , pixels_radius, length(insideIndx), 1);
            y(insideIndx) = unifrnd (-pixels_radius , pixels_radius, length(insideIndx), 1);
            distances = check_dist(x,y);
            outsideIndx = find(distances>=pixels_radius);
            insideIndx = find(distances <= 0.3*ppd);
        end
        
        pairwise_dist = check_collision(x,y,s);
        [tooSmallDistX,tooSmallDistY] = find(pairwise_dist<=s);
        tooSmallDistX = unique(tooSmallDistX);
        
        [keyIsDown secs keycodes] = KbCheck();
        if ~isempty(keycodes)
            if keycodes(kc_esc)
                Priority(0);
                ShowCursor;
                Screen('CloseAll');
            end;
        end;
    end;
    
    xy = [x y];   % dot positions in Cartesian coordinates (pixels from center)
    xy = transpose(xy);
    % --------------
    % animation loop
    % --------------
    for j = 1:blockDur
        dir = -dir;
        for i = 1:nframes
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
            
            Priority(MaxPriority(w));
            % Draw nice dots:
            Screen('DrawDots', w, xy, s, white, center,1);  % change 1 to 0 to draw square dots
            %Draw fixation dot
%             Screen('FrameOval', w, red, fix_cord4);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
            if i == 1
                start_move = vbl + (waitframes-0.5)*ifi-start_trigger;
            end;
            vbl=Screen('Flip', w, vbl + (waitframes-0.5)*ifi);
            if i == nframes
                end_move = vbl + (waitframes-0.5)*ifi-start_trigger;
                %write the output info to the log file
                output_list = {int2str(subNo),'','8',num2str(start_trigger,'%.4f'),num2str(start_move,'%.4f'),num2str(end_move,'%.4f'),'','','','','','','','',...
                    '','','','','','','','','',...
                    '','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',int2str(k),int2str(dir)};
                for z = 1:length(output_list)
                    fprintf(fid,'%s\t',output_list{z});
                end;
                %jump to the next line in the output file
                fprintf(fid,'%s\n',' ');
            end;
            Screen('DrawingFinished', w); % Tell PTB that no further drawing commands will follow before Screen('Flip')
            Priority(0);
%             pause(0.1);
            
            if rem(i,lifeTime) == 0 %kill the dots, put them in another location
                x = unifrnd (-pixels_radius , pixels_radius, ndots, 1);
                y = unifrnd (-pixels_radius , pixels_radius, ndots, 1);
                
                
                %check if any of the dots fall outside of the circle or inside the
                %fixation point
                distances = check_dist(x,y);
                outsideIndx = find(distances>=pixels_radius);
                insideIndx = find(distances <= 0.3*ppd);
                while ~isempty(outsideIndx) || ~isempty(insideIndx)
                    x(outsideIndx) = unifrnd (-pixels_radius , pixels_radius, length(outsideIndx), 1);
                    y(outsideIndx) = unifrnd (-pixels_radius , pixels_radius, length(outsideIndx), 1);
                    x(insideIndx) = unifrnd (-pixels_radius , pixels_radius, length(insideIndx), 1);
                    y(insideIndx) = unifrnd (-pixels_radius , pixels_radius, length(insideIndx), 1);
                    distances = check_dist(x,y);
                    outsideIndx = find(distances>=pixels_radius);
                    insideIndx = find(distances <= 0.3*ppd);
                end
                
            else %update the locations               
                for z = 1:length(x)
                    new_x = (sqrt(x(z)^2+y(z)^2)+dir*pfs)*x(z)/(sqrt(x(z)^2+y(z)^2));
                    y(z) = (sqrt(x(z)^2+y(z)^2)+dir*pfs)*y(z)/(sqrt(x(z)^2+y(z)^2));
                    x(z)= new_x;
                end;
            end;
            
            
            %check if any of the dots fall outside of the circle or inside the
            %fixation point
            distances = check_dist(x,y);
            outsideIndx = find(distances>=pixels_radius);
            insideIndx = find(distances <= 0.3*ppd);
            while ~isempty(outsideIndx) || ~isempty(insideIndx)
                x(outsideIndx) = unifrnd (-pixels_radius , pixels_radius, length(outsideIndx), 1);
                y(outsideIndx) = unifrnd (-pixels_radius , pixels_radius, length(outsideIndx), 1);
                x(insideIndx) = unifrnd (-pixels_radius , pixels_radius, length(insideIndx), 1);
                y(insideIndx) = unifrnd (-pixels_radius , pixels_radius, length(insideIndx), 1);
                if dir == -1 %put them around the edge if they move inwards and have reached the center
                    tmp = unifrnd (0.25*ppd , pixels_radius/10 , length(insideIndx), 1);
                    r = abs(tmp-pixels_radius);

                    
                    angle = unifrnd (0 , 360, length(insideIndx), 1);
                    angle = pi/180 .* angle;
                    
                    for t = 1:length(insideIndx)
                        x(insideIndx(t)) = r(t)/sqrt(tan(angle(t))^2+1);
                        y(insideIndx(t)) = sqrt(r(t)^2-x(insideIndx(t)).^2);
                    end;
                    
                    x(setdiff(find(angle < pi),find(angle < pi/2))) = -x(setdiff(find(angle < pi),find(angle < pi/2)));
                    x(setdiff(find(angle < 3*pi/2),find(angle < pi))) = -x(setdiff(find(angle < 3*pi/2),find(angle < pi)));
                    y(setdiff(find(angle < 3*pi/2),find(angle < pi))) = -y(setdiff(find(angle < 3*pi/2),find(angle < pi)));
                    y(setdiff(find(angle < 2*pi),find(angle < 3*pi/2))) = -y(setdiff(find(angle < 2*pi),find(angle < 3*pi/2)));
                end;
                distances = check_dist(x,y);
                outsideIndx = find(distances>=pixels_radius);
                insideIndx = find(distances <= 0.3*ppd);
            end
            
            
            %check if any of the dots collide and change the position if so
            pairwise_dist = check_collision(x,y,s);
            [tooSmallDistX,tooSmallDistY] = find(pairwise_dist<=s);
            tooSmallDistX = unique(tooSmallDistX);
            
            while ~isempty(tooSmallDistX)
                %move them by s/2 to overcome overlap
                %                 for z = 1:length(tooSmallDistX)
                %                     new_x = (sqrt(x(tooSmallDistX(z))^2+y(tooSmallDistX(z))^2)+dir*s/2)*x(tooSmallDistX(z))/(sqrt(x(tooSmallDistX(z))^2+y(tooSmallDistX(z))^2));
                %                     y(tooSmallDistX(z)) = (sqrt(x(tooSmallDistX(z))^2+y(tooSmallDistX(z))^2)+dir*s/2)*y(tooSmallDistX(z))/(sqrt(x(tooSmallDistX(z))^2+y(tooSmallDistX(z))^2));
                %                     x(tooSmallDistX(z))= new_x;
                %                 end;
                x(tooSmallDistX) = unifrnd (-pixels_radius , pixels_radius, length(tooSmallDistX), 1);
                y(tooSmallDistX) = unifrnd (-pixels_radius , pixels_radius, length(tooSmallDistX), 1);
                
                %check if any of the dots fall outside of the circle or inside the
                %fixation point
                distances = check_dist(x,y);
                outsideIndx = find(distances>=pixels_radius);
                insideIndx = find(distances <= 0.3*ppd);
                while ~isempty(outsideIndx) || ~isempty(insideIndx)
                    x(outsideIndx) = unifrnd (-pixels_radius , pixels_radius, length(outsideIndx), 1);
                    y(outsideIndx) = unifrnd (-pixels_radius , pixels_radius, length(outsideIndx), 1);
                    x(insideIndx) = unifrnd (-pixels_radius , pixels_radius, length(insideIndx), 1);
                    y(insideIndx) = unifrnd (-pixels_radius , pixels_radius, length(insideIndx), 1);
                    distances = check_dist(x,y);
                    outsideIndx = find(distances>=pixels_radius);
                    insideIndx = find(distances <= 0.3*ppd);
                end
                pairwise_dist = check_collision(x,y,s);
                [tooSmallDistX,tooSmallDistY] = find(pairwise_dist<=s);
                tooSmallDistX = unique(tooSmallDistX);
                
                [keyIsDown secs keycodes] = KbCheck();
                if ~isempty(keycodes)
                    if keycodes(kc_esc)
                        Priority(0);
                        ShowCursor;
                        Screen('CloseAll');
                    end;
                end;
            end;
            xy = [x y];   % dot positions in Cartesian coordinates (pixels from center)
            xy = transpose(xy);
            %         vbl=Screen('Flip', w, vbl + (waitframes-0.5)*ifi);
        end;
    end;
    
    %stationary kinematogram
    x = unifrnd (-pixels_radius , pixels_radius, ndots, 1);
    y = unifrnd (-pixels_radius , pixels_radius, ndots, 1);
    
    
    distances = check_dist(x,y);
    outsideIndx = find(distances>=pixels_radius);
    insideIndx = find(distances <= 0.3*ppd);
    %check if any of the dots fall outside of the circle or inside the
    %fixation point
    while ~isempty(outsideIndx) || ~isempty(insideIndx)
        x(outsideIndx) = unifrnd (-pixels_radius , pixels_radius, length(outsideIndx), 1);
        y(outsideIndx) = unifrnd (-pixels_radius , pixels_radius, length(outsideIndx), 1);
        x(insideIndx) = unifrnd (-pixels_radius , pixels_radius, length(insideIndx), 1);
        y(insideIndx) = unifrnd (-pixels_radius , pixels_radius, length(insideIndx), 1);
        distances = check_dist(x,y);
        outsideIndx = find(distances>=pixels_radius);
        insideIndx = find(distances <= 0.3*ppd);
    end
    
    %check if any of the dots collide and change the position if so
    pairwise_dist = check_collision(x,y,s);
    [tooSmallDistX,tooSmallDistY] = find(pairwise_dist<=s);
    tooSmallDistX = unique(tooSmallDistX);
    
    while ~isempty(tooSmallDistX)
        %move them by s/2 to overcome overlap
%         for z = 1:length(tooSmallDistX)
%             new_x = (sqrt(x(tooSmallDistX(z))^2+y(tooSmallDistX(z))^2)+s/2)*x(tooSmallDistX(z))/(sqrt(x(tooSmallDistX(z))^2+y(tooSmallDistX(z))^2));
%             y(tooSmallDistX(z)) = (sqrt(x(tooSmallDistX(z))^2+y(tooSmallDistX(z))^2)+s/2)*y(tooSmallDistX(z))/(sqrt(x(tooSmallDistX(z))^2+y(tooSmallDistX(z))^2));
%             x(tooSmallDistX(z))= new_x;
%         end;
        x(tooSmallDistX) = unifrnd (-pixels_radius , pixels_radius, length(tooSmallDistX), 1);
        y(tooSmallDistX) = unifrnd (-pixels_radius , pixels_radius, length(tooSmallDistX), 1);

        %check if any of the dots fall outside of the circle or inside the
        %fixation point
        distances = check_dist(x,y);
        outsideIndx = find(distances>=pixels_radius);
        insideIndx = find(distances <= 0.3*ppd);
        while ~isempty(outsideIndx) || ~isempty(insideIndx)
            x(outsideIndx) = unifrnd (-pixels_radius , pixels_radius, length(outsideIndx), 1);
            y(outsideIndx) = unifrnd (-pixels_radius , pixels_radius, length(outsideIndx), 1);
            x(insideIndx) = unifrnd (-pixels_radius , pixels_radius, length(insideIndx), 1);
            y(insideIndx) = unifrnd (-pixels_radius , pixels_radius, length(insideIndx), 1);
            distances = check_dist(x,y);
            outsideIndx = find(distances>=pixels_radius);
            insideIndx = find(distances <= 0.3*ppd);
        end
        
        pairwise_dist = check_collision(x,y,s);
        [tooSmallDistX,tooSmallDistY] = find(pairwise_dist<=s);
        tooSmallDistX = unique(tooSmallDistX);
        
        [keyIsDown secs keycodes] = KbCheck();
        if ~isempty(keycodes)
            if keycodes(kc_esc)
                Priority(0);
                ShowCursor;
                Screen('CloseAll');
            end;
        end;
    end;
    
    xy = [x y];   % dot positions in Cartesian coordinates (pixels from center)
    xy = transpose(xy);
    for j = 1:blockDur
        for i = 1:nframes
            Priority(MaxPriority(w));
%             Screen('FrameOval', w, red, fix_cord4);	% draw fixation dot (flip erases it)
            Screen('DrawDots', w, xy, s, white, center,1);  % change 1 to 0 to draw square dots
            %Draw fixation dot
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
            if i == 1
                start_move = vbl + (waitframes-0.5)*ifi-start_trigger;
            end;
            vbl=Screen('Flip', w, vbl + (waitframes-0.5)*ifi);
            Priority(0);
            if i == nframes
                end_move = vbl + (waitframes-0.5)*ifi-start_trigger;
                %write the output info to the log file
                output_list = {int2str(subNo),'','9',num2str(start_trigger,'%.4f'),num2str(start_move,'%.4f'),num2str(end_move,'%.4f'),'','','','','','','','',...
                    '','','','','','','','','',...
                    '','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',int2str(k),'0'};
                for z = 1:length(output_list)
                    fprintf(fid,'%s\t',output_list{z});
                end;
                %jump to the next line in the output file
                fprintf(fid,'%s\n',' ');
            end;
            [keyIsDown secs keycodes] = KbCheck();
            if ~isempty(keycodes)
                if keycodes(kc_esc)
                    Priority(0);
                    ShowCursor;
                    Screen('CloseAll');
                end;
            end;
        end;
    end;
end

% Screen('CloseAll');
end

function distances = check_dist(x,y)
distances = zeros(length(x),1);
for i = 1:length(x)
    distances(i,1) = sqrt(x(i)^2+y(i)^2);
end;
end

function pairwise_dist = check_collision(x,y,s)
pairwise_dist = zeros(length(x),length(x));
for i = 1:length(x)
    for j = 1:length(y)
        if i < j
            pairwise_dist(i,j) = sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
        else
            pairwise_dist(i,j) = 2*s;
        end;
    end;
end;
end