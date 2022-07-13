function success = plot_success()


folder = uigetdir('C:\MotoTrak Files\', 'Choose Rat');
[filepath,name] = fileparts(folder);


D = dir([folder '\*.mat']);

numfich = size(D,1);
%rate=0;

for i = 1:numfich
    load(fullfile(D(i).folder,D(i).name));

    num_rewards(i) = trial_table.Properties.CustomProperties.num_rewards;
    num_trials(i)= trial_table.Properties.CustomProperties.num_trials;
    final_success_rate(i) = (num_rewards(i)/num_trials(i))*100

   % 

  %  for i= 1:T

     % if trial_table.success(i) == 1
           % rate = rate+1;

         

      %end
   end

  %   final_success_rate = (rate/T)*100

      figure
      plot(final_success_rate,'LineWidth',1.5 )
      title(name)
      xlabel('Number of sessions')
      ylabel('success rate (%)')
      ylim([30 100])
      xlim([0 45])
end