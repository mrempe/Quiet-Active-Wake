% script to sun PROCESSLBATCHMODE on whisking data


% directory where files are saved
directory='\\FS1\WisorData\Gronli\Stat_Analyses\NEW_incl_beta_gamma_Sleep_Report_Txt_Output_112514\Txt_files\Michael\';

% set up a cell array containing the list of filenames
files = dir(strcat(directory,'*.txt'));


% Turn off the creating of new figures
%set(0,'DefaultFigureVisible','off')
% -------------------------- Compute all the tau values and residuals -----------------
% -------------------------------------------------------------------------------------
% baseline (5.5-8 hours)
[signal_data,state_data,residuals_EEG1_baseline,best_S,UppA,LowA,dynamic_range,Timer,Taui_EEG1_baseline,Taud_EEG1_baseline]=PROCESSLBATCHMODE(directory,'EEG1','NelderMead','none',[5.5 8]);
[signal_data,state_data,residuals_EEG2_baseline,best_S,UppA,LowA,dynamic_range,Timer,Taui_EEG2_baseline,Taud_EEG2_baseline]=PROCESSLBATCHMODE(directory,'EEG2','NelderMead','none',[5.5 8]);
[signal_data,state_data,residuals_lactate_baseline,best_S,UppA,LowA,dynamic_range,Timer,Taui_lactate_baseline,Taud_lactate_baseline]=PROCESSLBATCHMODE(directory,'lactate','NelderMead','none',[5.5 8]);

% acute sleep recovery (29.5-32 hours)
[signal_data,state_data,residuals_EEG1_recovery,best_S,UppA,LowA,dynamic_range,Timer,Taui_EEG1_recovery,Taud_EEG1_recovery]=PROCESSLBATCHMODE(directory,'EEG1','NelderMead','none',[29.5 32]);
[signal_data,state_data,residuals_EEG2_recovery,best_S,UppA,LowA,dynamic_range,Timer,Taui_EEG2_recovery,Taud_EEG2_recovery]=PROCESSLBATCHMODE(directory,'EEG2','NelderMead','none',[29.5 32]);
[signal_data,state_data,residuals_lactate_recovery,best_S,UppA,LowA,dynamic_range,Timer,Taui_lactate_recovery,Taud_lactate_recovery]=PROCESSLBATCHMODE(directory,'lactate','NelderMead','none',[29.5 32]);


% Set up cell array to store column headers
A=cell(1,19);
A{1,1} = 'Recording Name';
% baseline
A{1,1} = 'Taui EEG1 baseline';
A{1,2} = 'Taud EEG1 baseline';
A{1,3} = 'Taui EEG2 baseline';
A{1,4} = 'Taud EEG2 baseline';
A{1,5} = 'Taui lactate baseline';
A{1,6} = 'Taud lactate baseline';
A{1,7} = 'Residuals EEG1 baseline';
A{1,8} = 'Residuals EEG2 baseline';
A{1,9} = 'Residuals lactate baseline';

% recovery
A{1,10} = 'Taui EEG1 recovery';
A{1,11} = 'Taud EEG1 recovery';
A{1,12} = 'Taui EEG2 recovery';
A{1,13} = 'Taud EEG2 recovery';
A{1,14} = 'Taui lactate recovery';
A{1,15} = 'Taud lactate recovery';
A{1,16} = 'Residuals EEG1 recovery';
A{1,17} = 'Residuals EEG2 recovery';
A{1,18} = 'Residuals lactate recovery';


% Start writing to excel file
disp('Starting to write to excel file')
[status,message] = xlswrite('whisking_simulation_output2.xls',A);
G = struct2cell(files);
[status,message] = xlswrite('whisking_simulation_output2.xls',G(1,:)',1,'A2');
[status,message] = xlswrite('whisking_simulation_output2.xls',Taui_EEG1_baseline',1,'B2');
[status,message] = xlswrite('whisking_simulation_output2.xls',Taud_EEG1_baseline',1,'C2');
[status,message] = xlswrite('whisking_simulation_output2.xls',Taui_EEG2_baseline',1,'D2');
[status,message] = xlswrite('whisking_simulation_output2.xls',Taud_EEG2_baseline',1,'E2');
[status,message] = xlswrite('whisking_simulation_output2.xls',Taui_lactate_baseline',1,'F2');
[status,message] = xlswrite('whisking_simulation_output2.xls',Taud_lactate_baseline',1,'G2');
[status,message] = xlswrite('whisking_simulation_output2.xls',residuals_EEG1_baseline',1,'H2');
[status,message] = xlswrite('whisking_simulation_output2.xls',residuals_EEG2_baseline',1,'I2');
[status,message] = xlswrite('whisking_simulation_output2.xls',residuals_lactate_baseline',1,'J2');


[status,message] = xlswrite('whisking_simulation_output2.xls',Taui_EEG1_recovery',1,'K2');
[status,message] = xlswrite('whisking_simulation_output2.xls',Taud_EEG1_recovery',1,'L2');
[status,message] = xlswrite('whisking_simulation_output2.xls',Taui_EEG2_recovery',1,'M2');
[status,message] = xlswrite('whisking_simulation_output2.xls',Taud_EEG2_recovery',1,'N2');
[status,message] = xlswrite('whisking_simulation_output2.xls',Taui_lactate_recovery',1,'O2');
[status,message] = xlswrite('whisking_simulation_output2.xls',Taud_lactate_recovery',1,'P2');
[status,message] = xlswrite('whisking_simulation_output2.xls',residuals_EEG1_recovery',1,'Q2');
[status,message] = xlswrite('whisking_simulation_output2.xls',residuals_EEG2_recovery',1,'R2');
[status,message] = xlswrite('whisking_simulation_output2.xls',residuals_lactate_recovery',1,'S2');


