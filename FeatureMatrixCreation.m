% DataGeeks Group Assignement-3
%
clear;
close;

summaryData = csvread('data/summary.csv');
%summaryData = csvread('data/backup.txt');
group_id_mapping = csvread('data/group_id_mapping.csv');
fileNames = summaryData(:,2);
totalFrameNumbers = summaryData(:,3);
[row,col] = size(summaryData);
Matrix =[];

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

    data = vertcat(InterpolatedOriXData,InterpolatedOriYData,InterpolatedOriZData,InterpolatedOriWData,InterpolatedAccXData,InterpolatedAccYData,InterpolatedAccZData,InterpolatedGyrXData,InterpolatedGyrYData,InterpolatedGyrZData,InterpolatedEmg1Data,InterpolatedEmg2Data,InterpolatedEmg3Data,InterpolatedEmg4Data,InterpolatedEmg5Data,InterpolatedEmg6Data,InterpolatedEmg7Data,InterpolatedEmg8Data);
    sensorNames = ["OriX","OriY","OriZ","OriW","AccX","AccY","AccZ","GyrX","GyrY","GyrZ","Emg1","Emg2","Emg3","Emg4","Emg5","Emg6","Emg7","Emg8"];
    
    
    for i = 1:r
        frameEatStart = M(i,1);
        frameEatEnd = M(i,2);

        eatingHeader = strcat( 'EatingAction', num2str(i));   
        nonEatingHeader = strcat( 'NonEatingAction', num2str(i));
        
        fprintf(featureMatrixEating, '%s,', eatingHeader );
        row = NaN(1,18*(6)+1+2+2);
        
        % for loop for eating action
        for p = 1:18
            fprintf(feat, '%s,', strcat(eatingHeader,sensorNames(p) ));
            fprintf(feat, '%f,', data(p,frameEatStart:frameEatEnd));
            fprintf(feat,"\n");
            
            r_mean= mean(data(p,frameEatStart:frameEatEnd));
            r_max= max(data(p,frameEatStart:frameEatEnd));
            r_std= std(data(p,frameEatStart:frameEatEnd));
            r_rms= rms(data(p,frameEatStart:frameEatEnd));
            
            %fft
            % power is sum of squared coefficients
            %https://www.mathworks.com/matlabcentral/answers/159105-i-have-a-time-domain-signal-i-want-to-calculate-energy-of-my-signal
            fft_part = abs(fft(data(p,frameEatStart:frameEatEnd)));
            pow1 = fft_part.*conj(fft_part)/(frameEatEnd-frameEatStart);
            r_pow = sum(pow1);
            %entropy
            fft_part=abs(fft(data(p,frameEatStart:frameEatEnd)));
            P = fft_part.*conj(fft_part)/(frameEatEnd-frameEatStart);
            %Normalization
            d=P(:);
            %disp(d);
            d=d/sum(d+ 1e-12);

            %Entropy Calculation
            logd = log2(d + 1e-12);
            r_Entropy = -sum(d.*logd)/log2(length(d));
            
            fprintf(featureMatrixEating, '%f,', r_mean); 
            fprintf(featureMatrixEating, '%f,', r_max);
            fprintf(featureMatrixEating, '%f,', r_std);
            fprintf(featureMatrixEating, '%f,', r_rms);
            fprintf(featureMatrixEating, '%f,', r_pow);            
            fprintf(featureMatrixEating, '%f,', r_Entropy );
            
            row(1,(p-1)*6+1) = r_mean;
            row(1,(p-1)*6+2) = r_max;
            row(1,(p-1)*6+3) = r_std;
            row(1,(p-1)*6+4) = r_rms;
            row(1,(p-1)*6+5) = r_pow;
            row(1,(p-1)*6+6) = r_Entropy;
            
        end
        fprintf(featureMatrixEating,"\n");
        
        %label (Eating or Non-Eating)
        r_label = 1;
        row(1,18*6+1) = r_label;
        
        % timestamp
        r_timestamp = fileNames(index);
        row(1,18*6+2) = r_timestamp;
        % group number
        [x,y]=find(group_id_mapping(:,2) == r_timestamp);
        row(1,18*6+3) = group_id_mapping(x,1);
        row(1,18*6+4) = frameEatStart;
        row(1,18*6+5) = frameEatEnd;
        
        Matrix=[Matrix;row];

        % for loop for non eating action
        row = NaN(1,18*(6)+1+2+2);
        
        % for loop for Non eating action
        for p = 1:18
            fprintf(feat, '%s,', strcat(nonEatingHeader,sensorNames(p) ));
            fprintf(fnoneat, '%f,', data(p,notEatStart:frameEatStart));	            
            fprintf(feat,"\n");		
			fprintf(fnoneat,"\n");
            
            r_mean = mean(data(p, notEatStart:frameEatStart));
            r_max  = max(data(p, notEatStart:frameEatStart));
            r_std  = std(data(p, notEatStart:frameEatStart));
            r_rms  = rms(data(p, notEatStart:frameEatStart));
            
            %fft
            % power is sum of squared coefficients
            %https://www.mathworks.com/matlabcentral/answers/159105-i-have-a-time-domain-signal-i-want-to-calculate-energy-of-my-signal
            fft_part = abs(fft(data(p, notEatStart:frameEatStart)));
            pow1 = fft_part.*conj(fft_part)/(frameEatStart-notEatStart);
            r_pow = sum(pow1);
            %entropy
            fft_part=abs(fft(data(p, notEatStart:frameEatStart)));
            P = fft_part.*conj(fft_part)/(frameEatStart-notEatStart);
            %Normalization
            d=P(:);
            %disp(d);
            d=d/sum(d+ 1e-12);

            %Entropy Calculation
            logd = log2(d + 1e-12);
            r_Entropy = -sum(d.*logd)/log2(length(d));
            
            
            %label (Eating or Non-Eating)
            r_label = 0;
            
            fprintf(featureMatrixNonEating, '%f,', r_mean); 
            fprintf(featureMatrixNonEating, '%f,', r_max);
            fprintf(featureMatrixNonEating, '%f,', r_std);
            fprintf(featureMatrixNonEating, '%f,', r_rms);
            fprintf(featureMatrixNonEating, '%f,', r_pow);            
            fprintf(featureMatrixNonEating, '%f,', r_Entropy );
            
            row(1,(p-1)*6+1) = r_mean;
            row(1,(p-1)*6+2) = r_max;
            row(1,(p-1)*6+3) = r_std;
            row(1,(p-1)*6+4) = r_rms;
            row(1,(p-1)*6+5) = r_pow;
            row(1,(p-1)*6+6) = r_Entropy;
            
        end
        fprintf(featureMatrixNonEating,"\n");
        % timestamp
        r_timestamp = fileNames(index);
        row(1,18*6+1) = r_label;
        row(1,18*6+2) = r_timestamp;
        
        % group number
        [x,y]=find(group_id_mapping(:,2) == r_timestamp);
        row(1,18*6+3) = group_id_mapping(x,1);
        
        row(1,18*6+4) = notEatStart;
        row(1,18*6+5) = frameEatStart;
        
        Matrix=[Matrix;row];
        notEatStart = frameEatEnd;
    end

    fclose(feat) ;
    fclose(fnoneat);
    fclose(featureMatrixEating);
    fclose(featureMatrixNonEating);

end
save('data/FeatureMatrix.mat','Matrix');