
% script to run PROCESSLBATCHMODE.m on the 2-sec data for autoscored using lactate 
% and manual scored using lactate and SWA
% each vector of output contains tau values for 11 BA files and then 11 BL files

ten_sec_directory = 'D:\mrempe\autoscore_and_epoch_length_study_data\10-Second_epochs\';
two_sec_directory = 'D:\mrempe\autoscore_and_epoch_length_study_data\2-Second_epochs\';


disp(['step ' num2str(1) 'of 8'])

%first 10-sec autoscored lactate 
[sd,std,residual10secAUTOlact,bestS,UA,LA,timer,taui10secAUTOlactate,taud10secAUTOlactate]=PROCESSLBATCHMODE(ten_sec_directory,'lactate','NelderMead','AUTOSCORED');
disp(['step ' num2str(2) 'of 8'])

% 10-sec manually-scored lactate
[sd,std,residual10secMANlact,bestS,UA,LA,timer,taui10secMANlactate,taud10secMANlactate]=PROCESSLBATCHMODE(ten_sec_directory,'lactate','NelderMead','Manual');
disp(['step ' num2str(3) 'of 8'])

% 10-sec autoscored SWA 
[sd,std,residual10secAUTOSWA,bestS,UA,LA,timer,taui10secAUTOSWA,taud10secAUTOSWA]=PROCESSLBATCHMODE(ten_sec_directory,'delta2','NelderMead','AUTOSCORED');
disp(['step ' num2str(4) 'of 8'])

% 10-sec manually-scored SWA
[sd,std,residual10secMANSWA,bestS,UA,LA,timer,taui10secMANSWA,taud10secMANSWA]=PROCESSLBATCHMODE(ten_sec_directory,'delta2','NelderMead','Manual');
disp(['step ' num2str(5) 'of 8'])



% now do it all over again with 2-second data
%first 2-sec autoscored lactate 
[sd,std,residual2secAUTOlact,bestS,UA,LA,timer,taui2secAUTOlactate,taud2secAUTOlactate]=PROCESSLBATCHMODE(two_sec_directory,'lactate','NelderMead','AUTOSCORED');
disp(['step ' num2str(6) 'of 8'])

% 2-sec manually-scored lactate
[sd,std,residual2secMANlact,bestS,UA,LA,timer,taui2secMANlactate,taud2secMANlactate]=PROCESSLBATCHMODE(two_sec_directory,'lactate','NelderMead','Manual');
disp(['step ' num2str(7) 'of 8'])

% 2-sec autoscored SWA 
[sd,std,residual2secAUTOSWA,bestS,UA,LA,timer,taui2secAUTOSWA,taud2secAUTOSWA]=PROCESSLBATCHMODE(two_sec_directory,'delta2','NelderMead','AUTOSCORED');
disp(['step ' num2str(8) 'of 8'])

% 2-sec manually-scored SWA
[sd,std,residual2secMANSWA,bestS,UA,LA,timer,taui2secMANSWA,taud2secMANSWA]=PROCESSLBATCHMODE(two_sec_directory,'delta2','NelderMead','Manual');


save tauvalues2sec10sec.mat tau* residual* 


