function plot_mean_hit_thresh = plot_mean_hit_thresh ()

prompt = {'Enter number of rat:','Plot title:'};
dlgtitle = 'Input';
dims = [1 50];
answer = inputdlg(prompt)


user_val = str2num(answer{1});
title_val = (answer{2});

for j =1:user_val

folder = uigetdir('C:\MotoTrak Files\', 'Choose Rat');      % go on the forlder and choose rat
[filepath,name,ext] = fileparts(folder);                                    % take the name of the folder which is the name of the rat

D = dir([folder '\*.mat']);

numfich(j) = size(D,1);

hit_thresh = [];
%session_trials = nan(numfich,2);
filename = ([folder filesep num2str(name) '_global_stats.mat'])


    if exist(filename)
        numfich = numfich-1    
    end

for i = 1:numfich
    load(fullfile(D(i).folder,D(i).name));
    
    hit_thresh = [hit_thresh;trial_table.hit_thresh];
    
    session_trials(i,:) = [i trial_table.Properties.CustomProperties.num_trials];
    
    mean_hit_thresh_session(i) = (mean(hit_thresh));
    
end
mean_hit_thresh_rat(j) =(mean(mean_hit_thresh_session));
end
 figure                                                                      % new figure
 plot (mean_hit_thresh_rat,'LineWidth',1 )
 title(title_val)                                                                 % name of figure
 xlabel('Number of trials')                                                % names of axes
 ylabel('Hit thresh (deg)')
 %ylim ([0 80])
 %xlim ([0 3500])
