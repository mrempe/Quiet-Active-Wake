% script to make figure comparing tau parameters to total waking and total sleep time
% This script makes a figure with 8 subplots comparing tau values for lactate and delta to
% total wake time and total sleep time. 

figure

subplot(4,2,1)
plot(wake_minutes,Tauidelta,'ko','MarkerFaceColor','k')
xlabel('Total wake time (min)')
ylabel('\tau_i SWA')

subplot(4,2,2)
plot(sws_minutes,Tauidelta,'ko','MarkerFaceColor','k')
xlabel('Total SWS time (min)')
ylabel('\tau_i SWA')

subplot(4,2,3)
plot(wake_minutes,Tauddelta,'ko','MarkerFaceColor','k')
xlabel('Total wake time (min)')
ylabel('\tau_d SWA')

subplot(4,2,4)
plot(sws_minutes,Tauddelta,'ko','MarkerFaceColor','k')
xlabel('Total SWS time (min)')
ylabel('\tau_d SWA')


subplot(4,2,5)
plot(wake_minutes,Tauilactate,'ko','MarkerFaceColor','k')
xlabel('Total wake time (min)')
ylabel('\tau_i lactate')

subplot(4,2,6)
plot(sws_minutes,Tauilactate,'ko','MarkerFaceColor','k')
xlabel('Total SWS time (min)')
ylabel('\tau_i lactate')

subplot(4,2,7)
plot(wake_minutes,Taudlactate,'ko','MarkerFaceColor','k')
xlabel('Total wake time (min)')
ylabel('\tau_d lactate')

subplot(4,2,8)
plot(sws_minutes,Taudlactate,'ko','MarkerFaceColor','k')
xlabel('Total SWS time (min)')
ylabel('\tau_d lactate')
