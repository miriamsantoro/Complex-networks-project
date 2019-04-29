%% Putamen
load('pu_76.mat');
figure1 = figure('WindowState','maximized');
x=[1,2,3,4,5,6,7,8,9,10,11,12];
bar1=bar(x,pu_76(:,1), 'FaceColor', [0.93, 0.69, 0.13]);
hold on
er=errorbar(x,pu_76(:,1),pu_76(:,2));
er.Color=[0, 0, 0];
er.LineStyle = 'none';  
hold off
title('Putamen');
xlabel('Image orientation');
ylabel('Value');
set(bar1(1),'DisplayName','Mean');
set(er(1),'DisplayName','Std Dev');
legend1=legend('show');
set(legend1,'Location','northeastoutside');
set(gca,'FontSize',20);
saveas(gca, 'pu_76.png');

%% Caudate
load('cau_76.mat');
figure2 = figure('WindowState','maximized');
x=[1,2,3,4,5,6,7,8,9,10,11,12];
bar1=bar(x,cau_76(:,1), 'FaceColor', [0.85, 0.33, 0.1]);
hold on
er=errorbar(x,cau_76(:,1),cau_76(:,2));
er.Color=[0, 0, 0];
er.LineStyle = 'none';  
hold off
title('Caudate');
xlabel('Image orientation');
ylabel('Value');
set(bar1(1),'DisplayName','Mean');
set(er(1),'DisplayName','Std Dev');
legend2=legend('show');
set(legend2,'Location','northeastoutside');
set(gca,'FontSize',20);
saveas(gca, 'cau_76.png');

%% Globus Pallidus
load('gp_76.mat');
figure3 = figure('WindowState','maximized');
x=[1,2,3,4,5,6,7,8,9,10,11,12];
bar1=bar(x,gp_76(:,1), 'FaceColor', [0, 0.75, 0.75]);
hold on
er=errorbar(x,gp_76(:,1),gp_76(:,2));
er.Color=[0, 0, 0];
er.LineStyle = 'none';  
hold off
title('Globus Pallidus');
xlabel('Image orientation');
ylabel('Value');
set(bar1(1),'DisplayName','Mean');
set(er(1),'DisplayName','Std Dev');
legend3=legend('show');
set(legend3,'Location','northeastoutside');
set(gca,'FontSize',20);
saveas(gca, 'gp_76.png');

%% White Matter
load('wm_76.mat');
figure4 = figure('WindowState','maximized');
x=[1,2,3,4,5,6,7,8,9,10,11,12];
bar1=bar(x,wm_76(:,1), 'FaceColor', [0.3, 0.75, 0.93]);
hold on
er=errorbar(x,wm_76(:,1),wm_76(:,2));
er.Color=[0, 0, 0];
er.LineStyle = 'none';  
hold off
title('White Matter');
xlabel('Image orientation');
ylabel('Value');
set(bar1(1),'DisplayName','Mean');
set(er(1),'DisplayName','Std Dev');
legend4=legend('show');
set(legend4,'Location','northeastoutside');
set(gca,'FontSize',20);
saveas(gca, 'wm_76.png');

%% Contrast-Noise
load('cn_wm_76.mat');
figure4 = figure('WindowState','maximized');
subplot(2,2,1);
x=[1,2,3,4,5,6,7,8,9,10,11,12];
bar1=bar(x,cn_wm_76(:,1), 'FaceColor', [0.3, 0.75, 0.93]);
hold on
er=errorbar(x,cn_wm_76(:,1),cn_wm_76(:,2));
er.Color=[0, 0, 0];
er.LineStyle = 'none';  
hold off
title('Caudate - White Matter');
xlabel('Image orientation');
ylabel('Value');
set(bar1(1),'DisplayName','Contrast');
set(er(1),'DisplayName','Error');
legend4=legend('show');
set(legend4,'Location','northeastoutside');

subplot(2,2,2);
x=[1,2,3,4,5,6,7,8,9,10,11,12];
bar1=bar(x,cn_wm_76(:,3), 'FaceColor', [0.3, 0.75, 0.93]);
hold on
er=errorbar(x,cn_wm_76(:,3),cn_wm_76(:,4));
er.Color=[0, 0, 0];
er.LineStyle = 'none';  
hold off
title('Globus Pallidus - White Matter');
xlabel('Image orientation');
ylabel('Value');
set(bar1(1),'DisplayName','Contrast');
set(er(1),'DisplayName','Error');
legend4=legend('show');
set(legend4,'Location','northeastoutside');

subplot(2,2,3);
x=[1,2,3,4,5,6,7,8,9,10,11,12];
bar1=bar(x,cn_wm_76(:,5), 'FaceColor', [0.3, 0.75, 0.93]);
hold on
er=errorbar(x,cn_wm_76(:,5),cn_wm_76(:,6));
er.Color=[0, 0, 0];
er.LineStyle = 'none';  
hold off
title('Putamen - White Matter');
xlabel('Image orientation');
ylabel('Value');
set(bar1(1),'DisplayName','Contrast');
set(er(1),'DisplayName','Error');
legend4=legend('show');
set(legend4,'Location','northeastoutside');
saveas(gca, 'cn_wm_76.png');

%% CN Putamen
load('cn_pu_76.mat');
figure5 = figure('WindowState','maximized');
subplot(2,1,1);
x=[1,2,3,4,5,6,7,8,9,10,11,12];
bar1=bar(x,cn_pu_76(:,1), 'FaceColor', [1, 0.84, 0]);
hold on
er=errorbar(x,cn_pu_76(:,1),cn_pu_76(:,2));
er.Color=[0, 0, 0];
er.LineStyle = 'none';  
hold off
title('Caudate - Putamen');
xlabel('Image orientation');
ylabel('Value');
set(bar1(1),'DisplayName','Contrast');
set(er(1),'DisplayName','Error');
legend5=legend('show');
set(legend5,'Location','northeastoutside');

subplot(2,1,2);
x=[1,2,3,4,5,6,7,8,9,10,11,12];
bar1=bar(x,cn_pu_76(:,3), 'FaceColor', [1, 0.84, 0]);
hold on
er=errorbar(x,cn_pu_76(:,3),cn_pu_76(:,4));
er.Color=[0, 0, 0];
er.LineStyle = 'none';  
hold off
title('Globus Pallidus - Putamen');
xlabel('Image orientation');
ylabel('Value');
set(bar1(1),'DisplayName','Contrast');
set(er(1),'DisplayName','Error');
legend6=legend('show');
set(legend6,'Location','northeastoutside');
saveas(gca, 'cn_pu_76.png');