clear;
close;
% step 1
% saveTimeLine 4451 is no of frames in fork video. change it when you use
% it for spoon. Also change files names for IMU and EMG
imudata = csvread('fork/1503701484723_IMU.txt');
emgdata = csvread('fork/1503701484723_EMG.txt');
saveTimeLine = 0:1:4451;
saveTimeLine = floor( saveTimeLine * (1000/30) + 1503701484723 );
% change this offset 1503701484723 to start time of spoon 
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
N = 0:1:4451;
M = dlmread('1503701484723.txt');
%feat = fopen('EatingFork.csv', 'w') ;
%fnoneat = fopen('NonEatingFork.csv', 'w') ;

%en = fopen('NewEatingAttributes.csv','at+');
%nen = fopen('NewNonEatingAttributes.csv','at+');
[r,c] = size(M);
notEatStart = 1;

timems = 1:1:4452;
%plot(timems,InterpolatedOriXData,'r','LineWidth',2);



figure(1);hold on;title('maxOrientationX');
figure(2);hold on;title('maxOrientationY');
figure(3);hold on;title('maxOrientationZ');
figure(4);hold on;title('maxOrientationW');
figure(5);hold on;title('maxAccelerometerX');
figure(6);hold on;title('maxAccelerometerY');
figure(7);hold on;title('maxAccelerometerZ');
figure(8);hold on;title('maxGyroscopeX');
figure(9);hold on;title('maxGyroscopeY');
figure(10);hold on;title('maxGyroscopeZ');
figure(11);hold on;title('maxEMG1');
figure(12);hold on;title('maxEMG2');
figure(13);hold on;title('maxEMG3');
figure(14);hold on;title('maxEMG4');
figure(15);hold on;title('maxEMG5');
figure(16);hold on;title('maxEMG6');
figure(17);hold on;title('maxEMG7');
figure(18);hold on;title('maxEMG8');






for i = 1:r
    frameEatStart = M(i,1);
    frameEatEnd = M(i,2);
    
%     eatingHeader = strcat( 'EatingAction', num2str(i));   
%     nonEatingHeader = strcat( 'NonEatingAction', num2str(i));
    
    % OriX 
%     fprintf(feat, '%s,', strcat(eatingHeader,'OriX'));
%     fprintf(feat, '%f,', InterpolatedOriXData(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%    
%     fprintf(en, '%s,', strcat(eatingHeader,'maxOriX'));
%     fprintf(en, '%f,', max(InterpolatedOriXData(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    figure(1);
    bar(timems(i),max(InterpolatedOriXData(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    
    
    
    
    
    % OriY
%     fprintf(feat, '%s,', strcat(eatingHeader,'OriY'));
%     fprintf(feat, '%f,', InterpolatedOriYData(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxOriY'));
%     fprintf(en, '%f,', max(InterpolatedOriYData(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    figure(2);
    bar(timems(i),max(InterpolatedOriYData(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    
    
    %OriZ
%     fprintf(feat, '%s,', strcat(eatingHeader,'OriZ'));
%     fprintf(feat, '%f,', InterpolatedOriZData(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxOriZ'));
%     fprintf(en, '%f,', max(InterpolatedOriZData(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    
    figure(3);
    bar(timems(i),max(InterpolatedOriZData(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    %OriW
%     fprintf(feat, '%s,', strcat(eatingHeader,'OriW'));
%     fprintf(feat, '%f,', InterpolatedOriWData(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxOriW'));
%     fprintf(en, '%f,', max(InterpolatedOriWData(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    
    figure(4);
    bar(timems(i),max(InterpolatedOriWData(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    %AccX
%     fprintf(feat, '%s,', strcat(eatingHeader,'AccX'));
%     fprintf(feat, '%f,', InterpolatedAccXData(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxAccX'));
%     fprintf(en, '%f,', max(InterpolatedAccXData(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    
    figure(5);
    bar(timems(i),max(InterpolatedAccXData(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    %AccY
%     fprintf(feat, '%s,', strcat(eatingHeader,'AccY'));
%     fprintf(feat, '%f,', InterpolatedAccYData(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxAccY'));
%     fprintf(en, '%f,', max(InterpolatedAccYData(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
%     
    figure(6);
    bar(timems(i),max(InterpolatedAccYData(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    %AccZ
%     fprintf(feat, '%s,', strcat(eatingHeader,'AccZ'));
%     fprintf(feat, '%f,', InterpolatedAccZData(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxAccZ'));
%     fprintf(en, '%f,', max(InterpolatedAccZData(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    
    figure(7);
    bar(timems(i),max(InterpolatedAccZData(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    %GyrX
%     fprintf(feat, '%s,', strcat(eatingHeader,'GyrX'));
%     fprintf(feat, '%f,', InterpolatedGyrXData(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxGyrX'));
%     fprintf(en, '%f,', max(InterpolatedGyrXData(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    
    figure(8);
    bar(timems(i),max(InterpolatedGyrXData(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    %GyrY
%     fprintf(feat, '%s,', strcat(eatingHeader,'GyrY'));
%     fprintf(feat, '%f,', InterpolatedGyrYData(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxGyrY'));
%     fprintf(en, '%f,', max(InterpolatedGyrYData(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    
    figure(9);
    bar(timems(i),max(InterpolatedGyrYData(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    %GyrZ
%     fprintf(feat, '%s,', strcat(eatingHeader,'GyrZ'));
%     fprintf(feat, '%f,', InterpolatedGyrZData(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxGyrZ'));
%     fprintf(en, '%f,', max(InterpolatedGyrZData(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
%     
    figure(10);
    bar(timems(i),max(InterpolatedGyrZData(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    %Emg1
%     fprintf(feat, '%s,', strcat(eatingHeader,'Emg1'));
%     fprintf(feat, '%f,', InterpolatedEmg1Data(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxEmg1'));
%     fprintf(en, '%f,', max(InterpolatedEmg1Data(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    
    figure(11);
    bar(timems(i),max(InterpolatedEmg1Data(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    %Emg2
%     fprintf(feat, '%s,', strcat(eatingHeader,'Emg2'));
%     fprintf(feat, '%f,', InterpolatedEmg2Data(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxEmg2'));
%     fprintf(en, '%f,', max(InterpolatedEmg2Data(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    
    figure(12);
    bar(timems(i),max(InterpolatedEmg2Data(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    %Emg3
%     fprintf(feat, '%s,', strcat(eatingHeader,'Emg3'));
%     fprintf(feat, '%f,', InterpolatedEmg3Data(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxEmg3'));
%     fprintf(en, '%f,', max(InterpolatedEmg3Data(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
%     
    figure(13);
    bar(timems(i),max(InterpolatedEmg3Data(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    %Emg4
%     fprintf(feat, '%s,', strcat(eatingHeader,'Emg4'));
%     fprintf(feat, '%f,', InterpolatedEmg4Data(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxEmg4'));
%     fprintf(en, '%f,', max(InterpolatedEmg4Data(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    
    figure(14);
    bar(timems(i),max(InterpolatedEmg4Data(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    %Emg5
%     fprintf(feat, '%s,', strcat(eatingHeader,'Emg5'));
%     fprintf(feat, '%f,', InterpolatedEmg5Data(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxEmg5'));
%     fprintf(en, '%f,', max(InterpolatedEmg5Data(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    
    figure(15);
    bar(timems(i),max(InterpolatedEmg5Data(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    %Emg6
%     fprintf(feat, '%s,', strcat(eatingHeader,'Emg6'));
%     fprintf(feat, '%f,', InterpolatedEmg6Data(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxEmg6'));
%     fprintf(en, '%f,', max(InterpolatedEmg6Data(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    
    figure(16);
    bar(timems(i),max(InterpolatedEmg6Data(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    %Emg7
%     fprintf(feat, '%s,', strcat(eatingHeader,'Emg7'));
%     fprintf(feat, '%f,', InterpolatedEmg7Data(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxEmg7'));
%     fprintf(en, '%f,', max(InterpolatedEmg7Data(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    
    figure(17);
    bar(timems(i),max(InterpolatedEmg7Data(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    %Emg8
%     fprintf(feat, '%s,', strcat(eatingHeader,'Emg8'));
%     fprintf(feat, '%f,', InterpolatedEmg8Data(frameEatStart:frameEatEnd));
%     fprintf(feat,"\n");
%     
%     fprintf(en, '%s,', strcat(eatingHeader,'maxEmg8'));
%     fprintf(en, '%f,', max(InterpolatedEmg8Data(frameEatStart:frameEatEnd)));
%     fprintf(en,"\n");
    
    figure(18);
    bar(timems(i),max(InterpolatedEmg8Data(frameEatStart:frameEatEnd)),'facecolor','r','FaceAlpha',.8,'EdgeAlpha',.8);
    
    % Non eating actions
    %OriX
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'OriX'));
%     fprintf(fnoneat, '%f,', InterpolatedOriXData(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxOriX'));
%     fprintf(nen, '%f,', max(InterpolatedOriXData(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
    
    figure(1);
    bar(timems(i),max(InterpolatedOriXData(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %OriY
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'OriY'));
%     fprintf(fnoneat, '%f,', InterpolatedOriYData(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxOriY'));
%     fprintf(nen, '%f,', max(InterpolatedOriYData(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
    
    figure(2);
    bar(timems(i),max(InterpolatedOriYData(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %OriZ
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'OriZ'));
%     fprintf(fnoneat, '%f,', InterpolatedOriZData(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxOriZ'));
%     fprintf(nen, '%f,', max(InterpolatedOriZData(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
    
    figure(3);
    bar(timems(i),max(InterpolatedOriZData(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %OriW
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'OriW'));
%     fprintf(fnoneat, '%f,', InterpolatedOriWData(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxOriW'));
%     fprintf(nen, '%f,', max(InterpolatedOriWData(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
%     
    figure(4);
    bar(timems(i),max(InterpolatedOriWData(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %AccX
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'AccX'));
%     fprintf(fnoneat, '%f,', InterpolatedAccXData(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxAccX'));
%     fprintf(nen, '%f,', max(InterpolatedAccXData(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
    
    figure(5);
    bar(timems(i),max(InterpolatedAccXData(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %AccY
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'AccY'));
%     fprintf(fnoneat, '%f,', InterpolatedAccYData(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxAccY'));
%     fprintf(nen, '%f,', max(InterpolatedAccYData(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
    
    figure(6);
    bar(timems(i),max(InterpolatedAccYData(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %AccZ
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'AccZ'));
%     fprintf(fnoneat, '%f,', InterpolatedAccZData(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxAccZ'));
%     fprintf(nen, '%f,', max(InterpolatedAccZData(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
    
    figure(7);
    bar(timems(i),max(InterpolatedAccZData(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %GyrX
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'GyrX'));
%     fprintf(fnoneat, '%f,', InterpolatedGyrXData(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxGyrX'));
%     fprintf(nen, '%f,', max(InterpolatedGyrXData(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
    
    figure(8);
    bar(timems(i),max(InterpolatedGyrXData(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %GyrY
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'GyrY'));
%     fprintf(fnoneat, '%f,', InterpolatedGyrYData(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxGyrY'));
%     fprintf(nen, '%f,', max(InterpolatedGyrYData(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
    
    figure(9);
    bar(timems(i),max(InterpolatedGyrYData(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %GyrZ
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'GyrZ'));
%     fprintf(fnoneat, '%f,', InterpolatedGyrZData(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxGyrZ'));
%     fprintf(nen, '%f,', max(InterpolatedGyrZData(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
    
    figure(10);
    bar(timems(i),max(InterpolatedGyrZData(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %Emg1
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg1'));
%     fprintf(fnoneat, '%f,', InterpolatedEmg1Data(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxEmg1'));
%     fprintf(nen, '%f,', max(InterpolatedEmg1Data(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
    
    figure(11);
    bar(timems(i),max(InterpolatedEmg1Data(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %Emg2
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg2'));
%     fprintf(fnoneat, '%f,', InterpolatedEmg2Data(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxEmg2'));
%     fprintf(nen, '%f,', max(InterpolatedEmg2Data(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
%     
    figure(12);
    bar(timems(i),max(InterpolatedEmg2Data(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %Emg3
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg3'));
%     fprintf(fnoneat, '%f,', InterpolatedEmg3Data(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxEmg3'));
%     fprintf(nen, '%f,', max(InterpolatedEmg3Data(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
    
    figure(13);
    bar(timems(i),max(InterpolatedEmg3Data(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %Emg4
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg4'));
%     fprintf(fnoneat, '%f,', InterpolatedEmg4Data(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxEmg4'));
%     fprintf(nen, '%f,', max(InterpolatedEmg4Data(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
    
    figure(14);
    bar(timems(i),max(InterpolatedEmg4Data(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %Emg5
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg5'));
%     fprintf(fnoneat, '%f,', InterpolatedEmg5Data(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxEmg5'));
%     fprintf(nen, '%f,', max(InterpolatedEmg5Data(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
    
    figure(15);
    bar(timems(i),max(InterpolatedEmg5Data(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %Emg6
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg6'));
%     fprintf(fnoneat, '%f,', InterpolatedEmg6Data(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%    
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxEmg6'));
%     fprintf(nen, '%f,', max(InterpolatedEmg6Data(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
%     
    figure(16);
    bar(timems(i),max(InterpolatedEmg6Data(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %Emg7
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg7'));
%     fprintf(fnoneat, '%f,', InterpolatedEmg7Data(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxEmg7'));
%     fprintf(nen, '%f,', max(InterpolatedEmg7Data(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
    
    figure(17);
    bar(timems(i),max(InterpolatedEmg7Data(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    %Emg8
%     fprintf(fnoneat, '%s,', strcat(nonEatingHeader,'Emg8'));
%     fprintf(fnoneat, '%f,', InterpolatedEmg8Data(notEatStart:frameEatStart));
%     fprintf(fnoneat,"\n");
%     
%     fprintf(nen, '%s,', strcat(nonEatingHeader,'maxEmg8'));
%     fprintf(nen, '%f,', max(InterpolatedEmg8Data(notEatStart:frameEatStart)));
%     fprintf(nen,"\n");
   
    figure(18);
    bar(timems(i),max(InterpolatedEmg8Data(notEatStart:frameEatStart)),'facecolor','g','FaceAlpha',.3,'EdgeAlpha',.3);
    
    notEatStart = frameEatEnd;
    
end

% fclose(feat) ;
% fclose(fnoneat);
% fclose(en);
% fclose(nen);
for l = 1:18
    figure(l)
    legend('y = Eating Action','y = Non Eating Action');
end

saveas(figure(1),'OrientationX.jpg');
saveas(figure(2),'OrientationY.jpg');
saveas(figure(3),'OrientationZ.jpg');
saveas(figure(4),'OrientationW.jpg');
saveas(figure(5),'AccelerometerX.jpg');
saveas(figure(6),'AccelerometerY.jpg');
saveas(figure(7),'AccelerometerZ.jpg');
saveas(figure(8),'GyroscopeX.jpg');
saveas(figure(9),'GyroscopeY.jpg');
saveas(figure(10),'GyroscopeZ.jpg');
saveas(figure(11),'Emg1.jpg');
saveas(figure(12),'Emg2.jpg');
saveas(figure(13),'Emg3.jpg');
saveas(figure(14),'Emg4.jpg');
saveas(figure(15),'Emg5.jpg');
saveas(figure(16),'Emg6.jpg');
saveas(figure(17),'Emg7.jpg');
saveas(figure(18),'Emg8.jpg');

hold off
delete(findall(0,'Type','figure'))
%EMGTime = imgdata2(:,1);     
%newTime = unique([IMUTime; EMGTime]);

%plot( saveTimeLine, Interpolated_OriXData, saveTimeLine, Interpolated_OriYData, saveTimeLine, Interpolated_OriZData, saveTimeLine, Interpolated_OriWData)
%{
imgdata2 = csvread('fork/1503701484723_EMG.txt');
temp = [IMUTime; EMGTime]
a = [1;2;3;4]
b = [6;7;8;9]
c = [a;b]
bounds(imgdata(2:3))

%x = ones(1:10)
x = 1 : 10; 
disp(x)

%plot(timems(frameEatStart:frameEatEnd),InterpolatedOriXData(frameEatStart:frameEatEnd),'-x','MarkerIndices',1:10:length(InterpolatedOriXData(frameEatStart:frameEatEnd)));
    
    %plot(saveTimeLine,InterpolatedOriXData(frameEatStart:frameEatEnd));
    %xticks(0:200:4452);
%}