%%%
%%%  Create subplot of all time and frequency domain plots across all axes
%%%  of inputted motion data
%%%

function plot_exploratory(filenames)
    
    r = 3; % Specify number of rows in subplot
    c = 6; % Specify number of columns in subplot

    for i = 1:length(filenames)

        [accel_x, accel_y, accel_z] = read_data( ...
            strcat('data/test/', filenames{i}));

        accel_x = filter_time(accel_x);
        % accel_y = filter_time(accel_y);
        accel_y = accel_y(30:150,:);
        accel_z = filter_time(accel_z);

        %subplot(r, c, c*(i-1)+1);
        %hold on;
        figure()
        plot(accel_x)
        xlabel('Time (1/20 seconds)')
        ylabel('Acceleration (m/s^2)')
        title('X Axis Acceleration over Time');

        %subplot(r, c, c*(i-1)+2);
        %hold on;
        figure()
        plot(accel_y, 'r')
        xlabel('Time (1/20 seconds)')
        ylabel('Acceleration (m/s^2)')
        title('Unfiltered Y Axis Acceleration over Time');

%         subplot(r, c, c*(i-1)+3);
%         hold on;
%         plot(accel_z)
%         title('Time Domain (z)');

        %subplot(r, c, c*(i-1)+4);
        %hold on;
        figure()
        [frequencies_shift, y_shift] = find_fft(accel_x);
        [y_filter] = filter_freq(y_shift);
        stem(frequencies_shift, y_filter);
        xlabel('Frequency (rad/sample)')
        ylabel('Amplitude (m/s^2)')
        title('Frequencies Present in X Acceleration Data');

        %subplot(r, c, c*(i-1)+5);
        %hold on;
        figure()
        [frequencies_shift, y_shift] = find_fft(accel_y);
        %[y_filter] = filter_freq(y_shift);
        stem(frequencies_shift, y_shift, 'r');
        xlabel('Frequency (rad/sample)')
        ylabel('Amplitude (m/s^2)')
        title('Frequencies Present in Unfiltered Y Acceleration Data');

%         subplot(r, c, c*(i-1)+6);
%         hold on;
%         [frequencies_shift, y_shift] = find_fft(accel_z);
%         [y_filter] = filter_freq(y_shift);
%         stem(frequencies_shift, y_filter);
%         title('Frequency Domain (z)');

    end
    
end


