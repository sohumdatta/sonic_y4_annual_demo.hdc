%% plot_channels.m: plot the filtered values from the EMG setup device
clear all; clc; close all; 

NUM_SAMPLES = 1000;  % the sliding window of samples shown
DELAY = 0.005;   % delay between samples drawn in seconds, MUST be >= 0.05

GET_SAMPLE_DIR = '~/sonic_y4_annual_demo/asl/bluetooth/';
path(path, GET_SAMPLE_DIR);   %setup new path 


xrange = 1:NUM_SAMPLES;
yrange = [-3000 , 3000];

channel = zeros(4, NUM_SAMPLES);
channel_raw = zeros(4, NUM_SAMPLES);

val_dump = zeros(5,1);


figure

%%%% Beginnning  of Plot lines

%clf 
subplot(4,2,1)
h1_raw = plot(xrange, channel_raw(1,:)); title('Channel 1');
ylim(yrange);

subplot(4,2,2)
h1 = plot(xrange, channel(1,:)); title('Filtered 1');
ylim(yrange);


subplot(4,2,3)
h2_raw = plot(xrange, channel_raw(2,:)); title('Channel 2');
ylim(yrange);

subplot(4,2,4)
h2 = plot(xrange, channel(2,:)); title('Filtered 2');
ylim(yrange);


subplot(4,2,5)
h3_raw = plot(xrange, channel_raw(3,:)); title('Channel 3');
ylim(yrange);

subplot(4,2,6)
h3 = plot(xrange, channel(3,:)); title('Filtered 3');
ylim(yrange);


subplot(4,2,7)
h4_raw = plot(xrange, channel_raw(4,:)); title('Channel 4');
ylim(yrange);

subplot(4,2,8)
h4 = plot(xrange, channel(4,:)); title('Filtered 4');
ylim(yrange);

%drawnow limitrate nocallbacks    

%%%% End of Plot lines

h1.YDataSource = 'chn1';
h2.YDataSource = 'chn2';
h3.YDataSource = 'chn3';
h4.YDataSource = 'chn4';

h1_raw.YDataSource = 'chn1_raw';
h2_raw.YDataSource = 'chn2_raw';
h3_raw.YDataSource = 'chn3_raw';
h4_raw.YDataSource = 'chn4_raw';

iter = 1;
while (1)
%    for i = xrange
    [sec, ms, usec, ch, ch_raw] = get_sample;

    val_dump = [val_dump, [iter; ch']];
    iter = iter + 1;

    channel = [channel(:, 2:NUM_SAMPLES), ch'];
    channel_raw = [channel_raw(:, 2:NUM_SAMPLES), ch_raw'];

    chn1 = channel(1,:);
    chn2 = channel(2,:);
    chn3 = channel(3,:);
    chn4 = channel(4,:);

    chn1_raw = channel_raw(1,:);
    chn2_raw = channel_raw(2,:);
    chn3_raw = channel_raw(3,:);
    chn4_raw = channel_raw(4,:);



    refreshdata

    pause(DELAY);    %% pause >= 50 ms; VERY IMPORTANY for get_sample to work
%    end     %for
    
end %while
