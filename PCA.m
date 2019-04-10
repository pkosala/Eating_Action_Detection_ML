
% eating data

data = csvread('featureMatrix.csv');
[coeff,score,latent,tsquared, explained, mu] = pca(data);
plot(zscore(data))
disp(expla)
disp(score)
disp(latent)

%observe explained matrix to choose how many principlan components to choose based on percentage
% here in this I selected top3
recontructedMatrix = data * coeff(:,1:3);
plot(recontructedMatrix)
plot(zscore(recontructedMatrix))

title('Principal Components after PCA on Eating data');
biplot(coeff(:,1:3),'scores',score(:,1:3));

title('Principal Components after PCA on Eating data');
biplot(coeff(:,1:3),'scores',score(:,1:3));