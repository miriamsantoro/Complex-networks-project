%% Plots
load('rn_66.mat');

figure1 = figure('WindowState','maximized');
x=[1,2,3,4,5,6,7,8,9,10,11,12];
bar1=bar(x,rn_66(:,1), 'FaceColor', [0.64 0.08 0.18]);
hold on
er=errorbar(x,rn_66(:,1),rn_66(:,2));
er.Color=[0, 0, 0];
er.LineStyle = 'none';  
hold off
title('Red nucleus');
xlabel('Image orientation');
ylabel('Value');
set(bar1(1),'DisplayName','Mean');
set(er(1),'DisplayName','Std Dev');
legend1=legend('show');
set(legend1,'Location','northeastoutside');
set(gca,'FontSize',20);
saveas(gca, 'rn_66.png');

%%
load('sn_66.mat');
figure2 = figure('WindowState','maximized');
x=[1,2,3,4,5,6,7,8,9,10,11,12];
bar1=bar(x,sn_66(:,1), 'FaceColor', [0 0.45 0.74]);
hold on
er=errorbar(x,sn_66(:,1),rn_66(:,2));
er.Color=[0, 0, 0];
er.LineStyle = 'none';  
hold off
title('Substantia nigra');
xlabel('Image orientation');
ylabel('Value');
set(bar1(1),'DisplayName','Mean');
set(er(1),'DisplayName','Std Dev');
legend1=legend('show');
set(legend1,'Location','northeastoutside');
set(gca,'FontSize',20);
saveas(gca, 'sn_66.png');