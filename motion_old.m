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
fix_r       = 0.2; % radius of fixation point (deg)
waitframes = 1;
reps = 13;



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
speed_perframe = dot_speed/fps;
ppd = pi * (rect(3)-rect(1)) / atan(mon_width/v_dist/2) / 360;    % pixels per degree
pixels_radius = ppd*radius;
pfs = dot_speed * ppd / fps;                            % dot speed (pixels/frame)
s = dot_w * ppd;          


black = [0 0 0];
white = [255 255 255];

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
    r = unifrnd (0.25 , radius, ndots, 1);
    angle = unifrnd(0,360 , ndots, 1);
    angle = pi/180 .* angle;
    
    r = ppd.*r;
    x = r./sqrt(tan(angle).^2+1);
    y = sqrt(r.^2-x.^2);
    
    
    x(setdiff(find(angle < pi),find(angle < pi/2))) = -x(setdiff(find(angle < pi),find(angle < pi/2)));
    x(setdiff(find(angle < 3*pi/2),find(angle < pi))) = -x(setdiff(find(angle < 3*pi/2),find(angle < pi)));
    y(setdiff(find(angle < 3*pi/2),find(angle < pi))) = -y(setdiff(find(angle < 3*pi/2),find(angle < pi)));
    y(setdiff(find(angle < 2*pi),find(angle < 3*pi/2))) = -y(setdiff(find(angle < 2*pi),find(angle < 3*pi/2)));
    
    distances = check_dist(x,y,s);
    [tooSmallDistX,tooSmallDistY] = find(distances<=s);
    
    tooSmallDistX = unique(tooSmallDistX);
    
    while ~isempty(tooSmallDistX)
        r(tooSmallDistX) = r(tooSmallDistX)+s/2;
        % check to see which dots have gone beyond the borders of the
        % screen and put them back on the border
        tmp = find(r> pixels_radius);
        r(tmp) = pixels_radius;


        
        angle(tooSmallDistX) = unifrnd (0 , 360, length(tooSmallDistX), 1);
        angle(tooSmallDistX) = pi/180 .* angle(tooSmallDistX);
        

        x(tooSmallDistX) = r(tooSmallDistX)./sqrt(tan(angle(tooSmallDistX)).^2+1);
        y(tooSmallDistX) = sqrt(r(tooSmallDistX).^2-x(tooSmallDistX).^2);
        
        x(setdiff(find(angle < pi),find(angle < pi/2))) = -x(setdiff(find(angle < pi),find(angle < pi/2)));
        x(setdiff(find(angle < 3*pi/2),find(angle < pi))) = -x(setdiff(find(angle < 3*pi/2),find(angle < pi)));
        y(setdiff(find(angle < 3*pi/2),find(angle < pi))) = -y(setdiff(find(angle < 3*pi/2),find(angle < pi)));
        y(setdiff(find(angle < 2*pi),find(angle < 3*pi/2))) = -y(setdiff(find(angle < 2*pi),find(angle < 3*pi/2)));
    
        distances = check_dist(x,y,s);
        [tooSmallDistX,tooSmallDistY] = find(distances<=s);
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
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
            if i == 1 
                start_move = vbl + (waitframes-0.5)*ifi-start_trigger;
            elseif i == nframes
                end_move = vbl + (waitframes-0.5)*ifi-start_trigger;
                %write the output info to the log file
                output_list = {int2str(subNo),'','7',num2str(start_trigger,'%.4f'),num2str(start_move,'%.4f'),num2str(end_move,'%.4f'),'','','','','','','','',...
                    '','','','','','','','','',...
                    '','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',int2str(k),int2str(dir)};
                for z = 1:length(output_list)
                    fprintf(fid,'%s\t',output_list{z});
                end;
                %jump to the next line in the output file
                fprintf(fid,'%s\n',' ');
            end;
            vbl=Screen('Flip', w, vbl + (waitframes-0.5)*ifi);
            Screen('DrawingFinished', w); % Tell PTB that no further drawing commands will follow before Screen('Flip')
            Priority(0);
            %             pause(0.5);
            
            if rem(i,lifeTime) == 0 %kill the dots, put them in another location
                r = unifrnd (0.25, radius, ndots, 1);
                angle = unifrnd(0,360 , ndots, 1);
                angle = pi/180 .* angle;
                
                r = ppd.*r;
                x = r./sqrt(tan(angle).^2+1);
                y = sqrt(r.^2-x.^2);
                
                x(setdiff(find(angle < pi),find(angle < pi/2))) = -x(setdiff(find(angle < pi),find(angle < pi/2)));
                x(setdiff(find(angle < 3*pi/2),find(angle < pi))) = -x(setdiff(find(angle < 3*pi/2),find(angle < pi)));
                y(setdiff(find(angle < 3*pi/2),find(angle < pi))) = -y(setdiff(find(angle < 3*pi/2),find(angle < pi)));
                y(setdiff(find(angle < 2*pi),find(angle < 3*pi/2))) = -y(setdiff(find(angle < 2*pi),find(angle < 3*pi/2)));

            else %update the locations
                %find indexes for angles btw 0-90         
                
                r = r +dir*pfs;
                x = r./sqrt(tan(angle).^2+1);
                y = sqrt(r.^2-x.^2);
                
                x(setdiff(find(angle < pi),find(angle < pi/2))) = -x(setdiff(find(angle < pi),find(angle < pi/2)));
                x(setdiff(find(angle < 3*pi/2),find(angle < pi))) = -x(setdiff(find(angle < 3*pi/2),find(angle < pi)));
                y(setdiff(find(angle < 3*pi/2),find(angle < pi))) = -y(setdiff(find(angle < 3*pi/2),find(angle < pi)));
                y(setdiff(find(angle < 2*pi),find(angle < 3*pi/2))) = -y(setdiff(find(angle < 2*pi),find(angle < 3*pi/2)));
            end;
            
            
            % check to see which dots have gone beyond the borders of the
            % screen
            dots_out = find(r >= pixels_radius);	% dots to reposition
            ndots_out = length(dots_out);
            
            if ndots_out > 0
                new_r = unifrnd (0.25 , radius , ndots_out, 1);
                new_angle = unifrnd(0,360 , ndots_out, 1);
                new_angle = pi/180 .* new_angle;
                
                new_r = ppd.*new_r;
                new_x = new_r./sqrt(tan(new_angle).^2+1);
                new_y = sqrt(new_r.^2-new_x.^2);
                
                
                new_x(setdiff(find(new_angle < pi),find(new_angle < pi/2))) = -x(setdiff(find(new_angle < pi),find(new_angle < pi/2)));
                new_x(setdiff(find(new_angle < 3*pi/2),find(new_angle < pi))) = -x(setdiff(find(new_angle < 3*pi/2),find(new_angle < pi)));
                new_y(setdiff(find(new_angle < 3*pi/2),find(new_angle < pi))) = -y(setdiff(find(new_angle < 3*pi/2),find(new_angle < pi)));
                new_y(setdiff(find(new_angle < 2*pi),find(new_angle < 3*pi/2))) = -y(setdiff(find(new_angle < 2*pi),find(new_angle < 3*pi/2)));
                
                x(dots_out) = new_x;
                y(dots_out) = new_y;
                angle(dots_out) = new_angle;
                
            end;
            
            %check if any of the dots collide and change the position if so
            distances = check_dist(x,y,s);
            [tooSmallDistX,tooSmallDistY] = find(distances<=s);
            tooSmallDistX = unique(tooSmallDistX);
            
            while ~isempty(tooSmallDistX)
                %if the dots are moving outwards, move them by s/2 to
                %overcome overlap, if they are moving inwards, put the
                %around the border
                if dir == 1 
                    r(tooSmallDistX) = r(tooSmallDistX)+s/2;
                    tmp = find(r> pixels_radius);
                    r(tmp) = pixels_radius;
                else
                    %add some random jitter so that the dots on the surface
                    %dont form a circle
                    tmp = unifrnd (0.25*ppd , pixels_radius/10 , length(tooSmallDistX), 1);
                    r(tooSmallDistX) = abs(tmp-pixels_radius);
                end;

                angle(tooSmallDistX) = unifrnd (0 , 360, length(tooSmallDistX), 1);
                angle(tooSmallDistX) = pi/180 .* angle(tooSmallDistX);
                

                x(tooSmallDistX) = r(tooSmallDistX)./sqrt(tan(angle(tooSmallDistX)).^2+1);
                y(tooSmallDistX) = sqrt(r(tooSmallDistX).^2-x(tooSmallDistX).^2);
                
                x(setdiff(find(angle(tooSmallDistX) < pi),find(angle(tooSmallDistX) < pi/2))) = -x(setdiff(find(angle(tooSmallDistX) < pi),find(angle(tooSmallDistX) < pi/2)));
                x(setdiff(find(angle(tooSmallDistX) < 3*pi/2),find(angle(tooSmallDistX) < pi))) = -x(setdiff(find(angle(tooSmallDistX) < 3*pi/2),find(angle(tooSmallDistX) < pi)));
                y(setdiff(find(angle(tooSmallDistX) < 3*pi/2),find(angle(tooSmallDistX) < pi))) = -y(setdiff(find(angle(tooSmallDistX) < 3*pi/2),find(angle(tooSmallDistX) < pi)));
                y(setdiff(find(angle(tooSmallDistX) < 2*pi),find(angle(tooSmallDistX) < 3*pi/2))) = -y(setdiff(find(angle(tooSmallDistX) < 2*pi),find(angle(tooSmallDistX) < 3*pi/2)));
                
                distances = check_dist(x,y,s);
                [tooSmallDistX,tooSmallDistY] = find(distances<=s);
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
    r = unifrnd (0.4 , radius, ndots, 1);
    angle = unifrnd (0 , 360, ndots, 1);
    angle = pi/180 .* angle;
    
    r = ppd.*r;
    x = r./sqrt(tan(angle).^2+1);
    y = sqrt(r.^2-x.^2);
    
    x(setdiff(find(angle < pi),find(angle < pi/2))) = -x(setdiff(find(angle < pi),find(angle < pi/2)));
    x(setdiff(find(angle < 3*pi/2),find(angle < pi))) = -x(setdiff(find(angle < 3*pi/2),find(angle < pi)));
    y(setdiff(find(angle < 3*pi/2),find(angle < pi))) = -y(setdiff(find(angle < 3*pi/2),find(angle < pi)));
    y(setdiff(find(angle < 2*pi),find(angle < 3*pi/2))) = -y(setdiff(find(angle < 2*pi),find(angle < 3*pi/2)));
    
    %check if any of the dots collide and change the position if so
    distances = check_dist(x,y,s);
    [tooSmallDistX,tooSmallDistY] = find(distances<=s);
    tooSmallDistX = unique(tooSmallDistX);
    
    while ~isempty(tooSmallDistX)
        r(tooSmallDistX) = r(tooSmallDistX)+s/2;
        tmp = find(r> pixels_radius);
        r(tmp) = pixels_radius;

        angle(tooSmallDistX) = unifrnd (0 , 360, length(tooSmallDistX), 1);
        angle(tooSmallDistX) = pi/180 .* angle(tooSmallDistX);
        

        x(tooSmallDistX) = r(tooSmallDistX)./sqrt(tan(angle(tooSmallDistX)).^2+1);
        y(tooSmallDistX) = sqrt(r(tooSmallDistX).^2-x(tooSmallDistX).^2);
        
        x(setdiff(find(angle(tooSmallDistX) < pi),find(angle(tooSmallDistX) < pi/2))) = -x(setdiff(find(angle(tooSmallDistX) < pi),find(angle(tooSmallDistX) < pi/2)));
        x(setdiff(find(angle(tooSmallDistX) < 3*pi/2),find(angle(tooSmallDistX) < pi))) = -x(setdiff(find(angle(tooSmallDistX) < 3*pi/2),find(angle(tooSmallDistX) < pi)));
        y(setdiff(find(angle(tooSmallDistX) < 3*pi/2),find(angle(tooSmallDistX) < pi))) = -y(setdiff(find(angle(tooSmallDistX) < 3*pi/2),find(angle(tooSmallDistX) < pi)));
        y(setdiff(find(angle(tooSmallDistX) < 2*pi),find(angle(tooSmallDistX) < 3*pi/2))) = -y(setdiff(find(angle(tooSmallDistX) < 2*pi),find(angle(tooSmallDistX) < 3*pi/2)));
        
        distances = check_dist(x,y,s);
        [tooSmallDistX,tooSmallDistY] = find(distances<=s);
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
            Screen('DrawDots', w, xy, s, white, center,1);  % change 1 to 0 to draw square dots
            %Draw fixation dot
            Screen('FillOval', w, white, fix_cord);	% draw fixation dot (flip erases it)
            Screen('FillOval', w, black, fix_cord2);	% draw fixation dot (flip erases it)
            if i == 1
                start_move = vbl + (waitframes-0.5)*ifi-start_trigger;
            elseif i == nframes
                end_move = vbl + (waitframes-0.5)*ifi-start_trigger;
                %write the output info to the log file
                %write the output info to the log file
                output_list = {int2str(subNo),'','8',num2str(start_trigger,'%.4f'),num2str(start_move,'%.4f'),num2str(end_move,'%.4f'),'','','','','','','','',...
                    '','','','','','','','','',...
                    '','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',int2str(k),'0'};
                for z = 1:length(output_list)
                    fprintf(fid,'%s\t',output_list{z});
                end;
                %jump to the next line in the output file
                fprintf(fid,'%s\n',' ');
            end;
            vbl=Screen('Flip', w, vbl + (waitframes-0.5)*ifi);
            Priority(0);
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

Screen('CloseAll');
end

function distances = check_dist(x,y,s)
distances = zeros(length(x),length(x));
for i = 1:length(x)
    for j = 1:length(y)
        if i < j
            distances(i,j) = sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
        else
            distances(i,j) = 2*s;
        end;
    end;
end;
end