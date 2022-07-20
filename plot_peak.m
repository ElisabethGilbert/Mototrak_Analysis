function peak = plot_peak()


folder = uigetdir('C:\MotoTrak Files\', 'Choose Rat');
[filepath,name] = fileparts(folder);


D = dir([folder '\*.mat']);

numfich = size(D,1);

peak = nan(numfich,1);


for i = 15
    load(fullfile(D(i).folder,D(i).name));

    initial_peak = trial_table.peak; 

    T0= size(trial_table,1);
end

for i= numfich
    load(fullfile(D(i).folder,D(i).name));

    last_peak = trial_table.peak;

    Tf= size(trial_table,1);

end

          
    figure 
    plot(initial_peak,'LineWidth',0.5 )
    hold on
    plot(last_peak,'LineWidth',1 )
    title(name)
    xlabel('Number of trials')
    ylabel('peak angle (deg)')
    ylim([0 130])
    legend('session 15','session')

if T0<Tf
    xlim([0 Tf])

else xlim([0 T0])

end    

   end