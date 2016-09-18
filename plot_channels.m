%% plot_channels.m: plot the filtered values from the EMG setup device
function [h1, h2, h3, h4] = plot_channels(NUM_SAMPLES, DELAY);
	GET_SAMPLE_DIR = '~/sonic_y4_annual_demo/bluetooth/';
	path(path, GET_SAMPLE_DIR);   %setup new path 

	xrange = 1:NUM_SAMPLES;
	yrange = [-10000 , 10000];
	channel = zeros(4, length(xrange));
	chn1 = channel(1,:);
	chn2 = channel(2,:);
	chn3 = channel(3,:);
	chn4 = channel(4,:);

	val_dump = zeros(5,1);

	figure

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

end %function
