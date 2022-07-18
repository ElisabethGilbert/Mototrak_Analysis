function count_angle_peaks()

MPH = 5;
MPP = 10;
MPD = 0.2;

num_trials = trial_table.Properties.CustomProperties.num_trials;
num_trials = size(trial_table,1);

PKS = cell(num_trials,1);
LOCS = cell(num_trials,1);
num_peaks = zeros(num_trials,1);
trial_table.numpeaks = nan(num_trials,1);

for i = 1:num_trials
    [PKS{i},LOCS{i}] = findpeaks(trial_table.angle{i,1}(:,2),trial_table.angle{i,1}(:,1),'MinPeakHeight',MPH,'MinPeakProminence',MPP,'MinPeakDistance',MPD);
    trial_table.numpeaks(i) = size(PKS(LOCS{i}>0),1); % count number of peaks after trial onset
end


%% test looking at angle signal

figure;
for i = 1:num_trials
    plot(trial_table.angle{i,1}(:,1),trial_table.angle{i,1}(:,2));
    title(sprintf('essai #%d',i));
    pause;
end
 
%% erase last row

if isempty(trial_table.angle{end,1})
    trial_table = trial_table(1:end-1,:);
end

%% average for successful trials
num_peaks_succ = mean(trial_table.numpeaks(trial_table.success));