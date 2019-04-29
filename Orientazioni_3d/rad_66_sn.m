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
    tot_3d{i}=or{i}(51:115, 61:125, :);
    n_tot_3d{i} = uint8(255*mat2gray(tot_3d{i}));   %Normalized single orientation for tot (All 3d images)
end
 
%% Create mask (volumetric mask substantia nigra roi 66)
img=imread('im1_66.png');
h_im=imshow(img(51:115, 61:125));
e=imfreehand(gca, [23.0084459459459 13.5658783783784;23.0084459459459 13.5658783783784;22.7888513513513 13.5658783783784;22.3496621621621 13.5658783783784;22.1300675675676 13.5658783783784;21.6908783783784 13.5658783783784;21.6908783783784 13.5658783783784;21.4712837837837 13.5658783783784;21.0320945945946 13.5658783783784;21.0320945945946 13.5658783783784;20.8125 13.5658783783784;20.3733108108108 13.5658783783784;20.3733108108108 13.5658783783784;20.1537162162162 13.5658783783784;19.714527027027 13.5658783783784;19.714527027027 13.5658783783784;19.4949324324324 13.5658783783784;19.0557432432432 13.5658783783784;19.0557432432432 13.5658783783784;18.8361486486486 13.5658783783784;18.3969594594594 13.5658783783784;18.3969594594594 13.5658783783784;18.1773648648648 13.785472972973;17.7381756756756 14.0050675675676;17.7381756756756 14.2246621621622;17.7381756756756 14.4442567567568;17.7381756756756 14.4442567567568;17.5185810810811 14.6638513513514;17.0793918918919 14.883445945946;17.0793918918919 15.1030405405405;16.8597972972973 15.1030405405405;16.4206081081081 15.3226351351351;16.4206081081081 15.3226351351351;16.2010135135135 15.5422297297297;15.7618243243243 15.5422297297297;15.7618243243243 15.7618243243243;15.7618243243243 15.7618243243243;15.5422297297297 15.7618243243243;15.1030405405405 15.9814189189189;15.1030405405405 15.9814189189189;14.8834459459459 16.2010135135135;14.4442567567567 16.4206081081081;14.4442567567567 16.6402027027027;14.2246621621621 16.8597972972973;14.2246621621621 17.0793918918919;13.7854729729729 17.0793918918919;13.5658783783784 17.5185810810811;13.1266891891892 17.7381756756757;13.1266891891892 18.1773648648649;12.9070945945946 18.1773648648649;12.9070945945946 18.3969594594595;12.4679054054054 18.8361486486487;12.4679054054054 19.0557432432433;12.4679054054054 19.2753378378378;12.2483108108108 19.4949324324324;11.8091216216216 19.714527027027;11.8091216216216 19.9341216216216;11.8091216216216 20.1537162162162;11.589527027027 20.3733108108108;11.1503378378378 20.5929054054054;11.1503378378378 20.8125;11.1503378378378 21.0320945945946;11.1503378378378 21.2516891891892;11.1503378378378 21.4712837837838;11.1503378378378 21.6908783783784;11.1503378378378 21.910472972973;11.1503378378378 22.1300675675676;11.1503378378378 22.3496621621622;11.1503378378378 22.5692567567568;11.589527027027 22.5692567567568;11.589527027027 22.7888513513514;11.589527027027 23.008445945946;11.8091216216216 23.2280405405406;11.8091216216216 23.4476351351351;12.2483108108108 23.6672297297297;12.2483108108108 23.8868243243243;12.4679054054054 23.8868243243243;12.4679054054054 24.1064189189189;12.9070945945946 24.1064189189189;13.1266891891892 24.3260135135135;13.1266891891892 24.5456081081081;13.5658783783784 24.5456081081081;13.7854729729729 24.5456081081081;13.7854729729729 24.5456081081081;14.2246621621621 24.5456081081081;14.2246621621621 24.3260135135135;14.4442567567567 24.3260135135135;14.4442567567567 24.1064189189189;14.8834459459459 24.1064189189189;15.1030405405405 24.1064189189189;15.1030405405405 24.1064189189189;15.5422297297297 23.8868243243243;15.7618243243243 23.8868243243243;15.7618243243243 23.8868243243243;16.2010135135135 23.6672297297297;16.2010135135135 23.4476351351351;16.4206081081081 23.2280405405406;16.4206081081081 23.2280405405406;16.8597972972973 23.008445945946;16.8597972972973 22.7888513513514;17.0793918918919 22.7888513513514;17.0793918918919 22.7888513513514;17.5185810810811 22.5692567567568;17.7381756756756 22.3496621621622;17.7381756756756 22.1300675675676;18.1773648648648 22.1300675675676;18.3969594594594 22.1300675675676;18.3969594594594 22.1300675675676;18.8361486486486 22.1300675675676;18.8361486486486 21.910472972973;19.0557432432432 21.910472972973;19.0557432432432 21.6908783783784;19.4949324324324 21.6908783783784;19.714527027027 21.6908783783784;19.714527027027 21.4712837837838;20.1537162162162 21.2516891891892;20.3733108108108 21.0320945945946;20.8125 20.8125;21.0320945945946 20.5929054054054;21.0320945945946 20.3733108108108;21.4712837837837 20.1537162162162;21.6908783783784 20.1537162162162;21.6908783783784 19.9341216216216;22.1300675675676 19.9341216216216;22.3496621621621 19.714527027027;22.3496621621621 19.4949324324324;22.7888513513513 19.4949324324324;23.0084459459459 19.4949324324324;23.0084459459459 19.2753378378378;23.0084459459459 19.0557432432433;23.0084459459459 18.8361486486487;23.4476351351351 18.8361486486487;23.4476351351351 18.6165540540541;23.6672297297297 18.3969594594595;23.6672297297297 18.1773648648649;24.1064189189189 17.9577702702703;24.1064189189189 17.7381756756757;24.1064189189189 17.5185810810811;24.1064189189189 17.2989864864865;24.1064189189189 17.0793918918919;24.1064189189189 16.8597972972973;24.1064189189189 16.4206081081081;24.3260135135135 16.2010135135135;24.3260135135135 15.9814189189189;24.3260135135135 15.7618243243243;24.3260135135135 15.5422297297297;24.3260135135135 15.3226351351351;24.3260135135135 15.1030405405405;24.3260135135135 14.883445945946;24.3260135135135 14.6638513513514;24.3260135135135 14.4442567567568;24.3260135135135 14.2246621621622;24.3260135135135 14.0050675675676;24.1064189189189 13.785472972973;23.6672297297297 13.785472972973;23.4476351351351 13.785472972973;23.0084459459459 13.785472972973;23.0084459459459 13.785472972973;22.7888513513513 13.785472972973;22.3496621621621 13.785472972973;22.3496621621621 13.785472972973;22.1300675675676 13.785472972973;21.6908783783784 13.5658783783784]);

%[22.1300675675676 13.1266891891892;20.5929054054054 14.0050675675676;20.1537162162162 14.0050675675676;19.9341216216216 14.0050675675676;19.4949324324324 14.2246621621622;19.4949324324324 14.2246621621622;19.2753378378378 14.4442567567568;18.8361486486486 14.4442567567568;18.8361486486486 14.6638513513514;18.8361486486486 14.883445945946;18.6165540540541 14.883445945946;18.1773648648649 15.1030405405405;17.9577702702703 15.3226351351351;17.5185810810811 15.5422297297297;17.5185810810811 15.5422297297297;17.2989864864865 15.5422297297297;17.2989864864865 15.7618243243243;16.8597972972973 15.7618243243243;16.8597972972973 15.9814189189189;16.2010135135135 16.6402027027027;15.9814189189189 16.8597972972973;15.5422297297297 16.8597972972973;15.5422297297297 17.0793918918919;15.5422297297297 17.2989864864865;15.5422297297297 17.5185810810811;15.3226351351351 17.7381756756757;14.8834459459459 17.9577702702703;14.8834459459459 18.1773648648649;14.6638513513514 18.1773648648649;14.2246621621622 18.1773648648649;14.2246621621622 18.3969594594595;14.2246621621622 18.6165540540541;14.2246621621622 18.6165540540541;14.0050675675676 18.8361486486487;13.5658783783784 19.0557432432432;13.5658783783784 19.2753378378378;13.3462837837838 19.4949324324324;12.9070945945946 19.714527027027;12.9070945945946 19.9341216216216;12.6875 20.3733108108108;12.6875 20.5929054054054;12.2483108108108 20.8125;12.2483108108108 20.8125;12.2483108108108 21.0320945945946;12.2483108108108 21.2516891891892;12.2483108108108 21.4712837837838;12.0287162162162 21.6908783783784;12.0287162162162 21.910472972973;12.0287162162162 22.1300675675676;12.0287162162162 22.3496621621622;12.0287162162162 22.5692567567568;12.0287162162162 22.7888513513514;12.0287162162162 23.008445945946;12.0287162162162 23.2280405405405;12.0287162162162 23.4476351351351;12.0287162162162 23.6672297297297;12.0287162162162 23.8868243243243;12.0287162162162 24.1064189189189;12.0287162162162 24.3260135135135;12.0287162162162 24.5456081081081;12.0287162162162 24.7652027027027;12.2483108108108 24.7652027027027;12.2483108108108 24.9847972972973;12.2483108108108 25.2043918918919;12.6875 25.2043918918919;12.6875 25.4239864864865;12.9070945945946 25.6435810810811;13.3462837837838 25.6435810810811;13.5658783783784 25.6435810810811;13.5658783783784 25.6435810810811;14.0050675675676 25.4239864864865;14.2246621621622 25.4239864864865;14.2246621621622 25.2043918918919;14.6638513513514 24.9847972972973;14.6638513513514 24.7652027027027;14.8834459459459 24.5456081081081;14.8834459459459 24.5456081081081;15.3226351351351 24.3260135135135;15.3226351351351 24.1064189189189;15.5422297297297 23.8868243243243;15.5422297297297 23.6672297297297;15.9814189189189 23.6672297297297;16.2010135135135 23.6672297297297;16.2010135135135 23.4476351351351;16.6402027027027 23.4476351351351;16.8597972972973 23.2280405405405;16.8597972972973 23.008445945946;17.2989864864865 23.008445945946;17.5185810810811 23.008445945946;17.5185810810811 22.7888513513514;17.9577702702703 22.7888513513514;18.1773648648649 22.5692567567568;18.8361486486486 22.3496621621622;19.2753378378378 22.1300675675676;19.4949324324324 22.1300675675676;19.4949324324324 21.910472972973;19.4949324324324 21.6908783783784;19.9341216216216 21.6908783783784;20.1537162162162 21.4712837837838;20.1537162162162 21.2516891891892;20.5929054054054 21.2516891891892;20.5929054054054 21.0320945945946;20.8125 21.0320945945946;20.8125 20.8125;20.8125 20.8125;20.8125 20.5929054054054;20.8125 20.3733108108108;21.2516891891892 20.3733108108108;21.4712837837838 20.3733108108108;21.4712837837838 20.1537162162162;21.4712837837838 19.9341216216216;21.910472972973 19.714527027027;22.1300675675676 19.4949324324324;22.1300675675676 19.2753378378378;22.1300675675676 19.2753378378378;22.5692567567567 19.2753378378378;22.5692567567567 19.0557432432432;22.5692567567567 18.8361486486487;22.7888513513514 18.6165540540541;22.7888513513514 18.6165540540541;23.2280405405405 18.3969594594595;23.4476351351351 18.1773648648649;23.4476351351351 17.9577702702703;23.4476351351351 17.9577702702703;23.8868243243243 17.7381756756757;24.1064189189189 17.7381756756757;24.1064189189189 17.5185810810811;24.1064189189189 17.2989864864865;24.1064189189189 17.0793918918919;24.5456081081081 16.8597972972973;24.5456081081081 16.6402027027027;24.5456081081081 16.4206081081081;24.5456081081081 16.2010135135135;24.5456081081081 15.9814189189189;24.5456081081081 15.7618243243243;24.5456081081081 15.5422297297297;24.5456081081081 15.3226351351351;24.5456081081081 15.1030405405405;24.5456081081081 14.883445945946;24.5456081081081 14.6638513513514;24.5456081081081 14.4442567567568;24.5456081081081 14.2246621621622;24.1064189189189 14.0050675675676;24.1064189189189 13.785472972973;24.1064189189189 13.785472972973;23.8868243243243 13.5658783783784;23.4476351351351 13.3462837837838;23.4476351351351 13.1266891891892;23.4476351351351 12.9070945945946;23.4476351351351 12.9070945945946;23.2280405405405 12.9070945945946;22.7888513513514 12.9070945945946;22.7888513513514 12.9070945945946;22.5692567567567 12.9070945945946;22.1300675675676 12.9070945945946;22.1300675675676 12.9070945945946;21.910472972973 12.9070945945946;21.4712837837838 12.9070945945946;21.4712837837838 13.1266891891892;21.2516891891892 13.1266891891892]
%[21.0320945945946 13.785472972973;20.8125 13.785472972973;20.3733108108108 13.785472972973;19.714527027027 14.0050675675676;19.4949324324324 14.2246621621622;19.0557432432432 14.2246621621622;18.3969594594594 14.2246621621622;18.1773648648648 14.4442567567568;18.1773648648648 14.6638513513514;17.7381756756756 14.6638513513514;17.7381756756756 14.883445945946;17.0793918918919 15.1030405405405;17.0793918918919 15.3226351351351;16.8597972972973 15.3226351351351;16.4206081081081 15.5422297297297;16.4206081081081 15.7618243243243;16.4206081081081 15.7618243243243;16.2010135135135 15.7618243243243;16.2010135135135 15.9814189189189;15.7618243243243 16.2010135135135;15.7618243243243 16.2010135135135;15.5422297297297 16.4206081081081;15.5422297297297 16.6402027027027;15.1030405405405 16.6402027027027;15.1030405405405 16.8597972972973;15.1030405405405 16.8597972972973;15.1030405405405 17.0793918918919;14.8834459459459 17.2989864864865;14.4442567567567 17.5185810810811;14.4442567567567 17.7381756756757;14.2246621621621 17.9577702702703;13.7854729729729 18.1773648648649;13.7854729729729 18.3969594594595;13.7854729729729 18.3969594594595;13.5658783783784 18.6165540540541;13.1266891891892 18.8361486486487;13.1266891891892 18.8361486486487;12.9070945945946 19.0557432432433;12.4679054054054 19.2753378378378;12.4679054054054 19.4949324324324;12.2483108108108 19.4949324324324;11.8091216216216 19.4949324324324;11.8091216216216 19.714527027027;11.8091216216216 19.9341216216216;11.589527027027 19.9341216216216;11.589527027027 20.1537162162162;11.589527027027 20.3733108108108;11.589527027027 20.5929054054054;11.589527027027 20.8125;11.1503378378378 20.8125;11.1503378378378 21.0320945945946;11.1503378378378 21.0320945945946;11.1503378378378 21.2516891891892;11.1503378378378 21.4712837837838;11.1503378378378 21.6908783783784;11.1503378378378 21.910472972973;11.1503378378378 22.1300675675676;11.1503378378378 22.3496621621622;11.1503378378378 22.5692567567568;11.1503378378378 22.7888513513514;11.1503378378378 23.008445945946;11.1503378378378 23.4476351351351;11.1503378378378 23.6672297297297;11.589527027027 23.8868243243243;11.8091216216216 24.1064189189189;11.8091216216216 24.5456081081081;11.8091216216216 24.7652027027027;11.8091216216216 24.9847972972973;12.2483108108108 25.2043918918919;12.4679054054054 25.4239864864865;12.4679054054054 25.6435810810811;12.4679054054054 25.8631756756757;12.4679054054054 26.0827702702703;12.9070945945946 26.3023648648649;13.1266891891892 26.3023648648649;13.1266891891892 26.3023648648649;13.5658783783784 26.5219594594595;13.7854729729729 26.5219594594595;13.7854729729729 26.5219594594595;14.2246621621621 26.5219594594595;14.4442567567567 26.0827702702703;14.8834459459459 25.8631756756757;14.8834459459459 25.6435810810811;15.1030405405405 25.6435810810811;15.1030405405405 25.4239864864865;15.1030405405405 25.2043918918919;15.5422297297297 24.9847972972973;15.7618243243243 24.9847972972973;15.7618243243243 24.9847972972973;15.7618243243243 24.7652027027027;16.2010135135135 24.5456081081081;16.4206081081081 24.3260135135135;16.4206081081081 24.3260135135135;16.4206081081081 24.1064189189189;16.8597972972973 23.8868243243243;17.0793918918919 23.8868243243243;17.0793918918919 23.6672297297297;17.5185810810811 23.6672297297297;17.7381756756756 23.4476351351351;17.7381756756756 23.2280405405406;17.7381756756756 23.2280405405406;18.1773648648648 23.008445945946;18.3969594594594 22.7888513513514;18.3969594594594 22.7888513513514;18.8361486486486 22.5692567567568;19.0557432432432 22.5692567567568;19.0557432432432 22.5692567567568;19.0557432432432 22.3496621621622;19.4949324324324 22.3496621621622;19.714527027027 22.1300675675676;20.1537162162162 21.910472972973;20.3733108108108 21.910472972973;20.3733108108108 21.6908783783784;20.8125 21.4712837837838;20.8125 21.2516891891892;21.0320945945946 21.2516891891892;21.0320945945946 21.0320945945946;21.4712837837837 21.0320945945946;21.6908783783784 20.8125;21.6908783783784 20.5929054054054;21.6908783783784 20.3733108108108;21.6908783783784 20.1537162162162;22.1300675675676 20.1537162162162;22.3496621621621 19.9341216216216;22.7888513513513 19.714527027027;23.0084459459459 19.714527027027;23.0084459459459 19.4949324324324;23.4476351351351 19.4949324324324;23.4476351351351 19.2753378378378;23.6672297297297 19.0557432432433;23.6672297297297 18.8361486486487;24.1064189189189 18.6165540540541;24.3260135135135 18.6165540540541;24.3260135135135 18.1773648648649;24.3260135135135 18.1773648648649;24.3260135135135 17.9577702702703;24.3260135135135 17.7381756756757;24.3260135135135 17.5185810810811;24.3260135135135 17.2989864864865;24.3260135135135 17.0793918918919;24.3260135135135 16.8597972972973;24.3260135135135 16.6402027027027;24.3260135135135 16.4206081081081;24.3260135135135 16.2010135135135;24.3260135135135 15.9814189189189;24.1064189189189 15.7618243243243;23.6672297297297 15.5422297297297;23.6672297297297 15.3226351351351;23.6672297297297 14.883445945946;23.4476351351351 14.6638513513514;23.4476351351351 14.4442567567568;23.0084459459459 14.4442567567568;23.0084459459459 14.4442567567568;22.7888513513513 14.2246621621622;22.3496621621621 14.2246621621622;22.1300675675676 14.2246621621622;21.6908783783784 14.0050675675676;21.6908783783784 14.0050675675676;21.4712837837837 14.0050675675676;21.0320945945946 14.0050675675676;21.0320945945946 13.785472972973;20.8125 13.785472972973;20.3733108108108 13.785472972973;20.3733108108108 13.785472972973;20.1537162162162 13.785472972973;19.714527027027 13.785472972973]
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
saveas(gcf, 'radiomics_66/sn/glcm_1.png');
 
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
saveas(gcf, 'radiomics_66/sn/glcm_2.png');
 
% 3 GLCM 
figure3 = figure('WindowState','maximized');
subplot(2,2,1)
bar(glcm_ac)
xlim([0.5 12.5]);
title('GLCM Auto Correlation');
xlabel('Image orientation');
ylabel('Auto Correlation value');
saveas(gcf, 'radiomics_66/sn/glcm_3.png');

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

filename=('radiomics_66/sn/hp_glcm.mat');
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
saveas(gcf, 'radiomics_66/sn/glrlm_1.png');
 
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
saveas(gcf, 'radiomics_66/sn/glrlm_2.png');
 
% 3 GLRLM
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
saveas(gcf, 'radiomics_66/sn/glrlm_3.png');

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

filename=('radiomics_66/sn/hp_glrlm.mat');
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
saveas(gcf, 'radiomics_66/sn/glszm_1.png');
 
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
saveas(gcf, 'radiomics_66/sn/glszm_2.png');
 
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
saveas(gcf, 'radiomics_66/sn/glszm_3.png');

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

filename=('radiomics_66/sn/hp_glszm.mat');
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
saveas(gcf, 'radiomics_66/sn/ngtdm_1.png');
 
% 2 NGTDM
figure2 = figure('WindowState','maximized');
subplot(2,2,1);
bar(ngtdm_str, 'FaceColor',[0 0.75 0.75])
xlim([0.5 12.5]);
title('NGTDM Strength');
xlabel('Image orientation');
ylabel('Strength value'); 
saveas(gcf, 'radiomics_66/sn/ngtdm_2.png');

%% NGTDM statistics
[h_ngtdm_coa,p_ngtdm_coa,ci_ngtdm_coa,stats_ngtdm_coa] = ttest(ngtdm_coa(2:12), ngtdm_coa(1));
[h_ngtdm_con,p_ngtdm_con,ci_ngtdm_con,stats_ngtdm_con] = ttest(ngtdm_con(2:12), ngtdm_con(1));
[h_ngtdm_bus,p_ngtdm_bus,ci_ngtdm_bus,stats_ngtdm_bus] = ttest(ngtdm_bus(2:12), ngtdm_bus(1));
[h_ngtdm_com,p_ngtdm_com,ci_ngtdm_com,stats_ngtdm_com] = ttest(ngtdm_com(2:12), ngtdm_com(1));
[h_ngtdm_str,p_ngtdm_str,ci_ngtdm_str,stats_ngtdm_str] = ttest(ngtdm_str(2:12), ngtdm_str(1));

h_ngtdm=[h_ngtdm_coa,h_ngtdm_con,h_ngtdm_bus,h_ngtdm_com,h_ngtdm_str];
p_ngtdm=[p_ngtdm_coa,p_ngtdm_con,p_ngtdm_bus,p_ngtdm_com,p_ngtdm_str];

filename=('radiomics_66/sn/hp_ngtdm.mat');
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
saveas(gcf, 'radiomics_66/sn/g.png');
 
%% Global statistics
[h_g_v,p_g_v,ci_g_v,stats_g_v] = ttest(g_v(2:12), g_v(1));
[h_g_s,p_g_s,ci_g_s,stats_g_s] = ttest(g_s(2:12), g_s(1));
[h_g_k,p_g_k,ci_g_k,stats_g_k] = ttest(g_k(2:12), g_k(1));

h_g=[h_g_v,h_g_s,h_g_k];
p_g=[p_g_v,p_g_s,p_g_k];

filename=('radiomics_66/sn/hp_g.mat');
save(filename,'h_g','p_g')
%%
t_sn=zeros(12,36);
for i=1:12
    t_sn(i,:)=[glcm_ene(i),glcm_con(i),glcm_ent(i),glcm_hom(i),glcm_cor(i),glcm_sa(i),glcm_var(i),glcm_dis(i),glcm_ac(i),...
    glrlm_sre(i),glrlm_lre(i),glrlm_gln(i),glrlm_rln(i),glrlm_rp(i),glrlm_lgre(i),glrlm_hgre(i),glrlm_srhge(i),...
    glrlm_lrlge(i),glrlm_glv(i),glrlm_rlv(i),...
    glszm_sze(i),glszm_lze(i),glszm_gln(i),glszm_zsn(i),glszm_zp(i),glszm_lgze(i),glszm_hgze(i),glszm_szlge(i),...
    glszm_szhge(i),glszm_glv(i),glszm_zsv(i),...
    ngtdm_coa(i),ngtdm_con(i),ngtdm_bus(i),ngtdm_com(i),ngtdm_str(i)];
end

save('tot/t_sn','t_sn')
%%
tg_sn=zeros(12,3);
for i=1:12
    tg_sn(i,:)=[g_v(i),g_s(i),g_k(i)];
end
save('tot/tg_sn','tg_sn')