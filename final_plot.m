function mean_peak = final_plot()

% D = dir('C:\Users\ethie\OneDrive\Documents\temp_data\170\');

folder = uigetdir('C:\Users\ethie\OneDrive\Documents\temp_data', 'Choose Rat');      % go on the forlder and choose rat
[filepath,name,ext] = fileparts(folder);                                    % take the name of the folder which is the name of the rat

D = dir([folder '\*.mat']);                                                 % take only .mat folder for D

numfich = size(D,1);                                                        %  

mean_peak = nan(numfich,1);                                                 % 

for i = 1:numfich
    load(fullfile(D(i).folder,D(i).name));
    
    mean_peak(i) = trial_table.Properties.CustomProperties.mean_peak;       % permet de recuperer le mean peak dans les custom properties
end


D = dir([folder '\*.mat']);

numfich = size(D,1);

for i = 1:numfich
    load(fullfile(D(i).folder,D(i).name));

    num_rewards(i) = trial_table.Properties.CustomProperties.num_rewards;
    num_trials(i)= trial_table.Properties.CustomProperties.num_trials;
    final_success_rate(i) = (num_rewards(i)/num_trials(i))*100


end


for i = 1
    load(fullfile(D(i).folder,D(i).name));

    initial_peak = trial_table.peak; 

    T0= size(trial_table,1);
end

for i= numfich
    load(fullfile(D(i).folder,D(i).name));

    last_peak = trial_table.peak;

    Tf= size(trial_table,1);

end   


subplot(2,3,1), plot(mean_peak,'LineWidth',1.5 )                                                               % name of figure
xlabel('Number of sessions')                                                % names of axes
ylabel('Mean peak angle (deg)')
ylim ([0 80])
subplot(2,3,2), plot(final_success_rate,'LineWidth',1.5 )
xlabel('Number of sessions')
ylabel('success rate (%)')
ylim([30 100])
subplot(2,3,3), plot(initial_peak,'LineWidth',0.5 )
hold on
plot(last_peak,'LineWidth',1 )
xlabel('Number of trials')
ylabel('peak angle (deg)')
ylim([0 130])
legend('15',num2str(numfich))
title(legend,'Session number')
annotation('textbox', [0.5, 0.9, 0.1, 0.1], 'String', name)

if T0<Tf
    xlim([0 Tf])

else xlim([0 T0])

end 

