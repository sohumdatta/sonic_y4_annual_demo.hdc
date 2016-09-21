%% plot_channels.m: plot the filtered values from the EMG setup device
clear all; clc; close all; 

NUM_SAMPLES = 1000;  % the sliding window of samples shown
DELAY = 0.005;   % delay between samples drawn in seconds, MUST be >= 0.05

GET_SAMPLE_DIR = '~/sonic_y4_annual_demo/bluetooth/';
path(path, GET_SAMPLE_DIR);   %setup new path 


xrange = 1:NUM_SAMPLES;
yrange = [-3000 , 3000];
channel = zeros(4, NUM_SAMPLES);

val_dump = zeros(5,1);

figure

%%%% Beginnning  of Plot lines

%clf 
subplot(4,1,1)
h1 = plot(xrange, channel(1,:)); title('Filtered 1');
ylim(yrange);

subplot(4,1,2)
h2 = plot(xrange, channel(2,:)); title('Filtered 2');
ylim(yrange);

subplot(4,1,3)
h3 = plot(xrange, channel(3,:)); title('Filtered 3');
ylim(yrange);

subplot(4,1,4)
h4 = plot(xrange, channel(4,:)); title('Filtered 4');
ylim(yrange);
%drawnow limitrate nocallbacks    

%%%% End of Plot lines

h1.YDataSource = 'chn1';
h2.YDataSource = 'chn2';
h3.YDataSource = 'chn3';
h4.YDataSource = 'chn4';

iter = 1;
while (1)
%    for i = xrange
    [sec, ms, usec, ch] = get_sample;

    val_dump = [val_dump, [iter; ch']];
    iter = iter + 1;

    channel = [channel(:, 2:NUM_SAMPLES), ch'];
    chn1 = channel(1,:);
    chn2 = channel(2,:);
    chn3 = channel(3,:);
    chn4 = channel(4,:);
    refreshdata

    pause(DELAY);    %% pause >= 50 ms; VERY IMPORTANY for get_sample to work
%    end     %for
    
end %while
