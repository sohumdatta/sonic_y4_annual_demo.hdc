%% plot_complete_data.m: plot the raw and filtered values from the most recent EMG device dump

clear all; close all; clc;

DATA_DIR = '~/sonic_y4_annual_demo/run/latest_emg_data.txt';

%%% NOTE: discard the first line/row always!
raw_data = load(DATA_DIR);
raw_data = raw_data([2:(size(raw_data, 1) - 1)], :);

num_data = size(raw_data,1);
xrange = 1:num_data;
yrange = [-10000 , 10000];

channel = raw_data(:, [4:7])';
filtered_channel = raw_data(:, [8:11])';

figure

subplot(4,2,1)
h1_raw = plot(xrange, channel(1,:)); title('Channel 1');
ylim(yrange);

subplot(4,2,2)
h1 = plot(xrange, filtered_channel(1,:)); title('Filtered 1');
ylim(yrange);


subplot(4,2,3)
h2_raw = plot(xrange, channel(2,:)); title('Channel 2');
ylim(yrange);

subplot(4,2,4)
h2 = plot(xrange, filtered_channel(2,:)); title('Filtered 2');
ylim(yrange);


subplot(4,2,5)
h3_raw = plot(xrange, channel(3,:)); title('Channel 3');
ylim(yrange);

subplot(4,2,6)
h3 = plot(xrange, filtered_channel(3,:)); title('Filtered 3');
ylim(yrange);


subplot(4,2,7)
h4_raw = plot(xrange, channel(4,:)); title('Channel 4');
ylim(yrange);

subplot(4,2,8)
h4 = plot(xrange, filtered_channel(4,:)); title('Filtered 4');
ylim(yrange);
