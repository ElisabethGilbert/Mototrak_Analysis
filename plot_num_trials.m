function num_trials = plot_num_trials()

% D = dir('C:\Users\ethie\OneDrive\Documents\temp_data\170\');

folder = uigetdir('C:\MotoTrak Files\', 'Choose Rat');      % go on the forlder and choose rat
[filepath,name,ext] = fileparts(folder);                                    % take the name of the folder which is the name of the rat

D = dir([folder '\*.mat']);                                                 % take only .mat folder for D

numfich = size(D,1);                                                        %  

num_trials = nan(numfich,1);                                                 % 

for i = 1:numfich
    load(fullfile(D(i).folder,D(i).name));
    
    num_trials(i) = trial_table.Properties.CustomProperties.num_trials;       % permet de recuperer le mean peak dans les custom properties
end

figure                                                                      % new figure
plot (num_trials,'LineWidth',1.5 )
title(name)                                                                 % name of figure
xlabel('Number of sessions')                                                % names of axes
ylabel('Number of trials')
ylim ([0 200])
xlim ([0 45])