load('t_rn.mat');
load('t_sn.mat');
load('t_cau.mat');
load('t_pu.mat');
load('t_gp.mat');
load('t_wm.mat');
load('tg_rn.mat');
load('tg_sn.mat');
load('tg_cau.mat');
load('tg_pu.mat');
load('tg_gp.mat');
load('tg_wm.mat');

tot=cell(1,12);
for i=1:12
    tot{i}=[t_rn(i,:); t_sn(i,:); t_cau(i,:); t_pu(i,:); t_gp(i,:); t_wm(i,:)];
end

totg=cell(1,12);
for l=1:12
    totg{l}=[tg_rn(l,:); tg_sn(l,:); tg_cau(l,:); tg_pu(l,:); tg_gp(l,:); tg_wm(l,:)];
end

%% All ROI global 
for l=1:12
    figure2 = figure('WindowState','maximized');
    x2=[1 2 3];
    plot2=plot(x2,totg{l}(1,:),x2,totg{l}(2,:),x2,totg{l}(3,:),x2,totg{l}(4,:),x2,totg{l}(5,:),x2,totg{l}(6,:),...
        'Marker','.','MarkerSize', 10, 'LineStyle', ':');
    set(plot2(1),'DisplayName','rn');
    set(plot2(2),'DisplayName','sn');
    set(plot2(3),'DisplayName','cau');
    set(plot2(4),'DisplayName','gp');
    set(plot2(5),'DisplayName','pu');
    set(plot2(6),'DisplayName','wm');
    xlim([0 4]);
    title(sprintf('%d Orientation (Matrix)',l));
    xlabel('Features');
    ylabel('Features value');
    legend(gca,'show');
    set(legend,'Location','northeastoutside');
    saveas(gcf, sprintf('plot/totg_%d.png',l))
end

%% All ROI matrix
for i=1:12
    figure1 = figure('WindowState','maximized');
    x=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,22,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36];
    plot=semilogy(x,tot{i}(1,:),x,tot{i}(2,:),x,tot{i}(3,:),x,tot{i}(4,:),x,tot{i}(5,:),x,tot{i}(6,:),...
        'Marker','.','MarkerSize', 10, 'LineStyle', ':');
    set(plot(1),'DisplayName','rn');
    set(plot(2),'DisplayName','sn');
    set(plot(3),'DisplayName','cau');
    set(plot(4),'DisplayName','gp');
    set(plot(5),'DisplayName','pu');
    set(plot(6),'DisplayName','wm');
    title(sprintf('%d orientation (Matrix)',i));
    xlabel('Features');
    ylabel('Features value');
    xlim([0 37]);
    set(gca,'XMinorTick','on','YGrid','on');
    legend(gca,'show');
    set(legend,'Location','northeastoutside');
    saveas(gcf, sprintf('plot/tot_%d.png',i))
end
