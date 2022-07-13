function mean_peak = plot_mean_peak()

% D = dir('C:\Users\ethie\OneDrive\Documents\temp_data\170\');

folder = uigetdir('C:\MotoTrak Files\', 'Choose Rat');      % go on the forlder and choose rat
[filepath,name,ext] = fileparts(folder);                                    % take the name of the folder which is the name of the rat

D = dir([folder '\*.mat']);                                                 % take only .mat folder for D

numfich = size(D,1);                                                        %  

mean_peak = nan(numfich,1);                                                 % 

for i = 1:numfich
    load(fullfile(D(i).folder,D(i).name));
    
    mean_peak(i) = trial_table.Properties.CustomProperties.mean_peak;       % permet de recuperer le mean peak dans les custom properties
end

figure                                                                      % new figure
plot (mean_peak,'LineWidth',1.5 )
title(name)                                                                 % name of figure
xlabel('Number of sessions')                                                % names of axes
ylabel('Mean peak angle (deg)')
ylim ([0 120])
xlim ([0 45])


% 
% %T.Properties.RowNames = T.name;
% %T.name = [];
% B=T(:,1)
% load(D.name(i));
% %mean_angle = trial_table.Properties.CustomProperties.mean_peak;

%file = D.name
%data = load(strcat(D,D.name(i)));