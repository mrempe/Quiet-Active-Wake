% script to sun PROCESSLBATCHMODE on whisking data


% directory where files are saved
directory='\\FS1\WisorData\Gronli\Stat_Analyses\NEW_incl_beta_gamma_Sleep_Report_Txt_Output_112514\Txt_files\Michael\';

% set up a cell array containing the list of filenames
files = dir(strcat(directory,'*.txt'));


% Turn off the creating of new figures
set(0,'DefaultFigureVisible','off')
% -------------------------- Compute all the tau values and residuals -----------------
% -------------------------------------------------------------------------------------
% entire recording
[signal_data,state_data,residuals_EEG1_entire,best_S,UppA,LowA,dynamic_range,Timer,Taui_EEG1_entire,Taud_EEG1_entire]=PROCESSLBATCHMODE(directory,'EEG1','NelderMead');
[signal_data,state_data,residuals_EEG2_entire,best_S,UppA,LowA,dynamic_range,Timer,Taui_EEG2_entire,Taud_EEG2_entire]=PROCESSLBATCHMODE(directory,'EEG2','NelderMead');
[signal_data,state_data,residuals_lactate_entire,best_S,UppA,LowA,dynamic_range,Timer,Taui_lactate_entire,Taud_lactate_entire]=PROCESSLBATCHMODE(directory,'lactate','NelderMead');

% baseline
[signal_data,state_data,residuals_EEG1_baseline,best_S,UppA,LowA,dynamic_range,Timer,Taui_EEG1_baseline,Taud_EEG1_baseline]=PROCESSLBATCHMODE(directory,'EEG1','NelderMead','none',[0 24]);
[signal_data,state_data,residuals_EEG2_baseline,best_S,UppA,LowA,dynamic_range,Timer,Taui_EEG2_baseline,Taud_EEG2_baseline]=PROCESSLBATCHMODE(directory,'EEG2','NelderMead','none',[0 24]);
[signal_data,state_data,residuals_lactate_baseline,best_S,UppA,LowA,dynamic_range,Timer,Taui_lactate_baseline,Taud_lactate_baseline]=PROCESSLBATCHMODE(directory,'lactate','NelderMead','none',[0 24]);

% whisking
% [signal_data,state_data,residuals_EEG1_whisking,best_S,UppA,LowA,dynamic_range,Timer,Taui_EEG1_whisking,Taud_EEG1_whisking]=PROCESSLBATCHMODE(directory,'EEG1','NelderMead','none',[24 30]);
% [signal_data,state_data,residuals_EEG2_whisking,best_S,UppA,LowA,dynamic_range,Timer,Taui_EEG2_whisking,Taud_EEG2_whisking]=PROCESSLBATCHMODE(directory,'EEG2','NelderMead','none',[24 30]);
% [signal_data,state_data,residuals_lactate_whisking,best_S,UppA,LowA,dynamic_range,Timer,Taui_lactate_whisking,Taud_lactate_whisking]=PROCESSLBATCHMODE(directory,'lactate','NelderMead','none',[24 30]);

% recovery
[signal_data,state_data,residuals_EEG1_recovery,best_S,UppA,LowA,dynamic_range,Timer,Taui_EEG1_recovery,Taud_EEG1_recovery]=PROCESSLBATCHMODE(directory,'EEG1','NelderMead','none',[29.5 48]);
[signal_data,state_data,residuals_EEG2_recovery,best_S,UppA,LowA,dynamic_range,Timer,Taui_EEG2_recovery,Taud_EEG2_recovery]=PROCESSLBATCHMODE(directory,'EEG2','NelderMead','none',[29.5 48]);
[signal_data,state_data,residuals_lactate_recovery,best_S,UppA,LowA,dynamic_range,Timer,Taui_lactate_recovery,Taud_lactate_recovery]=PROCESSLBATCHMODE(directory,'lactate','NelderMead','none',[29.5 48]);
% ------------------------------------------------------------------------------

% Set up cell array to store column headers
A=cell(1,37);
A{1,1} = 'Recording Name';
% entire file
A{1,2} = 'Taui EEG1 entire file';
A{1,3} = 'Taud EEG1 entire file';
A{1,4} = 'Taui EEG2 entire file';
A{1,5} = 'Taud EEG2 entire file';
A{1,6} = 'Taui lactate entire file';
A{1,7} = 'Taud lactate entire file';
A{1,8} = 'Residuals EEG1 entire file';
A{1,9} = 'Residuals EEG2 entire file';
A{1,10} = 'Residuals lactate entire file';

% baseline
A{1,11} = 'Taui EEG1 baseline';
A{1,12} = 'Taud EEG1 baseline';
A{1,13} = 'Taui EEG2 baseline';
A{1,14} = 'Taud EEG2 baseline';
A{1,15} = 'Taui lactate baseline';
A{1,16} = 'Taud lactate baseline';
A{1,17} = 'Residuals EEG1 baseline';
A{1,18} = 'Residuals EEG2 baseline';
A{1,19} = 'Residuals lactate baseline';

% whisking
A{1,20} = 'Taui EEG1 whisking';
A{1,21} = 'Taud EEG1 whisking';
A{1,22} = 'Taui EEG2 whisking';
A{1,23} = 'Taud EEG2 whisking';
A{1,24} = 'Taui lactate whisking';
A{1,25} = 'Taud lactate whisking';
A{1,26} = 'Residuals EEG1 whisking';
A{1,27} = 'Residuals EEG2 whisking';
A{1,28} = 'Residuals lactate whisking';

% recovery
A{1,29} = 'Taui EEG1 recovery';
A{1,30} = 'Taud EEG1 recovery';
A{1,31} = 'Taui EEG2 recovery';
A{1,32} = 'Taud EEG2 recovery';
A{1,33} = 'Taui lactate recovery';
A{1,34} = 'Taud lactate recovery';
A{1,35} = 'Residuals EEG1 recovery';
A{1,36} = 'Residuals EEG2 recovery';
A{1,37} = 'Residuals lactate recovery';



%TESTING ONLY  ERASE THIS!!
% Taui_EEG1_entire = ones(1,14);
% Taud_EEG1_entire = 2*ones(1,14);
% Taui_EEG2_entire = 3*ones(1,14);
% Taud_EEG2_entire = 4*ones(1,14);
% Taui_lactate_entire = 5*ones(1,14);
% Taud_lactate_entire = 6*ones(1,14);
% residuals_EEG1_entire = 7*ones(1,14);
% residuals_EEG2_entire = 8*ones(1,14);
% residuals_lactate_entire = 9*ones(1,14);

% Taui_EEG1_baseline = 10*ones(1,14);
% Taud_EEG1_baseline = 11*ones(1,14);
% Taui_EEG2_baseline = 12*ones(1,14);
% Taud_EEG2_baseline = 13*ones(1,14);
% Taui_lactate_baseline = 14*ones(1,14);
% Taud_lactate_baseline = 15*ones(1,14);
% residuals_EEG1_baseline = 16*ones(1,14);
% residuals_EEG2_baseline = 17*ones(1,14);
% residuals_lactate_baseline = 18*ones(1,14);

Taui_EEG1_whisking = 19*ones(1,14);
Taud_EEG1_whisking = 20*ones(1,14);
Taui_EEG2_whisking = 21*ones(1,14);
Taud_EEG2_whisking = 22*ones(1,14);
Taui_lactate_whisking = 23*ones(1,14);
Taud_lactate_whisking = 24*ones(1,14);
residuals_EEG1_whisking = 25*ones(1,14);
residuals_EEG2_whisking = 26*ones(1,14);
residuals_lactate_whisking = 27*ones(1,14);

% Taui_EEG1_recovery = 28*ones(1,14);
% Taud_EEG1_recovery = 29*ones(1,14);
% Taui_EEG2_recovery = 30*ones(1,14);
% Taud_EEG2_recovery = 31*ones(1,14);
% Taui_lactate_recovery = 32*ones(1,14);
% Taud_lactate_recovery = 33*ones(1,14);
% residuals_EEG1_recovery = 34*ones(1,14);
% residuals_EEG2_recovery = 35*ones(1,14);
% residuals_lactate_recovery = 36*ones(1,14);

% Start writing to excel file
disp('Starting to write to excel file')
[status,message] = xlswrite('whisking_simulation_output.xls',A);
G = struct2cell(files);
[status,message] = xlswrite('whisking_simulation_output.xls',G(1,:)',1,'A2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taui_EEG1_entire',1,'B2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taud_EEG1_entire',1,'C2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taui_EEG2_entire',1,'D2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taud_EEG2_entire',1,'E2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taui_lactate_entire',1,'F2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taud_lactate_entire',1,'G2');
[status,message] = xlswrite('whisking_simulation_output.xls',residuals_EEG1_entire',1,'H2');
[status,message] = xlswrite('whisking_simulation_output.xls',residuals_EEG2_entire',1,'I2');
[status,message] = xlswrite('whisking_simulation_output.xls',residuals_lactate_entire',1,'J2');

[status,message] = xlswrite('whisking_simulation_output.xls',Taui_EEG1_baseline',1,'K2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taud_EEG1_baseline',1,'L2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taui_EEG2_baseline',1,'M2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taud_EEG2_baseline',1,'N2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taui_lactate_baseline',1,'O2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taud_lactate_baseline',1,'P2');
[status,message] = xlswrite('whisking_simulation_output.xls',residuals_EEG1_baseline',1,'Q2');
[status,message] = xlswrite('whisking_simulation_output.xls',residuals_EEG2_baseline',1,'R2');
[status,message] = xlswrite('whisking_simulation_output.xls',residuals_lactate_baseline',1,'S2');

[status,message] = xlswrite('whisking_simulation_output.xls',Taui_EEG1_whisking',1,'T2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taud_EEG1_whisking',1,'U2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taui_EEG2_whisking',1,'V2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taud_EEG2_whisking',1,'W2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taui_lactate_whisking',1,'X2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taud_lactate_whisking',1,'Y2');
[status,message] = xlswrite('whisking_simulation_output.xls',residuals_EEG1_whisking',1,'Z2');
[status,message] = xlswrite('whisking_simulation_output.xls',residuals_EEG2_whisking',1,'AA2');
[status,message] = xlswrite('whisking_simulation_output.xls',residuals_lactate_whisking',1,'AB2');

[status,message] = xlswrite('whisking_simulation_output.xls',Taui_EEG1_recovery',1,'AC2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taud_EEG1_recovery',1,'AD2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taui_EEG2_recovery',1,'AE2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taud_EEG2_recovery',1,'AF2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taui_lactate_recovery',1,'AG2');
[status,message] = xlswrite('whisking_simulation_output.xls',Taud_lactate_recovery',1,'AH2');
[status,message] = xlswrite('whisking_simulation_output.xls',residuals_EEG1_recovery',1,'AI2');
[status,message] = xlswrite('whisking_simulation_output.xls',residuals_EEG2_recovery',1,'AJ2');
[status,message] = xlswrite('whisking_simulation_output.xls',residuals_lactate_recovery',1,'AK2');







