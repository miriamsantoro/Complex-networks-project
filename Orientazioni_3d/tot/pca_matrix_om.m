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

%% PCA CAU Matrix
t_cau_rl=t_cau(:,[6 9 15 18 20 26 28 30 31 32]);
[coeff_cau_rl,score_cau_rl,laten_cau_rl,~,explained_cau_rl]=pca(t_cau_rl);

t_cau_r=t_cau(:,[1 4 5 7 10 12 13 14 19 21 23 24 25 33 34]);
[coeff_cau_r,score_cau_r,laten_cau_r,~,explained_cau_r]=pca(t_cau_r);

t_cau_rh=t_cau(:,[2 3 8 11 16 17 22 27 29 35 36]);
[coeff_cau_rh,score_cau_rh,laten_cau_rh,~,explained_cau_rh]=pca(t_cau_rh);

figure1=figure('WindowState','maximized');
biplot(coeff_cau_rl(:,1:2),'scores',score_cau_rl(:,1:2),'varlabels',...
    {'glcm_{sa}','glcm_{ac}','glrlm_{lgre}','glrlm_{lrlge}','glrlm_{rlv}','glszm_{lgze}','glszm_{szgle}',...
    'glszm_{glv}','glszm_{zsv}','ngtdm_{coa}'});
title('PCA CAU Matrix (10^{-6}-10^{-3})');
saveas(gcf, 'pca/cau/cau_m1.png');

figure2=figure('WindowState','maximized');
biplot(coeff_cau_r(:,1:3),'scores',score_cau_r(:,1:3),'varlabels',...
    {'glcm_{ene}','glcm_{hom}','glcm_{cor}','glcm_{var}','glrlm_{sre}','glrlm_{gln}','glrlm_{rln}',...
    'glrlm_{rp}','glrlm_{glv}','glszm_{sze}','glszm_{gln}','glszm_{zsn}','glszm_{zp}','ngtdm_{con}',...
    'ngtdm_{bus}'});
title('PCA CAU Matrix (10^{-3}-1)');
saveas(gcf,'pca/cau/cau_m2.png');

figure3=figure('WindowState','maximized');
biplot(coeff_cau_rh(:,1:2),'scores',score_cau_rh(:,1:2),'varlabels',...
    {'glcm_{con}','glcm_{ent}','glcm_{dis}','glrlm_{lre}','glrlm_{hgre}','glrlm_{srhge}',...
    'glszm_{lze}','glszm_{hgze}','glszm_{szhge}','ngtdm_{com}','ngtdm_{str}'});
title('PCA CAU Matrix (1-10^{4})');
saveas(gcf, 'pca/cau/cau_m3.png');

%% PCA GP Matrix
t_gp_rl=t_gp(:,[6 9 15 18 20 26 28 30 31 32]);
[coeff_gp_rl,score_gp_rl,laten_gp_rl,~,explained_gp_rl]=pca(t_gp_rl);

t_gp_r=t_gp(:,[1 4 5 7 10 12 13 14 19 21 23 24 25 33 34]);
[coeff_gp_r,score_gp_r,laten_gp_r,~,explained_gp_r]=pca(t_gp_r);

t_gp_rh=t_gp(:,[2 3 8 11 16 17 22 27 29 35 36]);
[coeff_gp_rh,score_gp_rh,laten_gp_rh,~,explained_gp_rh]=pca(t_gp_rh);

figure4=figure('WindowState','maximized');
biplot(coeff_gp_rl(:,1:2),'scores',score_gp_rl(:,1:2),'varlabels',...
    {'glcm_{sa}','glcm_{ac}','glrlm_{lgre}','glrlm_{lrlge}','glrlm_{rlv}','glszm_{lgze}','glszm_{szgle}',...
    'glszm_{glv}','glszm_{zsv}','ngtdm_{coa}'});
title('PCA GP Matrix (10^{-6}-10^{-3})');
saveas(gcf, 'pca/gp/gp_m1.png');

figure5=figure('WindowState','maximized');
biplot(coeff_gp_r(:,1:3),'scores',score_gp_r(:,1:3),'varlabels',...
    {'glcm_{ene}','glcm_{hom}','glcm_{cor}','glcm_{var}','glrlm_{sre}','glrlm_{gln}','glrlm_{rln}',...
    'glrlm_{rp}','glrlm_{glv}','glszm_{sze}','glszm_{gln}','glszm_{zsn}','glszm_{zp}','ngtdm_{con}',...
    'ngtdm_{bus}'});
title('PCA GP Matrix (10^{-3}-1)');
saveas(gcf,'pca/gp/gp_m2.png');

figure6=figure('WindowState','maximized');
biplot(coeff_gp_rh(:,1:2),'scores',score_gp_rh(:,1:2),'varlabels',...
    {'glcm_{con}','glcm_{ent}','glcm_{dis}','glrlm_{lre}','glrlm_{hgre}','glrlm_{srhge}',...
    'glszm_{lze}','glszm_{hgze}','glszm_{szhge}','ngtdm_{com}','ngtdm_{str}'});
title('PCA GP Matrix (1-10^{4})');
saveas(gcf, 'pca/gp/gp_m3.png');

%% PCA PU Matrix
t_pu_rl=t_pu(:,[6 9 15 18 20 26 28 30 31 32]);
[coeff_pu_rl,score_pu_rl,laten_pu_rl,~,explained_pu_rl]=pca(t_pu_rl);

t_pu_r=t_pu(:,[1 4 5 7 10 12 13 14 19 21 23 24 25 33 34]);
[coeff_pu_r,score_pu_r,laten_pu_r,~,explained_pu_r]=pca(t_pu_r);

t_pu_rh=t_pu(:,[2 3 8 11 16 17 22 27 29 35 36]);
[coeff_pu_rh,score_pu_rh,laten_pu_rh,~,explained_pu_rh]=pca(t_pu_rh);

figure7=figure('WindowState','maximized');
biplot(coeff_pu_rl(:,1:2),'scores',score_pu_rl(:,1:2),'varlabels',...
    {'glcm_{sa}','glcm_{ac}','glrlm_{lgre}','glrlm_{lrlge}','glrlm_{rlv}','glszm_{lgze}','glszm_{szgle}',...
    'glszm_{glv}','glszm_{zsv}','ngtdm_{coa}'});
title('PCA PU Matrix (10^{-6}-10^{-3})');
saveas(gcf, 'pca/pu/pu_m1.png');

figure8=figure('WindowState','maximized');
biplot(coeff_pu_r(:,1:2),'scores',score_pu_r(:,1:2),'varlabels',...
    {'glcm_{ene}','glcm_{hom}','glcm_{cor}','glcm_{var}','glrlm_{sre}','glrlm_{gln}','glrlm_{rln}',...
    'glrlm_{rp}','glrlm_{glv}','glszm_{sze}','glszm_{gln}','glszm_{zsn}','glszm_{zp}','ngtdm_{con}',...
    'ngtdm_{bus}'});
title('PCA PU Matrix (10^{-3}-1)');
saveas(gcf,'pca/pu/pu_m2.png');

figure9=figure('WindowState','maximized');
biplot(coeff_pu_rh(:,1:2),'scores',score_pu_rh(:,1:2),'varlabels',...
    {'glcm_{con}','glcm_{ent}','glcm_{dis}','glrlm_{lre}','glrlm_{hgre}','glrlm_{srhge}',...
    'glszm_{lze}','glszm_{hgze}','glszm_{szhge}','ngtdm_{com}','ngtdm_{str}'});
title('PCA PU Matrix (1-10^{4})');
saveas(gcf, 'pca/pu/pu_m3.png');

%% PCA RN Matrix
t_rn_rl=t_rn(:,[6 9 15 18 20 26 28 30 31 32]);
[coeff_rn_rl,score_rn_rl,laten_rn_rl,~,explained_rn_rl]=pca(t_rn_rl);

t_rn_r=t_rn(:,[1 4 5 7 10 12 13 14 19 21 23 24 25 33 34]);
[coeff_rn_r,score_rn_r,laten_rn_r,~,explained_rn_r]=pca(t_rn_r);

t_rn_rh=t_rn(:,[2 3 8 11 16 17 22 27 29 35 36]);
[coeff_rn_rh,score_rn_rh,laten_rn_rh,~,explained_rn_rh]=pca(t_rn_rh);

figure10=figure('WindowState','maximized');
biplot(coeff_rn_rl(:,1:2),'scores',score_rn_rl(:,1:2),'varlabels',...
    {'glcm_{sa}','glcm_{ac}','glrlm_{lgre}','glrlm_{lrlge}','glrlm_{rlv}','glszm_{lgze}','glszm_{szgle}',...
    'glszm_{glv}','glszm_{zsv}','ngtdm_{coa}'});
title('PCA RN Matrix (10^{-6}-10^{-3})');
saveas(gcf, 'pca/rn/rn_m1.png');

figure11=figure('WindowState','maximized');
biplot(coeff_rn_r(:,1:3),'scores',score_rn_r(:,1:3),'varlabels',...
    {'glcm_{ene}','glcm_{hom}','glcm_{cor}','glcm_{var}','glrlm_{sre}','glrlm_{gln}','glrlm_{rln}',...
    'glrlm_{rp}','glrlm_{glv}','glszm_{sze}','glszm_{gln}','glszm_{zsn}','glszm_{zp}','ngtdm_{con}',...
    'ngtdm_{bus}'});
title('PCA RN Matrix (10^{-3}-1)');
saveas(gcf,'pca/rn/rn_m2.png');

figure12=figure('WindowState','maximized');
biplot(coeff_rn_rh(:,1:2),'scores',score_rn_rh(:,1:2),'varlabels',...
    {'glcm_{con}','glcm_{ent}','glcm_{dis}','glrlm_{lre}','glrlm_{hgre}','glrlm_{srhge}',...
    'glszm_{lze}','glszm_{hgze}','glszm_{szhge}','ngtdm_{com}','ngtdm_{str}'});
title('PCA RN Matrix (1-10^{4})');
saveas(gcf, 'pca/rn/rn_m3.png');

%% PCA SN Matrix
t_sn_rl=t_sn(:,[6 9 15 18 20 26 28 30 31 32]);
[coeff_sn_rl,score_sn_rl,laten_sn_rl,~,explained_sn_rl]=pca(t_sn_rl);

t_sn_r=t_sn(:,[1 4 5 7 10 12 13 14 19 21 23 24 25 33 34]);
[coeff_sn_r,score_sn_r,laten_sn_r,~,explained_sn_r]=pca(t_sn_r);

t_sn_rh=t_sn(:,[2 3 8 11 16 17 22 27 29 35 36]);
[coeff_sn_rh,score_sn_rh,laten_sn_rh,~,explained_sn_rh]=pca(t_sn_rh);

figure13=figure('WindowState','maximized');
biplot(coeff_sn_rl(:,1:2),'scores',score_sn_rl(:,1:2),'varlabels',...
    {'glcm_{sa}','glcm_{ac}','glrlm_{lgre}','glrlm_{lrlge}','glrlm_{rlv}','glszm_{lgze}','glszm_{szgle}',...
    'glszm_{glv}','glszm_{zsv}','ngtdm_{coa}'});
title('PCA SN Matrix (10^{-6}-10^{-3})');
saveas(gcf, 'pca/sn/sn_m1.png');

figure14=figure('WindowState','maximized');
biplot(coeff_sn_r(:,1:2),'scores',score_sn_r(:,1:2),'varlabels',...
    {'glcm_{ene}','glcm_{hom}','glcm_{cor}','glcm_{var}','glrlm_{sre}','glrlm_{gln}','glrlm_{rln}',...
    'glrlm_{rp}','glrlm_{glv}','glszm_{sze}','glszm_{gln}','glszm_{zsn}','glszm_{zp}','ngtdm_{con}',...
    'ngtdm_{bus}'});
title('PCA SN Matrix (10^{-3}-1)');
saveas(gcf,'pca/sn/sn_m2.png');

figure15=figure('WindowState','maximized');
biplot(coeff_sn_rh(:,1:2),'scores',score_sn_rh(:,1:2),'varlabels',...
    {'glcm_{con}','glcm_{ent}','glcm_{dis}','glrlm_{lre}','glrlm_{hgre}','glrlm_{srhge}',...
    'glszm_{lze}','glszm_{hgze}','glszm_{szhge}','ngtdm_{com}','ngtdm_{str}'});
title('PCA SN Matrix (1-10^{4})');
saveas(gcf, 'pca/sn/sn_m3.png');

%% PCA wm Matrix
t_wm_rl=t_wm(:,[6 9 15 18 20 26 28 30 31 32]);
[coeff_wm_rl,score_wm_rl,laten_wm_rl,~,explained_wm_rl]=pca(t_wm_rl);

t_wm_r=t_wm(:,[1 4 5 7 10 12 13 14 19 21 23 24 25 33 34]);
[coeff_wm_r,score_wm_r,laten_wm_r,~,explained_wm_r]=pca(t_wm_r);

t_wm_rh=t_wm(:,[2 3 8 11 16 17 22 27 29 35 36]);
[coeff_wm_rh,score_wm_rh,laten_wm_rh,~,explained_wm_rh]=pca(t_wm_rh);

figure16=figure('WindowState','maximized');
biplot(coeff_wm_rl(:,1:2),'scores',score_wm_rl(:,1:2),'varlabels',...
    {'glcm_{sa}','glcm_{ac}','glrlm_{lgre}','glrlm_{lrlge}','glrlm_{rlv}','glszm_{lgze}','glszm_{szgle}',...
    'glszm_{glv}','glszm_{zsv}','ngtdm_{coa}'});
title('PCA WM Matrix (10^{-6}-10^{-3})');
saveas(gcf, 'pca/wm/wm_m1.png');

figure17=figure('WindowState','maximized');
biplot(coeff_wm_r(:,1:3),'scores',score_wm_r(:,1:3),'varlabels',...
    {'glcm_{ene}','glcm_{hom}','glcm_{cor}','glcm_{var}','glrlm_{sre}','glrlm_{gln}','glrlm_{rln}',...
    'glrlm_{rp}','glrlm_{glv}','glszm_{sze}','glszm_{gln}','glszm_{zsn}','glszm_{zp}','ngtdm_{con}',...
    'ngtdm_{bus}'});
title('PCA WM Matrix (10^{-3}-1)');
saveas(gcf,'pca/wm/wm_m2.png');

figure18=figure('WindowState','maximized');
biplot(coeff_wm_rh(:,1:2),'scores',score_wm_rh(:,1:2),'varlabels',...
    {'glcm_{con}','glcm_{ent}','glcm_{dis}','glrlm_{lre}','glrlm_{hgre}','glrlm_{srhge}',...
    'glszm_{lze}','glszm_{hgze}','glszm_{szhge}','ngtdm_{com}','ngtdm_{str}'});
title('PCA WM Matrix (1-10^{4})');
saveas(gcf, 'pca/wm/wm_m3.png');