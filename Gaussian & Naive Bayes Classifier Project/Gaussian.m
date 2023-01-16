D = 64; %number of features
ak = 1/10; %all classes have the same # of features
mk = 700; % # of images for each training classes
K = 10;%total # of classes
M = mk*K; %# of all training data points over K classes
uk = [];

%Training
for k = 1:1:K
        uk(:,k) = mean(digits_train(:,:,k),2);
end

for k = 1:1:K
   for j = 1:1:mk
        s(:,j,k) = (digits_train(:,j,k)-uk(:,k)).^2;
   end
end

variance = sum(s,"all")/(D*M)
varianceRoot = sqrt(variance);

for i = 1:1:K
    subplot(2,5,i);
    imagesc(reshape(uk(:,i),8,8)'); axis equal; axis off; colormap gray;
end





