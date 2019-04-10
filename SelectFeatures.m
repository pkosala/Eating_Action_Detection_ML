load('data/FeatureMatrix.mat','Matrix');
size(Matrix);

% 109 label
% 110 Timestamp
% 111 group number
% 112 frame start
% 113 frame end
cols2keep=[5 6 11 12 13 14 15 16 17 18 23 24 29 33 35 38 41 45 47 50 53 59 65 71 77 83 89 95 101 107 109 110 111 112 113];
size(cols2keep);
Matrix(:,setdiff(1:size(Matrix,2),cols2keep))=[];
size(Matrix);

G = findgroups(Matrix(:,33)); % grouping by group IDs
groups = splitapply(@(x){x}, Matrix, G);

headers = ["Group_Number","DT_Accuracy","DT_Precision","DT_Recall","DT_F1Score","DT_AUC", "SVM_Accuracy", "SVM_Precision", "SVM_Recall", "SVM_F1Score","SVM_AUC","NN_Performance" ];
fone = fopen('ResultMetricsPerGroupTrained.txt', 'w') ;
ften = fopen('ResultMetricsTenGroupTrained.txt', 'w') ;
[m,v] = size(headers);
for k = 1:v
    fprintf(fone,strcat(headers(k),","));
    fprintf(ften,strcat(headers(k),","));
end
fprintf(fone, "\n" );
fprintf(ften, "\n" );

s = struct([]);
for i = 1: size(groups,1)
    s(i).features = groups{i}(:,1:30);
    s(i).label = groups{i}(:,31);
    s(i).timestamp = groups{i}(1,32);
    s(i).group_Number = groups{i}(1,33);
    s(i).frame_start = groups{i}(1,34);
    s(i).frame_end = groups{i}(1,35);
    s(i).PCA = {};
    [s(i).PCA.coeff,s(i).PCA.score,s(i).PCA.latent,s(i).PCA.tsquared, s(i).PCA.explained, s(i).PCA.mu] = pca(groups{i}(:,1:30));
    s(i).reconstructedMatrix = groups{i}(:,1:30) * s(i).PCA.coeff(:,1:3);
    [rows, columns] = size(s(i).reconstructedMatrix);
    lastRow = int32(floor(0.8 * rows)); % 80 percent of data for training and 20 % percent for testing
    
    Train = s(i).reconstructedMatrix(1:lastRow, :);
    Test  = s(i).reconstructedMatrix(lastRow+1:end, :);
    
    Train_Labels = s(i).label(1:lastRow, :);
    Test_Labels  = s(i).label(lastRow+1:end, :);
    
    s(i).DCT = fitctree(Train,Train_Labels);
    [s(i).DCT_predicted_label,scores] = predict(s(i).DCT,Test);
    scores = scores(:,2);
    [X,Y,T,DCT_AUC] = perfcurve(Test_Labels, scores,1);
    s(i).DCT_Perf = classperf(Test_Labels,s(i).DCT_predicted_label);
    
    s(i).SVM = fitcsvm(Train,Train_Labels);
    [s(i).SVM_predicted_label,scores] = predict(s(i).SVM,Test);
    scores = scores(:,2);
    [X,Y,T,SVM_AUC] = perfcurve(Test_Labels, scores,1);
    s(i).SVM_Perf = classperf(Test_Labels,s(i).SVM_predicted_label);
    
    inputs = s(i).reconstructedMatrix;
    target = s(i).label;
    hiddenLayerSize = 3;
    net = patternnet(hiddenLayerSize);
    net.divideParam.trainRatio = 70/100;
    net.divideParam.testRatio  = 30/100;
    [net,tr] = train(net,transpose(inputs),transpose(target));
    % calculating performance on test data
    tInd = tr.testInd;
    outputs = net(transpose(inputs(tInd,:)));
    errors = gsubtract(transpose(target(tInd,:)),outputs);
    performance = perform(net,transpose(target(tInd,:)),outputs);
    
%     net = feedforwardnet(10);
%     [net,tr] = train(net,transpose(Train),transpose(Train_Labels));
     
%     predictedOutputs = net(transpose(Test));
     
%     nowOfExamples = size(predictedOutputs);
%     
%     predictedClasses = zeros(1, nowOfExamples(2));
%     for i=1:nowOfExamples(2)
%         if scores(i) >= 0.5
%             predictedClasses(i) = 1;
%         end
%     end
    
    
    
    fprintf(fone, '%d,', s(i).group_Number ); 
    fprintf(fone, '%f,', s(i).DCT_Perf.CorrectRate);
    fprintf(fone, '%f,', s(i).DCT_Perf.Sensitivity);
    fprintf(fone, '%f,', s(i).DCT_Perf.PositivePredictiveValue);
    f1 = 2 * ( s(i).DCT_Perf.Sensitivity * s(i).DCT_Perf.PositivePredictiveValue / (s(i).DCT_Perf.Sensitivity + s(i).DCT_Perf.PositivePredictiveValue) );
    fprintf(fone, '%f,', f1);
    fprintf(fone, '%f,', DCT_AUC);
    
    fprintf(fone, '%f,', s(i).SVM_Perf.CorrectRate);
    fprintf(fone, '%f,', s(i).SVM_Perf.Sensitivity);
    fprintf(fone, '%f,', s(i).SVM_Perf.PositivePredictiveValue);
    f1 = 2 * ( s(i).SVM_Perf.Sensitivity * s(i).SVM_Perf.PositivePredictiveValue / (s(i).SVM_Perf.Sensitivity + s(i).SVM_Perf.PositivePredictiveValue) );
    fprintf(fone, '%f,', f1);
    fprintf(fone, '%f,', SVM_AUC);
    
    fprintf(fone, '%f', performance);
    fprintf(fone,"\n");  
end

fclose(fone);

% train on first ten classes
trainTenClass = [];
trainTenClassLabels = [];

for j = 1:10
    trainTenClass = [trainTenClass;s(j).reconstructedMatrix];
    trainTenClassLabels = [trainTenClassLabels; s(j).label];
end
% train on decision tree classifier on 10 users 
DTtenUsers = fitctree( trainTenClass, trainTenClassLabels);
% train on SVM classifier on 10 users 
SVMtenUsers = fitcsvm (trainTenClass,trainTenClassLabels);

% train neural network on 10 users
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);
[net,tr] = train(net,transpose(trainTenClass),transpose(trainTenClassLabels));

% test on each class
for j = 11:33
    [DT_predicted_labels,scores] = predict(DTtenUsers,s(j).reconstructedMatrix); 
    scores = scores(:,2);
    [X,Y,T,DT_AUC] = perfcurve(s(j).label, scores,1);
    DT_perf = classperf(s(j).label,DT_predicted_labels);
    
    fprintf(ften,'%d,', j);
    fprintf(ften, '%f,', DT_perf.CorrectRate);
    fprintf(ften, '%f,', DT_perf.Sensitivity);
    fprintf(ften, '%f,', DT_perf.PositivePredictiveValue);
    fprintf(ften, '%f,', DT_AUC);
    
    [SVM_predicted_labels,scores] = predict(SVMtenUsers,s(j).reconstructedMatrix);
    scores = scores(:,2);
    [X,Y,T,SVM_AUC] = perfcurve(s(j).label, scores,1);
    SVM_perf = classperf(s(j).label,SVM_predicted_labels);
    fprintf(ften, '%f,', SVM_perf.CorrectRate);
    fprintf(ften, '%f,', SVM_perf.Sensitivity);
    fprintf(ften, '%f,', SVM_perf.PositivePredictiveValue);
    fprintf(ften, '%f,', SVM_AUC);
    % Neural network doesn't give good accuracy
    
    fprintf(ften,"\n");
end
fclose(ften);
% saving variables to file
save('Data./PCAMatrix.mat','s');