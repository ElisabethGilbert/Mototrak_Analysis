function mean_of_mean_peak = plot_mean_of_mean_peak()

 prompt = {'Enter number of rats:','Plot title:'};
 dlgtitle = 'Input';
 dims = [1 50];
 answer = inputdlg(prompt)
 
 
user_val = str2num(answer{1});
title_val = (answer{2});

for j =1:user_val

% D = dir('C:\Users\ethie\OneDrive\Documents\temp_data\170\');

folder = uigetdir('C:\MotoTrak Files\', 'Choose Rat');      % go on the forlder and choose rat
[filepath,name,ext] = fileparts(folder);                                    % take the name of the folder which is the name of the rat

D = dir([folder '\*.mat']);                                                 % take only .mat folder for D

numfich = size(D,1);                                                        %  

mean_peak = nan(numfich,1);                                                 % 

for i = 1:numfich
    load(fullfile(D(i).folder,D(i).name));
    
    mean_peak(i) = trial_table.Properties.CustomProperties.mean_peak;       % permet de recuperer le mean peak dans les custom properties

    mean_of_mean_peak_session(i) = mean(mean_peak,'omitnan');
    mean_of_mean_peak_rat(i,j) = (mean(mean_of_mean_peak_session(i)));


     end
     final_mean = mean(mean_of_mean_peak_rat,2);

end

figure                                                                      % new figure
plot (mean_peak,'LineWidth',1.5 )
title(title_val)                                                                 % name of figure
xlabel('Number of sessions')                                                % names of axes
ylabel('Mean peak angle (deg)')
ylim ([0 120])
xlim ([0 45])