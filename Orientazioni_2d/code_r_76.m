%% loading roi 76 already modified (histogram stretching)
read76=cell(1,12);
roi76d=cell(1,12);
roi76=cell(1,12);
 
for i=1:12
    read76{i}=imread(sprintf('im%d_76.png',i));
    roi76{i}=read76{i}(51:115,41:105);
    roi76d{i}=double(roi76{i});
end
 
%% mean
m76=cell(1,12);
for i=1:12
    m76{i}=mean2(roi76{i});
end
m76=[m76{:}];

st76=cell(1,12);
for i=1:12
    st76{i}=std2(roi76{i});
end
st76=[st76{:}];

figure
x=[1,2,3,4,5,6,7,8,9,10,11,12];
bar1=bar(x,m76,'FaceColor',[0.85 0.33 0.1]);
hold on
er=errorbar(x,m76,st76);
er.Color=[0, 0, 0];
er.LineStyle = 'none';  
hold off
xlim([0.5 12.5]);
title('Mean (Roi 76)');
xlabel('Image orientation');
ylabel('Mean value');
saveas(gcf, 'roi76/m76.png');

%% skewness
s76=cell(1,12);
for i=1:12
    s76{i}=skewness(roi76d{i}(:));
end
s76=[s76{:}];

figure
bar(s76,'FaceColor',[0 0.45 0.74]);
xlim([0.5 12.5]);
title('Skewness (Roi 76)');
xlabel('Image orientation');
ylabel('Skewness value');
saveas(gcf, 'roi76/s76.png');

%% kurtosis
k76=cell(1,12);
k76_=cell(1,12);
for i=1:12
    k76{i}=kurtosis(roi76d{i}(:));
end
k76=[k76{:}];

figure
bar(k76,'FaceColor',[0.64 0.08 0.18]);
xlim([0.5 12.5]);
title('Kurtosis (Roi 76)');
xlabel('Image orientation');
ylabel('Kurtosis value');
saveas(gcf, 'roi76/k76.png');

%% Entropy
e76=cell(1,12);
for i=1:12
   e76{i}=entropy(roi76{i}); 
end
e76=[e76{:}];

figure
bar(e76,'FaceColor',[1 0.84 0]);
xlim([0.5 12.5]);
title('Entropy (Roi 76)');
xlabel('Image orientation');
ylabel('Entropy value');
saveas(gcf, 'roi76/e76.png');

%% histogram
for i=1:12
    figure
    imhist(roi76{i});
    title(sprintf('Histogram roi 76 (Orientation %d)',i));
    saveas(gcf, sprintf('roi76/h_roi%d_76.png',i));
end

%% Gray-level co-occurence matrix
cm76=cell(1,12);
for i=1:12
    cm76{i}=graycomatrix(roi76{i});
end

for i=1:12
    figure
    heatmap(cm76{i}, 'Title', sprintf('Co-occurence matrix roi 76 (Orientation %d)',i));
    saveas(gcf, sprintf('roi76/cm76_%d.png',i));
end

%% Gray-level co-occurence matrix properties
cmp76=cell(1,12);
for i=1:12
    cmp76{i}=graycoprops(cm76{i});
end
%% Contrast of co-occurrence matrixes
con_cmp76=cell(1,12);
for i=1:12
    con_cmp76{i}=cmp76{i}.Contrast;
end
con_cmp76=[con_cmp76{:}];

figure
bar(con_cmp76,'FaceColor',[0.3,0.75,0.93]);
xlim([0.5 12.5]);
title('Contrast of co-occurence matrices (Roi 76)');
xlabel('Image orientation');
ylabel('Contrast value');
saveas(gcf, 'roi76/con_cmp76.png');

%% Correlation of co-occurence matrixes
corr_cmp76=cell(1,12);
for i=1:12
    corr_cmp76{i}=cmp76{i}.Correlation;
end
corr_cmp76=[corr_cmp76{:}];

figure
bar(corr_cmp76,'FaceColor',[0.3,0.75,0.93]);
xlim([0.5 12.5]);
title('Correlation of co-occurence matrices (Roi 76)');
xlabel('Image orientation');
ylabel('Correlation value');
saveas(gcf, 'roi76/corr_cmp76.png');

%% Energy of co-occurence matrices
e_cmp76=cell(1,12);
for i=1:12
    e_cmp76{i}=cmp76{i}.Energy;
end
e_cmp76=[e_cmp76{:}];

figure
bar(e_cmp76,'FaceColor',[0.3,0.75,0.93]);
xlim([0.5 12.5]);
title('Energy of co-occurence matrices (Roi 76)');
xlabel('Image orientation');
ylabel('Energy value');
saveas(gcf, 'roi76/e_cmp76.png');

%% Homogeneity of co-occurence matrices
h_cmp76=cell(1,12);
for i=1:12
    h_cmp76{i}=cmp76{i}.Homogeneity;
end
h_cmp76=[h_cmp76{:}];

figure
bar(h_cmp76,'FaceColor',[0.3 0.75 0.93]);
xlim([0.5 12.5]);
title('Homogeneity of co-occurence matrices (Roi 76)');
xlabel('Image orientation');
ylabel('Homogeneity value');
saveas(gcf, 'roi76/h_cmp76.png');

%% Statistics roi76
[h_m76,p_m76,ci_m76,stats_m76] = ttest(m76(2:12), m76(1));
[h_s76,p_s76,ci_s76,stats_s76] = ttest(s76(2:12), s76(1));
[h_k76,p_k76,ci_k76,stats_k76] = ttest(k76(2:12), k76(1));
[h_e76,p_e76,ci_e76,stats_e76] = ttest(e76(2:12), e76(1));
[h_con_cmp76,p_con_cmp76,ci_con_cmp76,stats_con_cmp76] = ttest(con_cmp76(2:12), con_cmp76(1));
[h_corr_cmp76,p_corr_cmp76,ci_corr_cmp76,stats_corr_cmp76] = ttest(corr_cmp76(2:12), corr_cmp76(1));
[h_e_cmp76,p_e_cmp76,ci_e_cmp76,stats_e_cmp76] = ttest(e_cmp76(2:12), e_cmp76(1));
[h_h_cmp76,p_h_cmp76,ci_h_cmp76,stats_h_cmp76] = ttest(h_cmp76(2:12), h_cmp76(1));

h_r76=[h_m76,h_s76,h_k76,h_e76,h_con_cmp76,h_corr_cmp76,h_e_cmp76,h_h_cmp76];
p_r76=[p_m76,p_s76,p_k76,p_e76,p_con_cmp76,p_corr_cmp76,p_e_cmp76,p_h_cmp76];

filename=('roi76/hp.mat');
save(filename,'h_r76','p_r76')