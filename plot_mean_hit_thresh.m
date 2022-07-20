function plot_mean_hit_thresh()

folder = uigetdir('C:\MotoTrak Files\', 'Choose Rat');      % go on the forlder and choose rat
[filepath,name,ext] = fileparts(folder);                                    % take the name of the folder which is the name of the rat

D = dir([folder '\*.mat']);                                                 % take only .mat folder for D

numfich = size(D,1);

hit_thresh = [];
session_trials = nan(numfich,2);

for i = 1:numfich
    load(fullfile(D(i).folder,D(i).name));
    
    hit_thresh = [hit_thresh;trial_table.hit_thresh];
    
    session_trials(i,:) = [i trial_table.Properties.CustomProperties.num_trials];
end

% figure                                                                      % new figure
% plot (hit_thresh,'LineWidth',1 )
% title(name)                                                                 % name of figure
% xlabel('Number of trials')                                                % names of axes
% ylabel('Hit thresh (deg)')
% ylim ([0 80])
% xlim ([0 3500])