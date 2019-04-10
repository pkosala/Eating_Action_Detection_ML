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
disp(size(saveTimeLine));
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

RawData = vertcat(OriXData,OriYData,OriZData,OriWData,AccXData,AccYData,AccZData,GyrXData,GyrYData,GyrZData,Emg1Data,Emg2Data,Emg3Data,Emg4Data,Emg5Data,Emg6Data,Emg7Data,Emg8Data);
Data = vertcat(InterpolatedOriXData,InterpolatedOriYData,InterpolatedOriZData,InterpolatedOriWData,InterpolatedAccXData,InterpolatedAccYData,InterpolatedAccZData,InterpolatedGyrXData,InterpolatedGyrYData,InterpolatedGyrZData,InterpolatedEmg1Data,InterpolatedEmg2Data,InterpolatedEmg3Data,InterpolatedEmg4Data,InterpolatedEmg5Data,InterpolatedEmg6Data,InterpolatedEmg7Data,InterpolatedEmg8Data);
% this needs to change for spoon data
% 4451 are no of frames
% 1503701484723 annoted file fork
% change files names eating Fork and noneating fork
N = 0:1:4451;
M = dlmread('fork/1503701484723.txt');
feat = fopen('EatingFork.csv', 'w') ;
fnoneat = fopen('NonEatingFork.csv', 'w') ;
[r,c] = size(M);
notEatStart = 1;

timems = 1:1:4452;

for row=1:size(Data,1)
    disp(size(row))
    figure(1);hold off;
    figure(2);hold off;
    t='';
    
    pow_eatArray=NaN(1,r);
    pow_nonEatArray=NaN(1,r);
    
    dwt_eatArray=NaN(1,r);
    dwt_nonEatArray=NaN(1,r);
    
    entropy_eatArray=NaN(1,r);
    entropy_nonEatArray=NaN(1,r);
    for i = 1:r
        frameEatStart = M(i,1);
        frameEatEnd = M(i,2);
        switch row
            case 1 
                t = 'InterpolatedOriXData';
            case 2 
                t = 'InterpolatedOriYData';
            case 3
                t = 'InterpolatedOriZData';
            case 4 
                t = 'InterpolatedOriWData';
            case 5 
                t = 'InterpolatedAccXData';
            case 6 
                t = 'InterpolatedAccYData';
            case 7 
                t = 'InterpolatedAccZData';
            case 8
                t = 'InterpolatedGyrXData';
            case 9 
                t = 'InterpolatedGyrYData';
            case 10 
                t = 'InterpolatedGyrZData';
            case 11
                t = 'InterpolatedEmg1Data';
            case 12
                t = 'InterpolatedEmg2Data';
            case 13 
                t = 'InterpolatedEmg3Data';
            case 14
                t = 'InterpolatedEmg4Data';
            case 15 
                t = 'InterpolatedEmg5Data';
            case 16 
                t = 'InterpolatedEmg6Data';
            case 17
                t = 'InterpolatedEmg7Data';
            case 18
                t = 'InterpolatedEmg8Data';
        end

        % power is sum of squared coefficients
        %https://www.mathworks.com/matlabcentral/answers/159105-i-have-a-time-domain-signal-i-want-to-calculate-energy-of-my-signal
        fft_part=abs(fft(Data(row,frameEatStart:frameEatEnd)));
        pow = fft_part.*conj(fft_part)/(frameEatEnd-frameEatStart);
        pow_eatArray(1,i)= sum(pow);
        
        fft_part=abs(fft(Data(row,notEatStart:frameEatStart)));
        pow = fft_part.*conj(fft_part)/(frameEatEnd-frameEatStart);
        pow_nonEatArray(1,i)= sum(pow);
        
        % Sum of DWT coefficients
        
%         [A,D]=dwt(Data(row,frameEatStart:frameEatEnd),'haar');
%         dwt_eatArray(1,i)= sum(D);
%         [A,D]=dwt(Data(row,notEatStart:frameEatStart),'haar');
%         dwt_nonEatArray(1,i)=sum(D);
        
        % Entropy measures from fft
        
            fft_part=abs(fft(Data(row,frameEatStart:frameEatEnd)));
            P = fft_part.*conj(fft_part)/(frameEatEnd-frameEatStart);
           %Normalization
           d=P(:);
           disp(d);
           d=d/sum(d+ 1e-12);

           %Entropy Calculation
           logd = log2(d + 1e-12);
           Entropy = -sum(d.*logd)/log2(length(d));
           entropy_eatArray(1,i)= Entropy;
           
           fft_part=abs(fft(Data(row,notEatStart:frameEatStart)));
            P = fft_part.*conj(fft_part)/(notEatStart-frameEatStart);
           %Normalization
           d=P(:);
           disp(d);
           d=d/sum(d+ 1e-12);

           %Entropy Calculation
           logd = log2(d + 1e-12);
           Entropy = -sum(d.*logd)/log2(length(d));
           entropy_nonEatArray(1,i)= Entropy;
           
        notEatStart = frameEatEnd;
    end
    
    figure(1); hold off;
    plot(1:r,pow_eatArray,'r',1:r,pow_nonEatArray,'b');
    title(strcat('Graph of Power of ',t));
    xlabel('Frequency'); % x-axis label
    ylabel('Entropy'); % y-axis label
    legend('y = Entropy Eating Action)','y = Entropy Non-Eating Action');
    saveas(figure(1),strcat('pow_',t,'.jpg'));
    
    figure(2); hold off;
    plot(1:r,dwt_eatArray,'r',1:r,dwt_nonEatArray,'b');
    saveas(figure(2),strcat('dwt_',t,'.jpg'));
    
    figure(3); hold off;
    plot(1:r,entropy_eatArray,'r',1:r,entropy_nonEatArray,'b');
    saveas(figure(3),strcat('entropy_',t,'.jpg'));
end

%%%%%%%%%%%%%%%%%%%%%%%  CORRELATION COEFFICIENTS %%%%%%%%%%%%%%%%%

eatArray=NaN(1,r); % number of eating actions 40 or 36 in our case
nonEatArray=NaN(1,r);
%%correlation coefficients Accelerometer Y and X
for i = 1:r
        frameEatStart = M(i,1);
        frameEatEnd = M(i,2);
        
        Reat=corrcoef(Data(5,frameEatStart:frameEatEnd),Data(6,frameEatStart:frameEatEnd));
        eatArray(1,i)=Reat(1,2);
        RnonEat=corrcoef(Data(5,notEatStart:frameEatStart),Data(6,notEatStart:frameEatStart));
        nonEatArray(1,i)=RnonEat(1,2);
        
        notEatStart = frameEatEnd;
end
figure(2); hold off;
plot(1:r,eatArray,'r',1:r,nonEatArray,'b');
saveas(figure(2),strcat('CorrCoef_','Acc_XandY','.jpg'));

eatArray=NaN(1,r); % number of eating actions 40 or 36 in our case
nonEatArray=NaN(1,r);
%%correlation coefficients Accelerometer X and Z
for i = 1:r
        frameEatStart = M(i,1);
        frameEatEnd = M(i,2);
        
        Reat=corrcoef(Data(5,frameEatStart:frameEatEnd),Data(7,frameEatStart:frameEatEnd));
        eatArray(1,i)=Reat(1,2);
        RnonEat=corrcoef(Data(5,notEatStart:frameEatStart),Data(7,notEatStart:frameEatStart));
        nonEatArray(1,i)=RnonEat(1,2);
        notEatStart = frameEatEnd;
end
figure(2); hold off;
plot(1:r,eatArray,'r',1:r,nonEatArray,'b');
saveas(figure(2),strcat('CorrCoef_','Acc_XandZ','.jpg'));

eatArray=NaN(1,r); % number of eating actions 40 or 36 in our case
nonEatArray=NaN(1,r);
%%correlation coefficients Accelerometer Y and Z
for i = 1:r
        frameEatStart = M(i,1);
        frameEatEnd = M(i,2);
        
        Reat=corrcoef(Data(6,frameEatStart:frameEatEnd),Data(7,frameEatStart:frameEatEnd));
        eatArray(1,i)=Reat(1,2);
        RnonEat=corrcoef(Data(6,notEatStart:frameEatStart),Data(7,notEatStart:frameEatStart));
        nonEatArray(1,i)=RnonEat(1,2);
        notEatStart = frameEatEnd;
end
figure(2); hold off;
plot(1:r,eatArray,'r',1:r,nonEatArray,'b');
saveas(figure(2),strcat('CorrCoef_','Acc_YandZ','.jpg'));


eatArray=NaN(1,r); % number of eating actions 40 or 36 in our case
nonEatArray=NaN(1,r);
%%correlation coefficients Accelerometer Y and X
for i = 1:r
        frameEatStart = M(i,1);
        frameEatEnd = M(i,2);
        
        Reat=corrcoef(Data(8,frameEatStart:frameEatEnd),Data(9,frameEatStart:frameEatEnd));
        eatArray(1,i)=Reat(1,2);
        RnonEat=corrcoef(Data(8,notEatStart:frameEatStart),Data(9,notEatStart:frameEatStart));
        nonEatArray(1,i)=RnonEat(1,2);
        notEatStart = frameEatEnd;
end
figure(2); hold off;
plot(1:r,eatArray,'r',1:r,nonEatArray,'b');
saveas(figure(2),strcat('CorrCoef_','Gyro_XandY','.jpg'));

eatArray=NaN(1,r); % number of eating actions 40 or 36 in our case
nonEatArray=NaN(1,r);
%%correlation coefficients Gyroscope X and Z
for i = 1:r
        frameEatStart = M(i,1);
        frameEatEnd = M(i,2);
        
        Reat=corrcoef(Data(8,frameEatStart:frameEatEnd),Data(10,frameEatStart:frameEatEnd));
        eatArray(1,i)=Reat(1,2);
        RnonEat=corrcoef(Data(8,notEatStart:frameEatStart),Data(10,notEatStart:frameEatStart));
        nonEatArray(1,i)=RnonEat(1,2);
        notEatStart = frameEatEnd;
end
figure(2); hold off;
plot(1:r,eatArray,'r',1:r,nonEatArray,'b');
saveas(figure(2),strcat('CorrCoef_','Gyro_XandZ','.jpg'));

eatArray=NaN(1,r); % number of eating actions 40 or 36 in our case
nonEatArray=NaN(1,r);
%%correlation coefficients Accelerometer Y and Z
for i = 1:r
        frameEatStart = M(i,1);
        frameEatEnd = M(i,2);
        
        Reat=corrcoef(Data(9,frameEatStart:frameEatEnd),Data(10,frameEatStart:frameEatEnd));
        eatArray(1,i)=Reat(1,2);
        RnonEat=corrcoef(Data(9,notEatStart:frameEatStart),Data(10,notEatStart:frameEatStart));
        nonEatArray(1,i)=RnonEat(1,2);
        notEatStart = frameEatEnd;
end
figure(2); hold off;
plot(1:r,eatArray,'r',1:r,nonEatArray,'b');
saveas(figure(2),strcat('CorrCoef_','Gyro_YandZ','.jpg'));