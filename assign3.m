speed=[0,5,10,7,12,8,15,9,14,11,135,10,7,12,8,15,9,14,11,13];

time= 1:length(speed);

avg=mean(speed);

plot(time,speed,'-o','LineWidth',2,'MarkerFaceColor','c');

xlabel('Time(Hr)');
ylabel('Internet Speed(Mbps)');
title('Internet Speed Over Time')

yline(avg, '--b', 'Average Speed', 'LineWidth', 2);


legend('Internet Speed', 'Average Speed');