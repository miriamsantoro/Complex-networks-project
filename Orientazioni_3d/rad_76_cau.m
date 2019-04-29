%% Divide the 12 orientations
load phs_all;
load R_tot;
%load mp_rage;               % mprage
 
N=[160 160 160];
%imagesc3d2(phs_all, N/2, 4, [90,90,-90], [-0.05,0.05], [], 'Avg Phase'
or=cell(1,12);
for i=1:12
    or{i}=phs_all(:,:,:,i);
end
 
%% Load 3d roi tot for 12 orientations
tot_3d=cell(1,12);
n_tot_3d=cell(1,12);
for i=1:12
    tot_3d{i}=or{i}(51:115, 41:105, :);
    n_tot_3d{i} = uint8(255*mat2gray(tot_3d{i}));   %Normalized single orientation for tot (All 3d images)
end
 
%% Create mask (volumetric mask roi 76)
img=imread('im1_76.png');
h_im=imshow(img(51:115,41:105));
e=imfreehand(gca, [12.4679054054054 15.5422297297297;12.2483108108108 15.5422297297297;11.8091216216216 15.5422297297297;11.8091216216216 15.5422297297297;11.589527027027 15.7618243243243;11.1503378378378 15.7618243243243;11.1503378378378 15.7618243243243;10.9307432432432 15.9814189189189;10.491554054054 15.9814189189189;10.491554054054 15.9814189189189;10.2719594594594 15.9814189189189;9.83277027027026 15.9814189189189;9.83277027027026 15.9814189189189;9.61317567567565 15.9814189189189;9.17398648648646 15.9814189189189;9.17398648648646 15.9814189189189;8.95439189189187 16.2010135135135;8.51520270270268 16.4206081081081;8.51520270270268 16.4206081081081;8.51520270270268 16.6402027027027;8.51520270270268 16.8597972972973;8.51520270270268 17.0793918918919;8.51520270270268 17.2989864864865;8.51520270270268 17.5185810810811;8.51520270270268 17.7381756756757;8.51520270270268 17.9577702702703;8.51520270270268 18.1773648648649;8.51520270270268 18.3969594594595;8.51520270270268 18.6165540540541;8.51520270270268 18.8361486486487;8.51520270270268 19.0557432432433;8.51520270270268 19.2753378378378;8.51520270270268 19.4949324324324;8.51520270270268 19.714527027027;8.95439189189187 19.9341216216216;8.95439189189187 20.1537162162162;9.17398648648646 20.1537162162162;9.17398648648646 20.3733108108108;9.17398648648646 20.5929054054054;9.17398648648646 20.8125;9.17398648648646 21.0320945945946;9.61317567567565 21.2516891891892;9.61317567567565 21.4712837837838;9.83277027027026 21.6908783783784;9.83277027027026 21.6908783783784;9.83277027027026 21.910472972973;9.83277027027026 22.1300675675676;10.2719594594594 22.3496621621622;10.491554054054 22.5692567567568;10.491554054054 22.7888513513514;10.9307432432432 23.2280405405406;11.1503378378378 23.6672297297297;11.1503378378378 23.8868243243243;11.1503378378378 24.1064189189189;11.589527027027 24.3260135135135;11.589527027027 24.5456081081081;11.589527027027 24.7652027027027;11.8091216216216 24.7652027027027;11.8091216216216 24.9847972972973;12.2483108108108 25.2043918918919;12.4679054054054 25.4239864864865;12.4679054054054 25.6435810810811;12.4679054054054 25.8631756756757;12.4679054054054 26.0827702702703;12.9070945945946 26.0827702702703;13.1266891891892 26.3023648648649;13.1266891891892 26.5219594594595;13.5658783783784 26.5219594594595;13.7854729729729 26.7415540540541;13.7854729729729 26.9611486486487;13.7854729729729 26.9611486486487;14.2246621621621 27.1807432432433;14.4442567567567 27.4003378378379;14.4442567567567 27.4003378378379;14.8834459459459 27.4003378378379;15.1030405405405 27.6199324324324;15.1030405405405 27.6199324324324;15.1030405405405 27.839527027027;15.5422297297297 27.839527027027;15.7618243243243 28.0591216216216;15.7618243243243 28.0591216216216;16.2010135135135 28.2787162162162;16.4206081081081 28.2787162162162;16.4206081081081 28.4983108108108;16.8597972972973 28.7179054054054;17.0793918918919 28.7179054054054;17.0793918918919 28.7179054054054;17.5185810810811 28.9375;17.7381756756756 28.9375;17.7381756756756 29.1570945945946;17.7381756756756 29.1570945945946;18.1773648648648 29.1570945945946;18.3969594594594 29.1570945945946;18.3969594594594 29.1570945945946;18.8361486486486 29.1570945945946;19.0557432432432 29.1570945945946;19.0557432432432 28.9375;19.4949324324324 28.9375;19.714527027027 28.9375;19.714527027027 28.7179054054054;20.1537162162162 28.4983108108108;20.3733108108108 28.2787162162162;20.3733108108108 28.0591216216216;20.3733108108108 27.839527027027;20.8125 27.839527027027;21.0320945945946 27.6199324324324;21.0320945945946 27.6199324324324;21.4712837837837 27.4003378378379;21.6908783783784 27.1807432432433;21.6908783783784 26.9611486486487;22.1300675675676 26.7415540540541;22.3496621621621 26.7415540540541;22.3496621621621 26.5219594594595;22.3496621621621 26.3023648648649;23.0084459459459 26.0827702702703;23.0084459459459 26.0827702702703;23.4476351351351 26.0827702702703;23.4476351351351 25.8631756756757;23.4476351351351 25.6435810810811;23.6672297297297 25.4239864864865;23.6672297297297 25.2043918918919;24.1064189189189 24.9847972972973;24.1064189189189 24.7652027027027;24.3260135135135 24.5456081081081;24.3260135135135 24.3260135135135;24.3260135135135 24.1064189189189;24.3260135135135 23.8868243243243;24.3260135135135 23.6672297297297;24.3260135135135 23.4476351351351;24.3260135135135 23.2280405405406;24.3260135135135 23.008445945946;24.1064189189189 22.7888513513514;23.6672297297297 22.5692567567568;23.6672297297297 22.3496621621622;23.6672297297297 22.1300675675676;23.4476351351351 22.1300675675676;23.0084459459459 22.1300675675676;23.0084459459459 21.910472972973;22.7888513513513 21.6908783783784;22.3496621621621 21.4712837837838;22.3496621621621 21.4712837837838;22.1300675675676 21.2516891891892;21.6908783783784 21.0320945945946;21.6908783783784 21.0320945945946;21.4712837837837 21.0320945945946;21.0320945945946 20.8125;21.0320945945946 20.5929054054054;20.8125 20.3733108108108;20.3733108108108 20.3733108108108;20.1537162162162 20.1537162162162;19.714527027027 19.9341216216216;19.714527027027 19.9341216216216;19.714527027027 19.714527027027;19.0557432432432 19.4949324324324;19.0557432432432 19.4949324324324;18.8361486486486 19.4949324324324;18.3969594594594 19.2753378378378;18.3969594594594 19.2753378378378;18.1773648648648 19.0557432432433;18.1773648648648 18.8361486486487;17.7381756756756 18.8361486486487;17.7381756756756 18.8361486486487;17.5185810810811 18.6165540540541;17.0793918918919 18.6165540540541;17.0793918918919 18.6165540540541;17.0793918918919 18.3969594594595;16.4206081081081 18.3969594594595;16.4206081081081 18.1773648648649;16.2010135135135 18.1773648648649;15.7618243243243 18.1773648648649;15.7618243243243 17.9577702702703;15.7618243243243 17.9577702702703;15.5422297297297 17.7381756756757;15.1030405405405 17.7381756756757;15.1030405405405 17.7381756756757;15.1030405405405 17.5185810810811;14.8834459459459 17.2989864864865;14.4442567567567 17.2989864864865;14.4442567567567 17.2989864864865;14.4442567567567 17.0793918918919;14.2246621621621 17.0793918918919;13.7854729729729 16.8597972972973;13.7854729729729 16.8597972972973;13.5658783783784 16.8597972972973;13.1266891891892 16.6402027027027;13.1266891891892 16.4206081081081;12.9070945945946 16.4206081081081;12.9070945945946 16.2010135135135;12.4679054054054 16.2010135135135;12.4679054054054 15.9814189189189;12.4679054054054 15.7618243243243;12.2483108108108 15.7618243243243;11.8091216216216 15.7618243243243;11.8091216216216 15.7618243243243;11.589527027027 15.7618243243243;11.1503378378378 15.5422297297297;11.1503378378378 15.5422297297297;10.9307432432432 15.5422297297297;10.9307432432432 15.3226351351351]);

%[11.589527027027 15.1030405405405;11.1503378378378 15.1030405405405;11.1503378378378 15.3226351351351;11.1503378378378 15.5422297297297;10.9307432432432 15.7618243243243;10.491554054054 15.7618243243243;10.491554054054 15.7618243243243;10.491554054054 15.9814189189189;10.2719594594594 16.2010135135135;9.83277027027026 16.4206081081081;9.83277027027026 16.6402027027027;9.83277027027026 16.8597972972973;9.61317567567565 17.0793918918919;9.61317567567565 17.2989864864865;9.17398648648646 17.5185810810811;9.17398648648646 17.7381756756757;8.95439189189187 17.7381756756757;8.95439189189187 17.9577702702703;8.95439189189187 18.1773648648649;8.51520270270268 18.1773648648649;8.51520270270268 18.3969594594595;8.51520270270268 18.6165540540541;8.51520270270268 18.8361486486487;8.51520270270268 19.0557432432433;8.51520270270268 19.2753378378378;8.51520270270268 19.4949324324324;8.51520270270268 19.714527027027;8.51520270270268 19.9341216216216;8.95439189189187 20.1537162162162;9.17398648648646 20.3733108108108;9.17398648648646 20.5929054054054;9.17398648648646 20.8125;9.61317567567565 20.8125;9.83277027027026 21.0320945945946;9.83277027027026 21.2516891891892;9.83277027027026 21.4712837837838;9.83277027027026 21.6908783783784;9.83277027027026 21.910472972973;9.83277027027026 22.1300675675676;10.2719594594594 22.1300675675676;10.491554054054 22.3496621621622;10.491554054054 22.5692567567568;10.491554054054 22.7888513513514;10.9307432432432 23.008445945946;10.9307432432432 23.2280405405406;10.9307432432432 23.4476351351351;11.1503378378378 23.4476351351351;11.1503378378378 23.6672297297297;11.1503378378378 23.8868243243243;11.1503378378378 24.1064189189189;11.589527027027 24.3260135135135;11.589527027027 24.5456081081081;11.8091216216216 24.5456081081081;11.8091216216216 24.7652027027027;12.2483108108108 24.9847972972973;12.2483108108108 25.2043918918919;12.4679054054054 25.4239864864865;12.4679054054054 25.6435810810811;12.9070945945946 25.8631756756757;13.1266891891892 25.8631756756757;13.1266891891892 25.8631756756757;13.1266891891892 26.0827702702703;13.5658783783784 26.0827702702703;13.5658783783784 26.3023648648649;13.7854729729729 26.5219594594595;13.7854729729729 26.7415540540541;14.2246621621621 26.7415540540541;14.4442567567567 26.9611486486487;14.4442567567567 27.1807432432433;14.8834459459459 27.1807432432433;15.1030405405405 27.4003378378379;15.1030405405405 27.4003378378379;15.5422297297297 27.4003378378379;15.7618243243243 27.6199324324324;15.7618243243243 27.839527027027;16.2010135135135 28.0591216216216;16.4206081081081 28.2787162162162;16.4206081081081 28.2787162162162;16.8597972972973 28.2787162162162;17.0793918918919 28.4983108108108;17.0793918918919 28.4983108108108;17.5185810810811 28.4983108108108;17.7381756756756 28.4983108108108;17.7381756756756 28.4983108108108;18.1773648648648 28.4983108108108;18.3969594594594 28.4983108108108;18.8361486486486 28.4983108108108;19.0557432432432 28.4983108108108;19.0557432432432 28.4983108108108;19.4949324324324 28.4983108108108;19.714527027027 28.4983108108108;19.714527027027 28.4983108108108;20.1537162162162 28.4983108108108;20.3733108108108 28.4983108108108;20.8125 28.2787162162162;21.0320945945946 28.0591216216216;21.0320945945946 27.839527027027;21.4712837837837 27.839527027027;21.6908783783784 27.6199324324324;21.6908783783784 27.6199324324324;22.1300675675676 27.6199324324324;22.3496621621621 27.4003378378379;22.3496621621621 27.4003378378379;22.3496621621621 27.1807432432433;23.0084459459459 26.9611486486487;23.0084459459459 26.7415540540541;23.4476351351351 26.7415540540541;23.6672297297297 26.5219594594595;23.6672297297297 26.3023648648649;24.3260135135135 26.0827702702703;24.3260135135135 25.8631756756757;24.3260135135135 25.6435810810811;24.7652027027027 25.6435810810811;24.7652027027027 25.4239864864865;24.9847972972973 25.2043918918919;24.9847972972973 25.2043918918919;25.4239864864865 24.7652027027027;25.6435810810811 24.5456081081081;25.6435810810811 24.3260135135135;25.6435810810811 24.1064189189189;25.6435810810811 23.6672297297297;25.6435810810811 23.4476351351351;25.6435810810811 23.2280405405406;25.6435810810811 23.008445945946;25.6435810810811 22.5692567567568;25.6435810810811 22.3496621621622;25.6435810810811 21.910472972973;25.6435810810811 21.6908783783784;25.4239864864865 21.4712837837838;24.9847972972973 21.2516891891892;24.7652027027027 21.2516891891892;24.3260135135135 21.0320945945946;24.3260135135135 20.8125;24.1064189189189 20.8125;23.6672297297297 20.5929054054054;23.6672297297297 20.5929054054054;23.4476351351351 20.5929054054054;23.0084459459459 20.3733108108108;23.0084459459459 20.3733108108108;22.7888513513513 20.1537162162162;22.3496621621621 20.1537162162162;22.3496621621621 19.9341216216216;22.1300675675676 19.9341216216216;21.6908783783784 19.714527027027;21.4712837837837 19.714527027027;21.0320945945946 19.4949324324324;20.8125 19.4949324324324;20.3733108108108 19.2753378378378;20.3733108108108 19.2753378378378;20.1537162162162 19.0557432432433;19.714527027027 19.0557432432433;19.714527027027 19.0557432432433;19.714527027027 18.8361486486487;19.4949324324324 18.8361486486487;19.0557432432432 18.6165540540541;19.0557432432432 18.6165540540541;18.8361486486486 18.3969594594595;18.3969594594594 18.1773648648649;18.3969594594594 18.1773648648649;18.1773648648648 18.1773648648649;17.7381756756756 18.1773648648649;17.7381756756756 18.1773648648649;17.5185810810811 17.9577702702703;17.0793918918919 17.9577702702703;17.0793918918919 17.7381756756757;17.0793918918919 17.7381756756757;16.8597972972973 17.7381756756757;16.4206081081081 17.5185810810811;16.4206081081081 17.5185810810811;16.2010135135135 17.5185810810811;15.7618243243243 17.2989864864865;15.7618243243243 17.0793918918919;15.7618243243243 17.0793918918919;14.8834459459459 16.8597972972973;14.4442567567567 16.6402027027027;13.7854729729729 16.6402027027027;13.7854729729729 16.6402027027027;13.1266891891892 16.2010135135135;12.4679054054054 15.9814189189189;11.8091216216216 15.7618243243243;11.1503378378378 15.5422297297297;11.1503378378378 15.3226351351351;10.9307432432432 15.3226351351351;10.491554054054 15.1030405405405;10.491554054054 15.1030405405405;10.2719594594594 15.1030405405405;9.83277027027026 15.1030405405405;9.83277027027026 15.1030405405405;9.61317567567565 15.1030405405405]

BW_ = createMask(e,h_im);
 
BW=double(BW_);
 
BW_v=cat(160,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,...
            BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,...
            BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,...
            BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,...
            BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,...
            BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,...
            BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW,BW);
 
%% Prepare Volume
ROIonly=cell(1,12);
levels=cell(1,12);
for i=1:12
    [ROIonly{i}, levels{i}]=prepareVolume(n_tot_3d{i}, BW_v, 'MRscan', 1.0625, 1.0714, 1, 'pixelW', 'Matrix', 'Uniform', 256);
end
 
%% Get statistics 
GLCM = cell(1,12); 
glcmTextures = cell(1,12);
GLRLM = cell(1,12); 
glrlmTextures = cell(1,12);
GLSZM = cell(1,12); 
glszmTextures = cell(1,12);
NGTDM=cell(1,12);
countValid = cell(1,12); 
ngtdmTextures = cell(1,12);
 
tic;
for i=1:12
    GLCM{i} = getGLCM(ROIonly{i},levels{i}); 
    glcmTextures{i} = getGLCMtextures(GLCM{i});
 
    GLRLM{i} = getGLRLM(ROIonly{i},levels{i}); 
    glrlmTextures{i} = getGLRLMtextures(GLRLM{i});
 
    GLSZM{i} = getGLSZM(ROIonly{i},levels{i}); 
    glszmTextures{i} = getGLSZMtextures(GLSZM{i});
 
    [NGTDM{i},countValid{i}] = getNGTDM(ROIonly{i},levels{i}); 
    ngtdmTextures{i} = getNGTDMtextures(NGTDM{i},countValid{i});
end
toc;
%% GLCM results
glcm_ene=cell(1,12);
glcm_con=cell(1,12);
glcm_ent=cell(1,12);
glcm_hom=cell(1,12);
glcm_cor=cell(1,12);
glcm_sa=cell(1,12);
glcm_var=cell(1,12);
glcm_dis=cell(1,12);
glcm_ac=cell(1,12);
 
for i=1:12
    glcm_ene{i}=glcmTextures{i}.Energy;
    glcm_con{i}=glcmTextures{i}.Contrast;
    glcm_ent{i}=glcmTextures{i}.Entropy;
    glcm_hom{i}=glcmTextures{i}.Homogeneity;
    glcm_cor{i}=glcmTextures{i}.Correlation;
    glcm_sa{i}=glcmTextures{i}.SumAverage;
    glcm_var{i}=glcmTextures{i}.Variance;
    glcm_dis{i}=glcmTextures{i}.Dissimilarity;
    glcm_ac{i}=glcmTextures{i}.AutoCorrelation;
end
 
glcm_ene=[glcm_ene{:}];
glcm_con=[glcm_con{:}];
glcm_ent=[glcm_ent{:}];
glcm_hom=[glcm_hom{:}];
glcm_cor=[glcm_cor{:}];
glcm_sa=[glcm_sa{:}];
glcm_var=[glcm_var{:}];
glcm_dis=[glcm_dis{:}];
glcm_ac=[glcm_ac{:}];

%% GLCM display
% 1 GLCM
figure1 = figure('WindowState','maximized');
subplot(2,2,1);
bar(glcm_ene)
xlim([0.5 12.5]);
title('GLCM Energy');
xlabel('Image orientation');
ylabel('Energy value');
 
subplot(2,2,2);
bar(glcm_con)
xlim([0.5 12.5]);
title('GLCM Contrast');
xlabel('Image orientation');
ylabel('Contrast value');
 
subplot(2,2,3);
bar(glcm_ent)
xlim([0.5 12.5]);
title('GLCM Entropy');
xlabel('Image orientation');
ylabel('Entropy value');
 
subplot(2,2,4);
bar(glcm_hom)
xlim([0.5 12.5]);
title('GLCM Homogeneity');
xlabel('Image orientation');
ylabel('Homogeneity value');
saveas(gcf, 'radiomics_76/cau/glcm_1.png');
 
% 2 GLCM
figure2 = figure('WindowState','maximized');
subplot(2,2,1);
bar(glcm_cor)
xlim([0.5 12.5]);
title('GLCM Correlation');
xlabel('Image orientation');
ylabel('Correlation value');
 
subplot(2,2,2);
bar(glcm_sa)
xlim([0.5 12.5]);
title('GLCM Sum Average');
xlabel('Image orientation');
ylabel('Sum Average value');
 
subplot(2,2,3);
bar(glcm_var)
xlim([0.5 12.5]);
title('GLCM Variance');
xlabel('Image orientation');
ylabel('Variance value');
 
subplot(2,2,4);
bar(glcm_dis)
xlim([0.5 12.5]);
title('GLCM Dissimilarity');
xlabel('Image orientation');
ylabel('Dissimilarity value');
saveas(gcf, 'radiomics_76/cau/glcm_2.png');
 
% 3 GLCM 
figure3 = figure('WindowState','maximized');
subplot(2,2,1)
bar(glcm_ac)
xlim([0.5 12.5]);
title('GLCM Auto Correlation');
xlabel('Image orientation');
ylabel('Auto Correlation value');
saveas(gcf, 'radiomics_76/cau/glcm_3.png');

%% GLCM statistics
[h_glcm_ene,p_glcm_ene,ci_glcm_ene,stats_glcm_ene] = ttest(glcm_ene(2:12), glcm_ene(1));
[h_glcm_con,p_glcm_con,ci_glcm_con,stats_glcm_con] = ttest(glcm_con(2:12), glcm_con(1));
[h_glcm_ent,p_glcm_ent,ci_glcm_ent,stats_glcm_ent] = ttest(glcm_ent(2:12), glcm_ent(1));
[h_glcm_hom,p_glcm_hom,ci_glcm_hom,stats_glcm_hom] = ttest(glcm_hom(2:12), glcm_hom(1));
[h_glcm_cor,p_glcm_cor,ci_glcm_cor,stats_glcm_cor] = ttest(glcm_cor(2:12), glcm_cor(1));
[h_glcm_sa,p_glcm_sa,ci_glcm_sa,stats_glcm_sa] = ttest(glcm_sa(2:12), glcm_sa(1));
[h_glcm_var,p_glcm_var,ci_glcm_var,stats_glcm_var] = ttest(glcm_var(2:12), glcm_var(1));
[h_glcm_dis,p_glcm_dis,ci_glcm_dis,stats_glcm_dis] = ttest(glcm_dis(2:12), glcm_dis(1));
[h_glcm_ac,p_glcm_ac,ci_glcm_ac,stats_glcm_ac] = ttest(glcm_ac(2:12), glcm_ac(1));

h_glcm=[h_glcm_ene,h_glcm_con,h_glcm_ent,h_glcm_hom,h_glcm_cor,h_glcm_sa,h_glcm_var,h_glcm_dis,h_glcm_ac];
p_glcm=[p_glcm_ene,p_glcm_con,p_glcm_ent,p_glcm_hom,p_glcm_cor,p_glcm_sa,p_glcm_var,p_glcm_dis,p_glcm_ac];

filename=('radiomics_76/cau/hp_glcm.mat');
save(filename,'h_glcm','p_glcm')

%% GLRLM results
glrlm_sre=cell(1,12);
glrlm_lre=cell(1,12);
glrlm_gln=cell(1,12);
glrlm_rln=cell(1,12);
glrlm_rp=cell(1,12);
glrlm_lgre=cell(1,12);
glrlm_hgre=cell(1,12);
glrlm_srhge=cell(1,12);
glrlm_lrlge=cell(1,12);
glrlm_glv=cell(1,12);
glrlm_rlv=cell(1,12);
 
for i=1:12
    glrlm_sre{i}=glrlmTextures{i}.SRE;
    glrlm_lre{i}=glrlmTextures{i}.LRE;
    glrlm_gln{i}=glrlmTextures{i}.GLN;
    glrlm_rln{i}=glrlmTextures{i}.RLN;
    glrlm_rp{i}=glrlmTextures{i}.RP;
    glrlm_lgre{i}=glrlmTextures{i}.LGRE;
    glrlm_hgre{i}=glrlmTextures{i}.HGRE;
    glrlm_srhge{i}=glrlmTextures{i}.SRHGE;
    glrlm_lrlge{i}=glrlmTextures{i}.LRLGE;
    glrlm_glv{i}=glrlmTextures{i}.GLV;
    glrlm_rlv{i}=glrlmTextures{i}.RLV;    
end
 
glrlm_sre=[glrlm_sre{:}];
glrlm_lre=[glrlm_lre{:}];
glrlm_gln=[glrlm_gln{:}];
glrlm_rln=[glrlm_rln{:}];
glrlm_rp=[glrlm_rp{:}];
glrlm_lgre=[glrlm_lgre{:}];
glrlm_hgre=[glrlm_hgre{:}];
glrlm_srhge=[glrlm_srhge{:}];
glrlm_lrlge=[glrlm_lrlge{:}];
glrlm_glv=[glrlm_glv{:}];
glrlm_rlv=[glrlm_rlv{:}];

%% GLRLM display 
% 1 GLRLM
figure1 = figure('WindowState','maximized');
subplot(2,2,1);
bar(glrlm_sre, 'FaceColor',[0.64 0.08 0.18]);
xlim([0.5 12.5]);
title('GLRLM SRE');
xlabel('Image orientation');
ylabel('SRE value');
 
subplot(2,2,2);
bar(glrlm_lre, 'FaceColor',[0.64 0.08 0.18]);
xlim([0.5 12.5]);
title('GLRLM LRE');
xlabel('Image orientation');
ylabel('LRE value');
 
subplot(2,2,3);
bar(glrlm_gln, 'FaceColor',[0.64 0.08 0.18]);
xlim([0.5 12.5]);
title('GLRLM GLN');
xlabel('Image orientation');
ylabel('GLN value');
 
subplot(2,2,4);
bar(glrlm_rln, 'FaceColor',[0.64 0.08 0.18]);
xlim([0.5 12.5]);
title('GLRLM RLN');
xlabel('Image orientation');
ylabel('RLN value');
saveas(gcf, 'radiomics_76/cau/glrlm_1.png');
 
% 2 GLRLM
figure2 = figure('WindowState','maximized');
subplot(2,2,1);
bar(glrlm_rp, 'FaceColor',[0.64 0.08 0.18]);
xlim([0.5 12.5]);
title('GLRLM RP');
xlabel('Image orientation');
ylabel('RP value');
 
subplot(2,2,2);
bar(glrlm_lgre, 'FaceColor',[0.64 0.08 0.18]);
xlim([0.5 12.5]);
title('GLRLM LGRE');
xlabel('Image orientation');
ylabel('LGRE value');
 
subplot(2,2,3);
bar(glrlm_hgre, 'FaceColor',[0.64 0.08 0.18]);
xlim([0.5 12.5]);
title('GLRLM HGRE');
xlabel('Image orientation');
ylabel('HGRE value');
 
subplot(2,2,4);
bar(glrlm_srhge, 'FaceColor',[0.64 0.08 0.18]);
xlim([0.5 12.5]);
title('GLRLM SRHGE');
xlabel('Image orientation');
ylabel('SRHGE value');
saveas(gcf, 'radiomics_76/cau/glrlm_2.png');
 
% 2 GLRLM
figure3 = figure('WindowState','maximized');
subplot(2,2,1);
bar(glrlm_lrlge, 'FaceColor',[0.64 0.08 0.18]);
xlim([0.5 12.5]);
title('GLRLM LRLGE');
xlabel('Image orientation');
ylabel('LRLGE value');
 
subplot(2,2,2);
bar(glrlm_glv, 'FaceColor',[0.64 0.08 0.18]);
xlim([0.5 12.5]);
title('GLRLM GLV');
xlabel('Image orientation');
ylabel('GLV value');
 
subplot(2,2,3);
bar(glrlm_rlv, 'FaceColor',[0.64 0.08 0.18]);
xlim([0.5 12.5]);
title('GLRLM RLV');
xlabel('Image orientation');
ylabel('RLV value');
saveas(gcf, 'radiomics_76/cau/glrlm_3.png');

%% GLRLM statistics
[h_glrlm_sre,p_glrlm_sre,ci_glrlm_sre,stats_glrlm_sre] = ttest(glrlm_sre(2:12), glrlm_sre(1));
[h_glrlm_lre,p_glrlm_lre,ci_glrlm_lre,stats_glrlm_lre] = ttest(glrlm_lre(2:12), glrlm_lre(1));
[h_glrlm_gln,p_glrlm_gln,ci_glrlm_gln,stats_glrlm_gln] = ttest(glrlm_gln(2:12), glrlm_gln(1));
[h_glrlm_rln,p_glrlm_rln,ci_glrlm_rln,stats_glrlm_rln] = ttest(glrlm_rln(2:12), glrlm_rln(1));
[h_glrlm_rp,p_glrlm_rp,ci_glrlm_rp,stats_glrlm_rp] = ttest(glrlm_rp(2:12), glrlm_rp(1));
[h_glrlm_lgre,p_glrlm_lgre,ci_glrlm_lgre,stats_glrlm_lgre] = ttest(glrlm_lgre(2:12), glrlm_lgre(1));
[h_glrlm_hgre,p_glrlm_hgre,ci_glrlm_hgre,stats_glrlm_hgre] = ttest(glrlm_hgre(2:12), glrlm_hgre(1));
[h_glrlm_srhge,p_glrlm_srhge,ci_glrlm_srhge,stats_glrlm_srhge] = ttest(glrlm_srhge(2:12), glrlm_srhge(1));
[h_glrlm_lrlge,p_glrlm_lrlge,ci_glrlm_lrlge,stats_glrlm_lrlge] = ttest(glrlm_lrlge(2:12), glrlm_lrlge(1));
[h_glrlm_glv,p_glrlm_glv,ci_glrlm_glv,stats_glrlm_glv] = ttest(glrlm_glv(2:12), glrlm_glv(1));
[h_glrlm_rlv,p_glrlm_rlv,ci_glrlm_rlv,stats_glrlm_rlv] = ttest(glrlm_rlv(2:12), glrlm_rlv(1));

h_glrlm=[h_glrlm_sre,h_glrlm_lre,h_glrlm_gln,h_glrlm_rln,h_glrlm_rp,h_glrlm_lgre,h_glrlm_hgre,h_glrlm_srhge,h_glrlm_lrlge,h_glrlm_glv,h_glrlm_rlv];
p_glrlm=[p_glrlm_sre,p_glrlm_lre,p_glrlm_gln,p_glrlm_rln,p_glrlm_rp,p_glrlm_lgre,p_glrlm_hgre,p_glrlm_srhge,p_glrlm_lrlge,p_glrlm_glv,p_glrlm_rlv];

filename=('radiomics_76/cau/hp_glrlm.mat');
save(filename,'h_glrlm','p_glrlm')

%% GLSZM results
glszm_sze=cell(1,12);
glszm_lze=cell(1,12);
glszm_gln=cell(1,12);
glszm_zsn=cell(1,12);
glszm_zp=cell(1,12);
glszm_lgze=cell(1,12);
glszm_hgze=cell(1,12);
glszm_szlge=cell(1,12);
glszm_szhge=cell(1,12);
glszm_glv=cell(1,12);
glszm_zsv=cell(1,12);
 
for i=1:12
    glszm_sze{i}=glszmTextures{i}.SZE;
    glszm_lze{i}=glszmTextures{i}.LZE;
    glszm_gln{i}=glszmTextures{i}.GLN;
    glszm_zsn{i}=glszmTextures{i}.ZSN;
    glszm_zp{i}=glszmTextures{i}.ZP;
    glszm_lgze{i}=glszmTextures{i}.LGZE;
    glszm_hgze{i}=glszmTextures{i}.HGZE;
    glszm_szlge{i}=glszmTextures{i}.SZLGE;
    glszm_szhge{i}=glszmTextures{i}.SZHGE;
    glszm_glv{i}=glszmTextures{i}.GLV;
    glszm_zsv{i}=glszmTextures{i}.ZSV;    
end
 
glszm_sze=[glszm_sze{:}];
glszm_lze=[glszm_lze{:}];
glszm_gln=[glszm_gln{:}];
glszm_zsn=[glszm_zsn{:}];
glszm_zp=[glszm_zp{:}];
glszm_lgze=[glszm_lgze{:}];
glszm_hgze=[glszm_hgze{:}];
glszm_szlge=[glszm_szlge{:}];
glszm_szhge=[glszm_szhge{:}];
glszm_glv=[glszm_glv{:}];
glszm_zsv=[glszm_zsv{:}];
 
%% GLSZM display
% 1 GLSZM
figure1 = figure('WindowState','maximized');
subplot(2,2,1);
bar(glszm_sze, 'FaceColor',[0.87 0.49 0])
xlim([0.5 12.5]);
title('GLSZM SZE');
xlabel('Image orientation');
ylabel('SZE value');
 
subplot(2,2,2);
bar(glszm_lze, 'FaceColor',[0.87 0.49 0])
xlim([0.5 12.5]);
title('GLSZM LZE');
xlabel('Image orientation');
ylabel('LZE value');
 
subplot(2,2,3);
bar(glszm_gln, 'FaceColor',[0.87 0.49 0])
xlim([0.5 12.5]);
title('GLSZM GLN');
xlabel('Image orientation');
ylabel('GLN value');
 
subplot(2,2,4);
bar(glszm_zsn, 'FaceColor',[0.87 0.49 0])
xlim([0.5 12.5]);
title('GLSZM ZSN');
xlabel('Image orientation');
ylabel('ZSN value');
saveas(gcf, 'radiomics_76/cau/glszm_1.png');
 
% 2 GLSZM
figure2 = figure('WindowState','maximized');
subplot(2,2,1);
bar(glszm_zp, 'FaceColor',[0.87 0.49 0])
xlim([0.5 12.5]);
title('GLSZM ZP');
xlabel('Image orientation');
ylabel('ZP value');
 
subplot(2,2,2);
bar(glszm_lgze, 'FaceColor',[0.87 0.49 0])
xlim([0.5 12.5]);
title('GLSZM LGZE');
xlabel('Image orientation');
ylabel('LGZE value');
 
subplot(2,2,3);
bar(glszm_hgze, 'FaceColor',[0.87 0.49 0])
xlim([0.5 12.5]);
title('GLSZM HGZE');
xlabel('Image orientation');
ylabel('HGZE value');
 
subplot(2,2,4);
bar(glszm_szlge, 'FaceColor',[0.87 0.49 0])
xlim([0.5 12.5]);
title('GLSZM SZLGE');
xlabel('Image orientation');
ylabel('SZLGE value');
saveas(gcf, 'radiomics_76/cau/glszm_2.png');
 
% 3 GLSZM
figure3 = figure('WindowState','maximized');
subplot(2,2,1);
bar(glszm_szhge, 'FaceColor',[0.87 0.49 0])
xlim([0.5 12.5]);
title('GLSZM SZHGE');
xlabel('Image orientation');
ylabel('SZHGE value');
 
subplot(2,2,2);
bar(glszm_glv, 'FaceColor',[0.87 0.49 0])
xlim([0.5 12.5]);
title('GLSZM GLV');
xlabel('Image orientation');
ylabel('GLV value');
 
subplot(2,2,3);
bar(glszm_zsv, 'FaceColor',[0.87 0.49 0])
xlim([0.5 12.5]);
title('GLSZM ZSV');
xlabel('Image orientation');
ylabel('ZSV value');
saveas(gcf, 'radiomics_76/cau/glszm_3.png');

%% GLSZM statistics
[h_glszm_sze,p_glszm_sze,ci_glszm_sze,stats_glszm_sze] = ttest(glszm_sze(2:12), glszm_sze(1));
[h_glszm_lze,p_glszm_lze,ci_glszm_lze,stats_glszm_lze] = ttest(glszm_lze(2:12), glszm_lze(1));
[h_glszm_gln,p_glszm_gln,ci_glszm_gln,stats_glszm_gln] = ttest(glszm_gln(2:12), glszm_gln(1));
[h_glszm_zsn,p_glszm_zsn,ci_glszm_zsn,stats_glszm_zsn] = ttest(glszm_zsn(2:12), glszm_zsn(1));
[h_glszm_zp,p_glszm_zp,ci_glszm_zp,stats_glszm_zp] = ttest(glszm_zp(2:12), glszm_zp(1));
[h_glszm_lgze,p_glszm_lgze,ci_glszm_lgze,stats_glszm_lgze] = ttest(glszm_lgze(2:12), glszm_lgze(1));
[h_glszm_hgze,p_glszm_hgze,ci_glszm_hgze,stats_glszm_hgze] = ttest(glszm_hgze(2:12), glszm_hgze(1));
[h_glszm_szlge,p_glszm_szlge,ci_glszm_szlge,stats_glszm_szlge] = ttest(glszm_szlge(2:12), glszm_szlge(1));
[h_glszm_szhge,p_glszm_szhge,ci_glszm_szhge,stats_glszm_szhge] = ttest(glszm_szhge(2:12), glszm_szhge(1));
[h_glszm_glv,p_glszm_glv,ci_glszm_glv,stats_glszm_glv] = ttest(glszm_glv(2:12), glszm_glv(1));
[h_glszm_zsv,p_glszm_zsv,ci_glszm_zsv,stats_glszm_zsv] = ttest(glszm_zsv(2:12), glszm_zsv(1));

h_glszm=[h_glszm_sze,h_glszm_lze,h_glszm_gln,h_glszm_zsn,h_glszm_zp,h_glszm_lgze,h_glszm_hgze,h_glszm_szlge,h_glszm_szhge,h_glszm_glv,h_glszm_zsv];
p_glszm=[p_glszm_sze,p_glszm_lze,p_glszm_gln,p_glszm_zsn,p_glszm_zp,p_glszm_lgze,p_glszm_hgze,p_glszm_szlge,p_glszm_szhge,p_glszm_glv,p_glszm_zsv];

filename=('radiomics_76/cau/hp_glszm.mat');
save(filename,'h_glszm','p_glszm')

%% NGTDM results
ngtdm_coa=cell(1,12);
ngtdm_con=cell(1,12);
ngtdm_bus=cell(1,12);
ngtdm_com=cell(1,12);
ngtdm_str=cell(1,12);
 
for i=1:12
    ngtdm_coa{i}=ngtdmTextures{i}.Coarseness;
    ngtdm_con{i}=ngtdmTextures{i}.Contrast;
    ngtdm_bus{i}=ngtdmTextures{i}.Busyness;
    ngtdm_com{i}=ngtdmTextures{i}.Complexity;
    ngtdm_str{i}=ngtdmTextures{i}.Strength;
end
 
ngtdm_coa=[ngtdm_coa{:}];
ngtdm_con=[ngtdm_con{:}];
ngtdm_bus=[ngtdm_bus{:}];
ngtdm_com=[ngtdm_com{:}];
ngtdm_str=[ngtdm_str{:}];

%% NGTDM display
% 1 NGTDM
figure1 = figure('WindowState','maximized');
subplot(2,2,1);
bar(ngtdm_coa, 'FaceColor',[0 0.75 0.75])
xlim([0.5 12.5]);
title('NGTDM Coarseness');
xlabel('Image orientation');
ylabel('Coarseness value');
 
subplot(2,2,2);
bar(ngtdm_con, 'FaceColor',[0 0.75 0.75])
xlim([0.5 12.5]);
title('NGTDM Contrast');
xlabel('Image orientation');
ylabel('Contrast value');
 
subplot(2,2,3);
bar(ngtdm_bus, 'FaceColor',[0 0.75 0.75])
xlim([0.5 12.5]);
title('NGTDM Busyness');
xlabel('Image orientation');
ylabel('Busyness value');
 
subplot(2,2,4);
bar(ngtdm_com, 'FaceColor',[0 0.75 0.75])
xlim([0.5 12.5]);
title('NGTDM Complexity');
xlabel('Image orientation');
ylabel('Complexity value');
saveas(gcf, 'radiomics_76/cau/ngtdm_1.png');
 
% 2 NGTDM
figure2 = figure('WindowState','maximized');
subplot(2,2,1);
bar(ngtdm_str, 'FaceColor',[0 0.75 0.75])
xlim([0.5 12.5]);
title('NGTDM Strength');
xlabel('Image orientation');
ylabel('Strength value'); 
saveas(gcf, 'radiomics_76/cau/ngtdm_2.png');

%% NGTDM statistics
[h_ngtdm_coa,p_ngtdm_coa,ci_ngtdm_coa,stats_ngtdm_coa] = ttest(ngtdm_coa(2:12), ngtdm_coa(1));
[h_ngtdm_con,p_ngtdm_con,ci_ngtdm_con,stats_ngtdm_con] = ttest(ngtdm_con(2:12), ngtdm_con(1));
[h_ngtdm_bus,p_ngtdm_bus,ci_ngtdm_bus,stats_ngtdm_bus] = ttest(ngtdm_bus(2:12), ngtdm_bus(1));
[h_ngtdm_com,p_ngtdm_com,ci_ngtdm_com,stats_ngtdm_com] = ttest(ngtdm_com(2:12), ngtdm_com(1));
[h_ngtdm_str,p_ngtdm_str,ci_ngtdm_str,stats_ngtdm_str] = ttest(ngtdm_str(2:12), ngtdm_str(1));

h_ngtdm=[h_ngtdm_coa,h_ngtdm_con,h_ngtdm_bus,h_ngtdm_com,h_ngtdm_str];
p_ngtdm=[p_ngtdm_coa,p_ngtdm_con,p_ngtdm_bus,p_ngtdm_com,p_ngtdm_str];

filename=('radiomics_76/cau/hp_ngtdm.mat');
save(filename,'h_ngtdm','p_ngtdm')

%% Global textures
ROIonly2=cell(1,12);
for i=1:12
    [ROIonly2{i}] = prepareVolume(n_tot_3d{i},BW_v,'MRscan',1.0625, 1.0714, 1,'pixelW','Global');
end
 
%% Get statistics
globalTextures=cell(1,12);
for i=1:12
    [globalTextures{i}] = getGlobalTextures(ROIonly2{i},256);
end
 
%% Global results
g_v=cell(1,12);
g_s=cell(1,12);
g_k=cell(1,12);
 
for i=1:12
    g_v{i}=globalTextures{i}.Variance;
    g_s{i}=globalTextures{i}.Skewness;
    g_k{i}=globalTextures{i}.Kurtosis;
end
 
g_v=[g_v{:}];
g_s=[g_s{:}];
g_k=[g_k{:}];

%% Global display
figure = figure('WindowState','maximized');
subplot(2,2,1);
bar(g_v, 'FaceColor', [1, 0.84, 0])
xlim([0.5 12.5]);
title('Global Variance');
xlabel('Image orientation');
ylabel('Variance value');
 
subplot(2,2,2);
bar(g_s, 'FaceColor', [1, 0.84, 0])
xlim([0.5 12.5]);
title('Global Skewness');
xlabel('Image orientation');
ylabel('Skewness value');
 
subplot(2,2,3);
bar(g_k, 'FaceColor', [1, 0.84, 0])
xlim([0.5 12.5]);
title('Global Kurtosis');
xlabel('Image orientation');
ylabel('Kurtosis value');
saveas(gcf, 'radiomics_76/cau/g.png');

%% Global statistics
[h_g_v,p_g_v,ci_g_v,stats_g_v] = ttest(g_v(2:12), g_v(1));
[h_g_s,p_g_s,ci_g_s,stats_g_s] = ttest(g_s(2:12), g_s(1));
[h_g_k,p_g_k,ci_g_k,stats_g_k] = ttest(g_k(2:12), g_k(1));

h_g=[h_g_v,h_g_s,h_g_k];
p_g=[p_g_v,p_g_s,p_g_k];

filename=('radiomics_76/cau/hp_g.mat');
save(filename,'h_g','p_g')

%%
t_cau=zeros(12,36);
for i=1:12
    t_cau(i,:)=[glcm_ene(i),glcm_con(i),glcm_ent(i),glcm_hom(i),glcm_cor(i),glcm_sa(i),glcm_var(i),glcm_dis(i),glcm_ac(i),...
    glrlm_sre(i),glrlm_lre(i),glrlm_gln(i),glrlm_rln(i),glrlm_rp(i),glrlm_lgre(i),glrlm_hgre(i),glrlm_srhge(i),...
    glrlm_lrlge(i),glrlm_glv(i),glrlm_rlv(i),...
    glszm_sze(i),glszm_lze(i),glszm_gln(i),glszm_zsn(i),glszm_zp(i),glszm_lgze(i),glszm_hgze(i),glszm_szlge(i),...
    glszm_szhge(i),glszm_glv(i),glszm_zsv(i),...
    ngtdm_coa(i),ngtdm_con(i),ngtdm_bus(i),ngtdm_com(i),ngtdm_str(i)];
end

save('tot/t_cau','t_cau')

%%
tg_cau=zeros(12,3);
for i=1:12
    tg_cau(i,:)=[g_v(i),g_s(i),g_k(i)];
end
save('tot/tg_cau','tg_cau')