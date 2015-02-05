% script for making scaled L figure


% run the model once using the human-scored data (10-second epochs)
directory = 'D:\mrempe\strain_study_data\BL\fig1_file\human_scored\';
[signal_data,state_data,residual,best_S,UppA,LowA,dynamic_range,Timer,Taui,Taud]=PROCESSLBATCHMODE(directory,'lactate','NelderMead');

lactate_state_human_10sec = state_data{1};
lactate_data_10sec = signal_data{1};
lactate_model_human_10sec = best_S{1};
UA_10sec = UppA{1};
LA_10sec = LowA{1};

% run the model again using the machine-scored data (10-sec epochs)
directory = 'D:\mrempe\strain_study_data\BL\fig1_file\machine_scored\';
[signal_data,state_data,residual,best_S,UppA,LowA,dynamic_range,Timer,Taui,Taud]=PROCESSLBATCHMODE(directory,'lactate','NelderMead');

lactate_state_machine_10sec = state_data{1};
%lactate_data_10sec = signal_data;
lactate_model_machine_10sec = best_S{1};

% run the model again using the human-scored data (2-second epochs)
directory = 'D:\mrempe\strain_study_data\2SecondEpochs\BL\human_scored_one_file\';
[signal_data,state_data,residual,best_S,UppA,LowA,dynamic_range,Timer,Taui,Taud]=PROCESSLBATCHMODE(directory,'lactate','NelderMead');

lactate_state_human_2sec = state_data{1};
lactate_data_2sec = signal_data{1};
lactate_model_human_2sec = best_S{1};
UA_2sec = UppA{1};
LA_2sec = LowA{1};

% run the model again using the machine-scored data (2-sec epochs)
directory = 'D:\mrempe\strain_study_data\2SecondEpochs\BL\machine_scored_one_file\';
[signal_data,state_data,residual,best_S,UppA,LowA,dynamic_range,Timer,Taui,Taud]=PROCESSLBATCHMODE(directory,'lactate','NelderMead');

lactate_state_machine_2sec = state_data{1};
%lactate_data_2sec = signal_data;
lactate_model_machine_2sec = best_S{1};

% Now do it all again using delta instead of lactate
% run the model once using the human-scored data (10-second epochs)
directory = 'D:\mrempe\strain_study_data\BL\fig1_file\human_scored\';
[signal_data,state_data,residual,best_S,UppA,LowA,dynamic_range,Timer,Taui,Taud]=PROCESSLBATCHMODE(directory,'delta2','NelderMead');
[t_mdpt_SWS_human_10sec,data_at_SWS_midpoints_human_10sec,t_mdpt_indices_human_10sec]=find_all_SWS_episodes2([state_data{1} signal_data{1}],10);
delta_state_human_10sec = state_data{1};
delta_model_human_10sec = best_S{1};


% run the model again using the machine-scored data (10-sec epochs)
directory = 'D:\mrempe\strain_study_data\BL\fig1_file\machine_scored\';
[signal_data,state_data,residual,best_S,UppA,LowA,dynamic_range,Timer,Taui,Taud]=PROCESSLBATCHMODE(directory,'delta2','NelderMead');
[t_mdpt_SWS_machine_10sec,data_at_SWS_midpoints_machine_10sec,t_mdpt_indices_machine_10sec]=find_all_SWS_episodes2([state_data{1} signal_data{1}],10);
delta_state_machine_10sec = state_data{1};
delta_model_machine_10sec = best_S{1};

% run the model again using the human-scored data (2-second epochs)
directory = 'D:\mrempe\strain_study_data\2SecondEpochs\BL\human_scored_one_file\';
[signal_data,state_data,residual,best_S,UppA,LowA,dynamic_range,Timer,Taui,Taud]=PROCESSLBATCHMODE(directory,'delta2','NelderMead');
[t_mdpt_SWS_human_2sec,data_at_SWS_midpoints_human_2sec,t_mdpt_indices_human_2sec]=find_all_SWS_episodes2([state_data{1} signal_data{1}],2);
delta_state_human_2sec = state_data{1};
delta_model_human_2sec = best_S{1};


% run the model again using the machine-scored data (2-sec epochs)
directory = 'D:\mrempe\strain_study_data\2SecondEpochs\BL\machine_scored_one_file\';
[signal_data,state_data,residual,best_S,UppA,LowA,dynamic_range,Timer,Taui,Taud]=PROCESSLBATCHMODE(directory,'delta2','NelderMead');
[t_mdpt_SWS_machine_2sec,data_at_SWS_midpoints_machine_2sec,t_mdpt_indices_machine_2sec]=find_all_SWS_episodes2([state_data{1} signal_data{1}],2);

delta_state_machine_2sec = state_data{1};
delta_model_machine_2sec = best_S{1};



figure

% Panel A, lactate human-scored 10-sec epochs
dt=1/(60*60/10); 
t=0:dt:dt*(size(lactate_data_10sec,1)-1);
tS_10sec=t((4/2)*(60*60/10)+1:end-(4/2)*(60*60/10));
L_indices = (4/2)*(60*60/10)+1:length(t)-(4/2)*(60*60/10);
only_sleep_indices = find(lactate_state_human_10sec(L_indices)==1);
only_wake_indices  = find(lactate_state_human_10sec(L_indices)==0);
only_rem_indices   = find(lactate_state_human_10sec(L_indices)==2);
scaled_lactate_data_10sec = ((UA_10sec-LA_10sec)-(UA_10sec-lactate_data_10sec(L_indices)'))./(UA_10sec-LA_10sec);
sleep_lactate      = scaled_lactate_data_10sec(only_sleep_indices);
wake_lactate       = scaled_lactate_data_10sec(only_wake_indices);
rem_lactate        = scaled_lactate_data_10sec(only_rem_indices);

%make the scatterplot of lactate data (color-coded for sleep state)
subplot(4,2,1)
scatter(tS_10sec(only_wake_indices),wake_lactate,25,'r')
hold on
scatter(tS_10sec(only_sleep_indices),sleep_lactate,25,'k')
scatter(tS_10sec(only_rem_indices),rem_lactate,25,'c')

% overlay the plot of the model

plot(tS_10sec,lactate_model_human_10sec,'b','LineWidth',1.5)
hold off
xlabel('TIME [h]')
ylabel('LACTATE (SCALED)')
axis([14 18.8 -0.1 1.1 ])


% Panel B, machine-scored 10-sec epochs
dt=1/(60*60/10); 
t=0:dt:dt*(size(lactate_data_10sec,1)-1);
tS_10sec=t((4/2)*(60*60/10)+1:end-(4/2)*(60*60/10));
L_indices = (4/2)*(60*60/10)+1:length(t)-(4/2)*(60*60/10);
only_sleep_indices = find(lactate_state_machine_10sec(L_indices)==1);
only_wake_indices  = find(lactate_state_machine_10sec(L_indices)==0);
only_rem_indices   = find(lactate_state_machine_10sec(L_indices)==2);
scaled_lactate_data_10sec = ((UA_10sec-LA_10sec)-(UA_10sec-lactate_data_10sec(L_indices)'))./(UA_10sec-LA_10sec);
sleep_lactate      = scaled_lactate_data_10sec(only_sleep_indices);
wake_lactate       = scaled_lactate_data_10sec(only_wake_indices);
rem_lactate        = scaled_lactate_data_10sec(only_rem_indices);

%make the scatterplot of lactate data (color-coded for sleep state)
subplot(4,2,2)
scatter(tS_10sec(only_wake_indices),wake_lactate,25,'r')
hold on
scatter(tS_10sec(only_sleep_indices),sleep_lactate,25,'k')
scatter(tS_10sec(only_rem_indices),rem_lactate,25,'c')

% overlay the plot of the model

plot(tS_10sec,lactate_model_machine_10sec,'b','LineWidth',1.5)
hold off
xlabel('TIME [h]')
ylabel('LACTATE (SCALED)')
axis([14 18.8 -0.1 1.1 ])



% Panel C, human-scored 2-sec epochs
dt=1/(60*60/2); 
t=0:dt:dt*(size(lactate_data_2sec,1)-1);
tS_2sec=t((4/2)*(60*60/2)+1:end-(4/2)*(60*60/2));
L_indices = (4/2)*(60*60/2)+1:length(t)-(4/2)*(60*60/2);
only_sleep_indices = find(lactate_state_human_2sec(L_indices)==1);
only_wake_indices  = find(lactate_state_human_2sec(L_indices)==0);
only_rem_indices   = find(lactate_state_human_2sec(L_indices)==2);
scaled_lactate_data_2sec = ((UA_2sec-LA_2sec)-(UA_2sec-lactate_data_2sec(L_indices)'))./(UA_2sec-LA_2sec);
sleep_lactate      = scaled_lactate_data_2sec(only_sleep_indices);
wake_lactate       = scaled_lactate_data_2sec(only_wake_indices);
rem_lactate        = scaled_lactate_data_2sec(only_rem_indices);

%make the scatterplot of lactate data (color-coded for sleep state)
subplot(4,2,3)
scatter(tS_2sec(only_wake_indices),wake_lactate,25,'r')
hold on
scatter(tS_2sec(only_sleep_indices),sleep_lactate,25,'k')
scatter(tS_2sec(only_rem_indices),rem_lactate,25,'c')

% overlay the plot of the model

plot(tS_2sec,lactate_model_human_2sec,'b','LineWidth',1.5)
hold off
xlabel('TIME [h]')
ylabel('LACTATE (SCALED)')
axis([14 18.8 -0.1 1.1 ])



% Panel D, machine-scored 2-sec epochs
dt=1/(60*60/2); 
t=0:dt:dt*(size(lactate_data_2sec,1)-1);
tS_2sec=t((4/2)*(60*60/2)+1:end-(4/2)*(60*60/2));
L_indices = (4/2)*(60*60/2)+1:length(t)-(4/2)*(60*60/2);
only_sleep_indices = find(lactate_state_machine_2sec(L_indices)==1);
only_wake_indices  = find(lactate_state_machine_2sec(L_indices)==0);
only_rem_indices   = find(lactate_state_machine_2sec(L_indices)==2);
scaled_lactate_data_2sec = ((UA_2sec-LA_2sec)-(UA_2sec-lactate_data_2sec(L_indices)'))./(UA_2sec-LA_2sec);
sleep_lactate      = scaled_lactate_data_2sec(only_sleep_indices);
wake_lactate       = scaled_lactate_data_2sec(only_wake_indices);
rem_lactate        = scaled_lactate_data_2sec(only_rem_indices);

%make the scatterplot of lactate data (color-coded for sleep state)
subplot(4,2,4)
scatter(tS_2sec(only_wake_indices),wake_lactate,25,'r')
hold on
scatter(tS_2sec(only_sleep_indices),sleep_lactate,25,'k')
scatter(tS_2sec(only_rem_indices),rem_lactate,25,'c')

% overlay the plot of the model

plot(tS_2sec,lactate_model_machine_2sec,'b','LineWidth',1.5)
hold off
xlabel('TIME [h]')
ylabel('LACTATE (SCALED)')
axis([14 18.8 -0.1 1.1 ])


%% ---------------------------------------------------------------------------------------------------------
%  Now do it all over again using delta power instead of lactate
% ----------------------------------------------------------------------------------------------------------

% Panel E, human-scored 10-sec epochs
dt=1/(60*60/10); 
t=0:dt:dt*(size(delta_state_human_10sec,1)-1);

%make the scatterplot of EEG delta data 
subplot(4,2,5)
plot(t_mdpt_SWS_human_10sec,data_at_SWS_midpoints_human_10sec,'go')
  hold on
  plot(t,delta_model_human_10sec,'b','LineWidth',1.5)
  ylabel('Delta power')
  xlabel('Time (hours)')
hold off
axis([0 45 2000 6000 ])


% Panel F, machine-scored 10-sec epochs
subplot(4,2,6)
plot(t_mdpt_SWS_machine_10sec,data_at_SWS_midpoints_machine_10sec,'go')
  hold on
  plot(t,delta_model_machine_10sec,'b','LineWidth',1.5)
  ylabel('Delta power')
  xlabel('Time (hours)')
hold off
axis([0 45 2000 6000 ])


% % Panel G, delta human-scored 2-sec epochs
subplot(4,2,7)
dt=1/(60*60/2); 
t2=0:dt:dt*(length(delta_model_human_2sec)-1);


plot(t_mdpt_SWS_human_2sec,data_at_SWS_midpoints_human_2sec,'go')
  hold on
  plot(t2,delta_model_human_2sec,'b','LineWidth',1.5)
  ylabel('Delta power')
  xlabel('Time (hours)')
hold off
axis([0 45 2000 6000 ])



% % Panel H, delta machine-scored 2-sec epochs
subplot(4,2,8)
plot(t_mdpt_SWS_machine_2sec,data_at_SWS_midpoints_machine_2sec,'go')
  hold on
  plot(t2,delta_model_machine_2sec,'b','LineWidth',1.5)
  ylabel('Delta power')
  xlabel('Time (hours)')
hold off
axis([0 45 2000 6000 ])

%savefig('scaled_lactate_fig_8panels')