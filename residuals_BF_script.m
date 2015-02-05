
directory='D:\mrempe\strain_study_data\BL\long_files\'


[sig_data,state_dat,residualsBFdelta,bS,UA,LA,dynamic_range,timer,TideltaBF,TddeltaBF]=PROCESSLBATCHMODE(directory,'delta2','BruteForce');


[sig_data,state_dat,residualsBFlactate,bS,UA,LA,dynamic_range,timer,TilactateBF,TdlactateBF]=PROCESSLBATCHMODE(directory,'lactate','BruteForce')


save('residuals_for_Frontiers_paper.mat','residualsBFdelta','residualsBFlactate','-append');