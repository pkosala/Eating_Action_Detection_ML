% DataGeeks Group Assignement-3
%
clear;
close;

summaryData = csvread('data/final_summary.csv');
%summaryData = csvread('data/backup.txt');

fileNames = summaryData(:,2);
totalFrameNumbers = summaryData(:,3);
[row,col] = size(summaryData);

for index =  1:row

    imuFileName = strcat('data/IMU/', num2str(fileNames(index)) ,'_IMU.txt');
    emgFileName = strcat('data/EMG/', num2str(fileNames(index)), '_EMG.txt');

    imudata = csvread(imuFileName);
    emgdata = csvread(emgFileName);
    saveTimeLine = 0:1:totalFrameNumbers(index);
    startTimeVideo = fileNames(index);
    saveTimeLine = floor( saveTimeLine * (1000/30) + startTimeVideo) ;
    IMUTime = imudata(:,1);
    EMGTime = emgdata(:,1);

    OriXData = imudata(:,2);
    OriXDataNorm = ( OriXData  - min( OriXData  ) ) / ( max(OriXData) - min(OriXData) );
    InterpolatedOriXData = interp1(IMUTime , OriXDataNorm, saveTimeLine, 'spline');

    OriYData = imudata(:,3);
    OriYDataNorm = ( OriYData  - min( OriYData  ) ) / ( max(OriYData) - min(OriYData) );
    InterpolatedOriYData = interp1(IMUTime , OriYDataNorm, saveTimeLine, 'spline');

    OriZData = imudata(:,4);
    OriZDataNorm = ( OriZData  - min( OriZData  ) ) / ( max(OriZData) - min(OriZData) );
    InterpolatedOriZData = interp1(IMUTime , OriZDataNorm, saveTimeLine, 'spline');

    OriWData = imudata(:,5);
    OriWDataNorm = ( OriWData  - min( OriWData  ) ) / ( max(OriWData) - min(OriWData) );
    InterpolatedOriWData = interp1(IMUTime , OriWDataNorm, saveTimeLine, 'spline');

    AccXData = imudata(:,6);
    AccXDataNorm = ( AccXData  - min( AccXData ) ) / ( max(AccXData) - min(AccXData) );
    InterpolatedAccXData = interp1(IMUTime , AccXDataNorm, saveTimeLine, 'spline');

    AccYData = imudata(:,7);
    AccYDataNorm = ( AccYData  - min( AccYData ) ) / ( max(AccYData) - min(AccYData) );
    InterpolatedAccYData = interp1(IMUTime , AccYDataNorm, saveTimeLine, 'spline');

    AccZData = imudata(:,8);
    AccZDataNorm = ( AccZData  - min( AccZData ) ) / ( max(AccZData) - min(AccZData) );
    InterpolatedAccZData = interp1(IMUTime , AccZDataNorm, saveTimeLine, 'spline');

    GyrXData = imudata(:,9);
    GyrXDataNorm = ( GyrXData  - min( GyrXData ) ) / ( max(GyrXData) - min(GyrXData) );
    InterpolatedGyrXData = interp1(IMUTime , GyrXDataNorm, saveTimeLine, 'spline');

    GyrYData = imudata(:,10);
    GyrYDataNorm = ( GyrYData  - min(GyrYData) ) / ( max(GyrYData) - min(GyrYData) );
    InterpolatedGyrYData = interp1(IMUTime , GyrYDataNorm, saveTimeLine, 'spline');

    GyrZData = imudata(:,11);
    GyrZDataNorm = ( GyrZData  - min( GyrZData ) ) / ( max(GyrZData) - min(GyrZData) );
    InterpolatedGyrZData = interp1(IMUTime , GyrZDataNorm, saveTimeLine, 'spline');

    % debug print disp(InterpolatedOriXData(291:312));

    % EMG  
    Emg1Data = emgdata(:,2);
    Emg1DataNorm = ( Emg1Data  - min(Emg1Data) ) / ( max(Emg1Data) - min(Emg1Data) );
    InterpolatedEmg1Data = interp1(EMGTime , Emg1DataNorm, saveTimeLine, 'spline');

    Emg2Data = emgdata(:,3);
    Emg2DataNorm = ( Emg2Data  - min(Emg2Data) ) / ( max(Emg2Data) - min(Emg2Data) );
    InterpolatedEmg2Data = interp1(EMGTime , Emg2DataNorm, saveTimeLine, 'spline');

    Emg3Data = emgdata(:,4);
    Emg3DataNorm = ( Emg3Data  - min(Emg3Data) ) / ( max(Emg3Data) - min(Emg3Data) );
    InterpolatedEmg3Data = interp1(EMGTime , Emg3DataNorm, saveTimeLine, 'spline');

    Emg4Data = emgdata(:,5);
    Emg4DataNorm = ( Emg4Data  - min(Emg4Data) ) / ( max(Emg4Data) - min(Emg4Data) );
    InterpolatedEmg4Data = interp1(EMGTime , Emg4DataNorm, saveTimeLine, 'spline');

    Emg5Data = emgdata(:,6);
    Emg5DataNorm = ( Emg5Data  - min(Emg5Data) ) / ( max(Emg5Data) - min(Emg5Data) );
    InterpolatedEmg5Data = interp1(EMGTime , Emg5DataNorm, saveTimeLine, 'spline');

    Emg6Data = emgdata(:,7);
    Emg6DataNorm = ( Emg6Data  - min(Emg6Data) ) / ( max(Emg6Data) - min(Emg6Data) );
    InterpolatedEmg6Data = interp1(EMGTime , Emg6DataNorm, saveTimeLine, 'spline');

    Emg7Data = emgdata(:,8);
    Emg7DataNorm = ( Emg7Data  - min(Emg7Data) ) / ( max(Emg7Data) - min(Emg7Data) );
    InterpolatedEmg7Data = interp1(EMGTime , Emg7DataNorm, saveTimeLine, 'spline');

    Emg8Data = emgdata(:,9);
    Emg8DataNorm = ( Emg8Data  - min(Emg8Data) ) / ( max(Emg8Data) - min(Emg8Data) );
    InterpolatedEmg8Data = interp1(EMGTime , Emg8DataNorm, saveTimeLine, 'spline');

    % this needs to change for spoon data
    % 4451 are no of frames
    % 1503701484723 annoted file fork
    % change files names eating Fork and noneating fork
    N = 0:1:totalFrameNumbers(index);
    annotationFile = strcat('data/Annotation/', num2str(fileNames(index)),'.txt');
    M = dlmread(annotationFile);
    
    outputDirPathStep1 = 'output-step1';
    if ~exist(outputDirPathStep1, 'dir')
        mkdir(outputDirPathStep1);
    end
    
    outputDirPathStep2 = 'output-step2';
    if ~exist(outputDirPathStep2, 'dir')
        mkdir(outputDirPathStep2);
    end
   
    feat = fopen(strcat('output-step1/',num2str(fileNames(index)), '_Eating.csv'), 'w') ;
    fnoneat = fopen(strcat('output-step1/',num2str(fileNames(index)),'_NonEating.csv'), 'w') ;
    
    featureMatrixEating = fopen(strcat('output-step2/',num2str(fileNames(index)),'_FeatureMatrixEating.csv'), 'w');
    featureMatrixNonEating = fopen(strcat('output-step2/',num2str(fileNames(index)),'_FeatureMatrixNonEating.csv'), 'w');
    
    [r,c] = size(M);
    notEatStart = 1;

    timems = 1:1:totalFrameNumbers(index);
    %plot(timems,InterpolatedOriXData,'r','LineWidth',2);

%     figure(1);hold on;title('OrientationX');
%     figure(2);hold on;title('OrientationY');
%     figure(3);hold on;title('OrientationZ');
%     figure(4);hold on;title('OrientationW');
%     figure(5);hold on;title('AccelerometerX');
%     figure(6);hold on;title('AccelerometerY');
%     figure(7);hold on;title('AccelerometerZ');
%     figure(8);hold on;title('GyroscopeX');
%     figure(9);hold on;title('GyroscopeY');
%     figure(10);hold on;title('GyroscopeZ');
%     figure(11);hold on;title('EMG1');
%     figure(12);hold on;title('EMG2');
%     figure(13);hold on;title('EMG3');
%     figure(14);hold on;title('EMG4');
%     figure(15);hold on;title('EMG5');
%     figure(16);hold on;title('EMG6');
%     figure(17);hold on;title('EMG7');
%     figure(18);hold on;title('EMG8');


    for i = 1:r
        frameEatStart = M(i,1);
        frameEatEnd = M(i,2);

        eatingHeader = strcat( 'EatingAction', num2str(i));   
        nonEatingHeader = strcat( 'NonEatingAction', num2str(i));

        fprintf(featureMatrixEating, '%s,', eatingHeader );
        
        % OriX 
        fprintf(feat, '%s,', strcat(eatingHeader,'OriX'));
        fprintf(feat, '%f,', InterpolatedOriXData(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

        fprintf(featureMatrixEating, '%f,', mean(InterpolatedOriXData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedOriXData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedOriXData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedOriXData(frameEatStart:frameEatEnd)));
        
        % OriY
        fprintf(feat, '%s,', strcat(eatingHeader,'OriY'));
        fprintf(feat, '%f,', InterpolatedOriYData(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(2);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedOriYData(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');
        
        fprintf(featureMatrixEating, '%f,', mean(InterpolatedOriYData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedOriYData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedOriYData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedOriYData(frameEatStart:frameEatEnd)));

        %OriZ
        fprintf(feat, '%s,', strcat(eatingHeader,'OriZ'));
        fprintf(feat, '%f,', InterpolatedOriZData(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

        fprintf(featureMatrixEating, '%f,', mean(InterpolatedOriZData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedOriZData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedOriZData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedOriZData(frameEatStart:frameEatEnd)));
       
        %OriW
        fprintf(feat, '%s,', strcat(eatingHeader,'OriW'));
        fprintf(feat, '%f,', InterpolatedOriWData(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(4);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedOriWData(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');
        
        fprintf(featureMatrixEating, '%f,', mean(InterpolatedOriWData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedOriWData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedOriWData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedOriWData(frameEatStart:frameEatEnd)));

        %AccX
        fprintf(feat, '%s,', strcat(eatingHeader,'AccX'));
        fprintf(feat, '%f,', InterpolatedAccXData(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(5);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedAccXData(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');
        
        fprintf(featureMatrixEating, '%f,', mean(InterpolatedAccXData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedAccXData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedAccXData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedAccXData(frameEatStart:frameEatEnd)));
        
        %AccY
        fprintf(feat, '%s,', strcat(eatingHeader,'AccY'));
        fprintf(feat, '%f,', InterpolatedAccYData(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(6);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedAccYData(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');

        fprintf(featureMatrixEating, '%f,', mean(InterpolatedAccYData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedAccYData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedAccYData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedAccYData(frameEatStart:frameEatEnd)));
        
        
        %AccZ
        fprintf(feat, '%s,', strcat(eatingHeader,'AccZ'));
        fprintf(feat, '%f,', InterpolatedAccZData(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(7);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedAccZData(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');

        fprintf(featureMatrixEating, '%f,', mean(InterpolatedAccZData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedAccZData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedAccZData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedAccZData(frameEatStart:frameEatEnd)));
        
        
        
        %GyrX
        fprintf(feat, '%s,', strcat(eatingHeader,'GyrX'));
        fprintf(feat, '%f,', InterpolatedGyrXData(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(8);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedGyrXData(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');

        fprintf(featureMatrixEating, '%f,', mean(InterpolatedGyrXData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedGyrXData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedGyrXData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedGyrXData(frameEatStart:frameEatEnd)));
        
        
        
        %GyrY
        fprintf(feat, '%s,', strcat(eatingHeader,'GyrY'));
        fprintf(feat, '%f,', InterpolatedGyrYData(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(9);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedGyrYData(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');

        fprintf(featureMatrixEating, '%f,', mean(InterpolatedGyrYData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedGyrYData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedGyrYData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedGyrYData(frameEatStart:frameEatEnd)));
        
        %GyrZ
        fprintf(feat, '%s,', strcat(eatingHeader,'GyrZ'));
        fprintf(feat, '%f,', InterpolatedGyrZData(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(10);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedGyrZData(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');

        fprintf(featureMatrixEating, '%f,', mean(InterpolatedGyrZData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedGyrZData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedGyrZData(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedGyrZData(frameEatStart:frameEatEnd)));
        
        
        %Emg1
        fprintf(feat, '%s,', strcat(eatingHeader,'Emg1'));
        fprintf(feat, '%f,', InterpolatedEmg1Data(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(11);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedEmg1Data(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');
        
        fprintf(featureMatrixEating, '%f,', mean(InterpolatedEmg1Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedEmg1Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedEmg1Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedEmg1Data(frameEatStart:frameEatEnd)));
        
        %Emg2
        fprintf(feat, '%s,', strcat(eatingHeader,'Emg2'));
        fprintf(feat, '%f,', InterpolatedEmg2Data(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(12);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedEmg2Data(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');
        
        fprintf(featureMatrixEating, '%f,', mean(InterpolatedEmg2Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedEmg2Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedEmg2Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedEmg2Data(frameEatStart:frameEatEnd)));
        
        %Emg3
        fprintf(feat, '%s,', strcat(eatingHeader,'Emg3'));
        fprintf(feat, '%f,', InterpolatedEmg3Data(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(13);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedEmg3Data(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');

        fprintf(featureMatrixEating, '%f,', mean(InterpolatedEmg3Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedEmg3Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedEmg3Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedEmg3Data(frameEatStart:frameEatEnd)));
        
        %Emg4
        fprintf(feat, '%s,', strcat(eatingHeader,'Emg4'));
        fprintf(feat, '%f,', InterpolatedEmg4Data(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(14);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedEmg4Data(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');

        fprintf(featureMatrixEating, '%f,', mean(InterpolatedEmg4Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedEmg4Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedEmg4Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedEmg4Data(frameEatStart:frameEatEnd)));
        
        %Emg5
        fprintf(feat, '%s,', strcat(eatingHeader,'Emg5'));
        fprintf(feat, '%f,', InterpolatedEmg5Data(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(15);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedEmg5Data(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');

        fprintf(featureMatrixEating, '%f,', mean(InterpolatedEmg5Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedEmg5Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedEmg5Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedEmg5Data(frameEatStart:frameEatEnd)));
        
        %Emg6
        fprintf(feat, '%s,', strcat(eatingHeader,'Emg6'));
        fprintf(feat, '%f,', InterpolatedEmg6Data(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(16);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedEmg6Data(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');

        fprintf(featureMatrixEating, '%f,', mean(InterpolatedEmg6Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedEmg6Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedEmg6Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedEmg6Data(frameEatStart:frameEatEnd)));
        
        %Emg7
        fprintf(feat, '%s,', strcat(eatingHeader,'Emg7'));
        fprintf(feat, '%f,', InterpolatedEmg7Data(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(17);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedEmg7Data(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');

        fprintf(featureMatrixEating, '%f,', mean(InterpolatedEmg7Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedEmg7Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedEmg7Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedEmg7Data(frameEatStart:frameEatEnd)));
        
        %Emg8
        fprintf(feat, '%s,', strcat(eatingHeader,'Emg8'));
        fprintf(feat, '%f,', InterpolatedEmg8Data(frameEatStart:frameEatEnd));
        fprintf(feat,"\n");

%         figure(18);
%         plot(timems(frameEatStart:frameEatEnd),InterpolatedEmg8Data(frameEatStart:frameEatEnd),'.', 'MarkerEdgeColor','r');

        fprintf(featureMatrixEating, '%f,', mean(InterpolatedEmg8Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', max(InterpolatedEmg8Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', std(InterpolatedEmg8Data(frameEatStart:frameEatEnd)));
        fprintf(featureMatrixEating, '%f,', rms(InterpolatedEmg8Data(frameEatStart:frameEatEnd)));
        
        fprintf(featureMatrixEating,"\n");
        
        % Non eating actions
        fprintf(featureMatrixNonEating, '%s,', nonEatingHeader );
        %OriX
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'OriX'));
        fprintf(fnoneat, '%f,', InterpolatedOriXData(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");
        
%         figure(1);
%         plot(timems(notEatStart:frameEatStart),InterpolatedOriXData(notEatStart:frameEatStart),'b');

        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedOriXData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedOriXData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedOriXData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedOriXData(notEatStart:frameEatStart)));
        
 
        %OriY
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'OriY'));
        fprintf(fnoneat, '%f,', InterpolatedOriYData(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(2);
%         plot(timems(notEatStart:frameEatStart),InterpolatedOriYData(notEatStart:frameEatStart),'b');

        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedOriYData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedOriYData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedOriYData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedOriYData(notEatStart:frameEatStart)));
        
        %OriZ
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'OriZ'));
        fprintf(fnoneat, '%f,', InterpolatedOriZData(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(3);
%         plot(timems(notEatStart:frameEatStart),InterpolatedOriZData(notEatStart:frameEatStart),'b');
        
        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedOriZData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedOriZData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedOriZData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedOriZData(notEatStart:frameEatStart)));

        %OriW
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'OriW'));
        fprintf(fnoneat, '%f,', InterpolatedOriWData(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(4);
%         plot(timems(notEatStart:frameEatStart),InterpolatedOriWData(notEatStart:frameEatStart),'b');
        
        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedOriWData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedOriWData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedOriWData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedOriWData(notEatStart:frameEatStart)));

        %AccX
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'AccX'));
        fprintf(fnoneat, '%f,', InterpolatedAccXData(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(5);
%         plot(timems(notEatStart:frameEatStart),InterpolatedAccXData(notEatStart:frameEatStart),'b');
        
        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedAccXData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedAccXData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedAccXData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedAccXData(notEatStart:frameEatStart)));
        

        %AccY
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'AccY'));
        fprintf(fnoneat, '%f,', InterpolatedAccYData(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(6);
%         plot(timems(notEatStart:frameEatStart),InterpolatedAccYData(notEatStart:frameEatStart),'b');

        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedAccYData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedAccYData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedAccYData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedAccYData(notEatStart:frameEatStart)));
        
        %AccZ
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'AccZ'));
        fprintf(fnoneat, '%f,', InterpolatedAccZData(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(7);
%         plot(timems(notEatStart:frameEatStart),InterpolatedAccZData(notEatStart:frameEatStart),'b');

        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedAccZData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedAccZData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedAccZData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedAccZData(notEatStart:frameEatStart)));
        
        %GyrX
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'GyrX'));
        fprintf(fnoneat, '%f,', InterpolatedGyrXData(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(8);
%         plot(timems(notEatStart:frameEatStart),InterpolatedGyrXData(notEatStart:frameEatStart),'b');
        
        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedGyrXData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedGyrXData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedGyrXData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedGyrXData(notEatStart:frameEatStart)));

        %GyrY
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'GyrY'));
        fprintf(fnoneat, '%f,', InterpolatedGyrYData(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(9);
%         plot(timems(notEatStart:frameEatStart),InterpolatedGyrYData(notEatStart:frameEatStart),'b');

        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedGyrYData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedGyrYData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedGyrYData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedGyrYData(notEatStart:frameEatStart)));
        
        %GyrZ
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'GyrZ'));
        fprintf(fnoneat, '%f,', InterpolatedGyrZData(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(10);
%         plot(timems(notEatStart:frameEatStart),InterpolatedGyrZData(notEatStart:frameEatStart),'b');

        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedGyrZData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedGyrZData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedGyrZData(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedGyrZData(notEatStart:frameEatStart)));
        
        %Emg1
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg1'));
        fprintf(fnoneat, '%f,', InterpolatedEmg1Data(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(11);
%         plot(timems(notEatStart:frameEatStart),InterpolatedEmg1Data(notEatStart:frameEatStart),'b');
        
        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedEmg1Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedEmg1Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedEmg1Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedEmg1Data(notEatStart:frameEatStart)));
        

        %Emg2
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg2'));
        fprintf(fnoneat, '%f,', InterpolatedEmg2Data(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(12);
%         plot(timems(notEatStart:frameEatStart),InterpolatedEmg2Data(notEatStart:frameEatStart),'b');
        
        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedEmg2Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedEmg2Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedEmg2Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedEmg2Data(notEatStart:frameEatStart)));
        

        %Emg3
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg3'));
        fprintf(fnoneat, '%f,', InterpolatedEmg3Data(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(13);
%         plot(timems(notEatStart:frameEatStart),InterpolatedEmg3Data(notEatStart:frameEatStart),'b');
        
        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedEmg3Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedEmg3Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedEmg3Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedEmg3Data(notEatStart:frameEatStart)));

        %Emg4
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg4'));
        fprintf(fnoneat, '%f,', InterpolatedEmg4Data(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(14);
%         plot(timems(notEatStart:frameEatStart),InterpolatedEmg4Data(notEatStart:frameEatStart),'b');
        
        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedEmg4Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedEmg4Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedEmg4Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedEmg4Data(notEatStart:frameEatStart)));

        %Emg5
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg5'));
        fprintf(fnoneat, '%f,', InterpolatedEmg5Data(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(15);
%         plot(timems(notEatStart:frameEatStart),InterpolatedEmg5Data(notEatStart:frameEatStart),'b');
        
        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedEmg5Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedEmg5Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedEmg5Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedEmg5Data(notEatStart:frameEatStart)));

        %Emg6
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg6'));
        fprintf(fnoneat, '%f,', InterpolatedEmg6Data(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(16);
%         plot(timems(notEatStart:frameEatStart),InterpolatedEmg6Data(notEatStart:frameEatStart),'b');
        
        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedEmg6Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedEmg6Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedEmg6Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedEmg6Data(notEatStart:frameEatStart)));
        

        %Emg7
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg7'));
        fprintf(fnoneat, '%f,', InterpolatedEmg7Data(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(17);
%         plot(timems(notEatStart:frameEatStart),InterpolatedEmg7Data(notEatStart:frameEatStart),'b');

        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedEmg7Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedEmg7Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedEmg7Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedEmg7Data(notEatStart:frameEatStart)));
        
        %Emg8
        fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg8'));
        fprintf(fnoneat, '%f,', InterpolatedEmg8Data(notEatStart:frameEatStart));
        fprintf(fnoneat,"\n");

%         figure(18);
%         plot(timems(notEatStart:frameEatStart),InterpolatedEmg8Data(notEatStart:frameEatStart),'b');
        
        fprintf(featureMatrixNonEating, '%f,', mean(InterpolatedEmg8Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', max(InterpolatedEmg8Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', std(InterpolatedEmg8Data(notEatStart:frameEatStart)));
        fprintf(featureMatrixNonEating, '%f,', rms(InterpolatedEmg8Data(notEatStart:frameEatStart)));
        
        fprintf(featureMatrixNonEating,"\n");

        notEatStart = frameEatEnd;

    end

    fclose(feat) ;
    fclose(fnoneat);


%     for l = 1:18
%         figure(l)
%         legend('y = Eating Action','y = Non Eating Action');
%     end

%     saveas(figure(1),'OrientationX.jpg');
%     saveas(figure(2),'OrientationY.jpg');
%     saveas(figure(3),'OrientationZ.jpg');
%     saveas(figure(4),'OrientationW.jpg');
%     saveas(figure(5),'AccelerometerX.jpg');
%     saveas(figure(6),'AccelerometerY.jpg');
%     saveas(figure(7),'AccelerometerZ.jpg');
%     saveas(figure(8),'GyroscopeX.jpg');
%     saveas(figure(9),'GyroscopeY.jpg');
%     saveas(figure(10),'GyroscopeZ.jpg');
%     saveas(figure(11),'Emg1.jpg');
%     saveas(figure(12),'Emg2.jpg');
%     saveas(figure(13),'Emg3.jpg');
%     saveas(figure(14),'Emg4.jpg');
%     saveas(figure(15),'Emg5.jpg');
%     saveas(figure(16),'Emg6.jpg');
%     saveas(figure(17),'Emg7.jpg');
%     saveas(figure(18),'Emg8.jpg');
% 
%     hold off
%     delete(findall(0,'Type','figure'))

end





