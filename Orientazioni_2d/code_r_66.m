%% loading roi 66 already modified (histogram stretching)
read66=cell(1,12);
roi66d=cell(1,12);
roi66=cell(1,12);

for i=1:12
    read66{i}=imread(sprintf('im%d_66.png',i));
    roi66{i}=read66{i}(51:115,61:125);
    roi66d{i}=double(roi66{i});
end

%% mean
m66=cell(1,12);
for i=1:12
    m66{i}=mean2(roi66{i});
end
m66=[m66{:}];

st66=cell(1,12);
for i=1:12
    st66{i}=std2(roi66{i});
end
st66=[st66{:}];

figure
x=[1,2,3,4,5,6,7,8,9,10,11,12];
bar1=bar(x,m66,'FaceColor',[0.85 0.33 0.1]);
hold on
er=errorbar(x,m66,st66);
er.Color=[0, 0, 0];
er.LineStyle = 'none';  
hold off
xlim([0.5 12.5]);
title('Mean (Roi 66)');
xlabel('Image orientation');
ylabel('Mean value');
saveas(gcf, 'roi66/m66.png');

%% skewness
s66=cell(1,12);
for i=1:12
    s66{i}=skewness(roi66d{i}(:));
end
s66=[s66{:}];

figure
bar(s66,'FaceColor',[0 0.45 0.74]);
xlim([0.5 12.5]);
title('Skewness (Roi 66)');
xlabel('Image orientation');
ylabel('Skewness value');
saveas(gcf, 'roi66/s66.png');

%% kurtosis
k66=cell(1,12);
k66_=cell(1,12);
for i=1:12
    k66{i}=kurtosis(roi66d{i}(:));
end
k66=[k66{:}];

figure
bar(k66,'FaceColor',[0.64 0.08 0.18]);
xlim([0.5 12.5]);
title('Kurtosis (Roi 66)');
xlabel('Image orientation');
ylabel('Kurtosis value');
saveas(gcf, 'roi66/k66.png');

%% Entropy
e66=cell(1,12);
for i=1:12
   e66{i}=entropy(roi66{i}); 
end
e66=[e66{:}];

figure
bar(e66,'FaceColor',[1 0.84 0]);
xlim([0.5 12.5]);
title('Entropy (Roi 66)');
xlabel('Image orientation');
ylabel('Entropy value');
saveas(gcf, 'roi66/e66.png');

%% histogram
for i=1:12
    figure
    imhist(roi66{i});
    title(sprintf('Histogram roi 66 (Orientation %d)',i));
    saveas(gcf, sprintf('roi66/h_roi%d_66.png',i));
end

%% Gray-level co-occurence matrix
cm66=cell(1,12);
for i=1:12
    cm66{i}=graycomatrix(roi66{i});
end

for i=1:12
    figure
    heatmap(cm66{i}, 'Title', sprintf('Co-occurence matrix roi 66 (Orientation %d)',i));
    saveas(gcf, sprintf('roi66/cm66_%d.png',i));
end

%% Gray-level co-occurence matrix properties
cmp66=cell(1,12);
for i=1:12
    cmp66{i}=graycoprops(cm66{i});
end
%% Contrast of co-occurrence matrixes
con_cmp66=cell(1,12);
for i=1:12
    con_cmp66{i}=cmp66{i}.Contrast;
end
con_cmp66=[con_cmp66{:}];

figure
bar(con_cmp66,'FaceColor',[0.3,0.75,0.93]);
xlim([0.5 12.5]);
title('Contrast of co-occurence matrices (Roi 66)');
xlabel('Image orientation');
ylabel('Contrast value');
saveas(gcf, 'roi66/con_cmp66.png');

%% Correlation of co-occurence matrixes
corr_cmp66=cell(1,12);
for i=1:12
    corr_cmp66{i}=cmp66{i}.Correlation;
end
corr_cmp66=[corr_cmp66{:}];

figure
bar(corr_cmp66,'FaceColor',[0.3,0.75,0.93]);
xlim([0.5 12.5]);
title('Correlation of co-occurence matrices (Roi 66)');
xlabel('Image orientation');
ylabel('Correlation value');
saveas(gcf, 'roi66/corr_cmp66.png');

%% Energy of co-occurence matrices
e_cmp66=cell(1,12);
for i=1:12
    e_cmp66{i}=cmp66{i}.Energy;
end
e_cmp66=[e_cmp66{:}];

figure
bar(e_cmp66,'FaceColor',[0.3,0.75,0.93]);
xlim([0.5 12.5]);
title('Energy of co-occurence matrices (Roi 66)');
xlabel('Image orientation');
ylabel('Energy value');
saveas(gcf, 'roi66/e_cmp66.png');

%% Homogeneity of co-occurence matrices
h_cmp66=cell(1,12);
for i=1:12
    h_cmp66{i}=cmp66{i}.Homogeneity;
end
h_cmp66=[h_cmp66{:}];

figure
bar(h_cmp66,'FaceColor',[0.3 0.75 0.93]);
xlim([0.5 12.5]);
title('Homogeneity of co-occurence matrices (Roi 66)');
xlabel('Image orientation');
ylabel('Homogeneity value');
saveas(gcf, 'roi66/h_cmp66.png');

%% Statistics roi 66
[h_m66,p_m66,ci_m66,stats_m66] = ttest(m66(2:12), m66(1));
[h_s66,p_s66,ci_s66,stats_s66] = ttest(s66(2:12), s66(1));
[h_k66,p_k66,ci_k66,stats_k66] = ttest(k66(2:12), k66(1));
[h_e66,p_e66,ci_e66,stats_e66] = ttest(e66(2:12), e66(1));
[h_con_cmp66,p_con_cmp66,ci_con_cmp66,stats_con_cmp66] = ttest(con_cmp66(2:12), con_cmp66(1));
[h_corr_cmp66,p_corr_cmp66,ci_corr_cmp66,stats_corr_cmp66] = ttest(corr_cmp66(2:12), corr_cmp66(1));
[h_e_cmp66,p_e_cmp66,ci_e_cmp66,stats_e_cmp66] = ttest(e_cmp66(2:12), e_cmp66(1));
[h_h_cmp66,p_h_cmp66,ci_h_cmp66,stats_h_cmp66] = ttest(h_cmp66(2:12), h_cmp66(1));

h_r66=[h_m66,h_s66,h_k66,h_e66,h_con_cmp66,h_corr_cmp66,h_e_cmp66,h_h_cmp66];
p_r66=[p_m66,p_s66,p_k66,p_e66,p_con_cmp66,p_corr_cmp66,p_e_cmp66,p_h_cmp66];

filename=('roi66/hp.mat');
save(filename,'h_r66','p_r66')