load('t_rn.mat');
load('t_sn.mat');
load('t_cau.mat');
load('t_pu.mat');
load('t_gp.mat');
load('t_wm.mat');

tot=cell(1,12);
for i=1:12
    tot{i}=[t_rn(i,:); t_sn(i,:); t_cau(i,:); t_pu(i,:); t_gp(i,:); t_wm(i,:)];
end

%% PCA CAU Matrix Best Features
t_cau_b6=t_cau(:,[15 26 28 33 36]);
[coeff_cau_b6,score_cau_b6,laten_cau_b6,~,explained_cau_b6]=pca(t_cau_b6);

figure1=figure('WindowState','maximized');
biplot(coeff_cau_b6(:,1:2),'scores',score_cau_b6(:,1:2),'varlabels',...
    {'glrlm_{lgre}','glszm_{lgze}','glszm_{szlge}','ngtdm_{con}','ngtdm_{str}'});
title('PCA CAU Matrix (Best 6)');
saveas(gcf,'pca/cau/cau_b6.png');

%% PCA GP Matrix Best Features
t_gp_b6=t_gp(:,[15 26 28 33 36]);
[coeff_gp_b6,score_gp_b6,laten_gp_b6,~,explained_gp_b6]=pca(t_gp_b6);

figure2=figure('WindowState','maximized');
biplot(coeff_gp_b6(:,1:2),'scores',score_gp_b6(:,1:2),'varlabels',...
    {'glrlm_{lgre}','glszm_{lgze}','glszm_{szlge}','ngtdm_{con}','ngtdm_{str}'});
title('PCA GP Matrix (Best 6)');
saveas(gcf,'pca/gp/gp_b6.png');

%% PCA pu Matrix Best Features
t_pu_b6=t_pu(:,[15 26 28 33 36]);
[coeff_pu_b6,score_pu_b6,laten_pu_b6,~,explained_pu_b6]=pca(t_pu_b6);

figure3=figure('WindowState','maximized');
biplot(coeff_pu_b6(:,1:2),'scores',score_pu_b6(:,1:2),'varlabels',...
    {'glrlm_{lgre}','glszm_{lgze}','glszm_{szlge}','ngtdm_{con}','ngtdm_{str}'});
title('PCA PU Matrix (Best 6)');
saveas(gcf,'pca/pu/pu_b6.png');

%% PCA rn Matrix Best Features
t_rn_b6=t_rn(:,[15 26 28 33 36]);
[coeff_rn_b6,score_rn_b6,laten_rn_b6,~,explained_rn_b6]=pca(t_rn_b6);

figure4=figure('WindowState','maximized');
biplot(coeff_rn_b6(:,1:2),'scores',score_rn_b6(:,1:2),'varlabels',...
    {'glrlm_{lgre}','glszm_{lgze}','glszm_{szlge}','ngtdm_{con}','ngtdm_{str}'});
title('PCA RN Matrix (Best 6)');
saveas(gcf,'pca/rn/rn_b6.png');

%% PCA sn Matrix Best Features
t_sn_b6=t_sn(:,[15 26 28 33 36]);
[coeff_sn_b6,score_sn_b6,laten_sn_b6,~,explained_sn_b6]=pca(t_sn_b6);

figure5=figure('WindowState','maximized');
biplot(coeff_sn_b6(:,1:2),'scores',score_sn_b6(:,1:2),'varlabels',...
    {'glrlm_{lgre}','glszm_{lgze}','glszm_{szlge}','ngtdm_{con}','ngtdm_{str}'});
title('PCA SN Matrix (Best 6)');
saveas(gcf,'pca/sn/sn_b6.png');

%% PCA wm Matrix Best Features
t_wm_b6=t_wm(:,[15 26 28 33 36]);
[coeff_wm_b6,score_wm_b6,laten_wm_b6,~,explained_wm_b6]=pca(t_wm_b6);

figure6=figure('WindowState','maximized');
biplot(coeff_wm_b6(:,1:2),'scores',score_wm_b6(:,1:2),'varlabels',...
    {'glrlm_{lgre}','glszm_{lgze}','glszm_{szlge}','ngtdm_{con}','ngtdm_{str}'});
title('PCA WM Matrix (Best 6)');
saveas(gcf,'pca/wm/wm_b6.png');