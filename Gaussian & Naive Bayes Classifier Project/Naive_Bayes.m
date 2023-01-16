D = 64; %number of features
mk = 700; % # of images for each training classes
K = 10;%total # of classes
ak = 1/10; %all classes have the same # of features
P = zeros([64,10]);

X = (digits_train>0.5);%changes digits over 0.5 to 1 and under 0.5 to 0


for k = 1:1:K
      for j = 1:1:mk
        for i = 1:1:D
           if X(i,j,k)> 0.5
               P(i,k) = P(i,k) + 1;
           end
        end
     end
end

nki = P./mk;

for i = 1:1:K
    subplot(2,5,i);
    imagesc(reshape(nki(:,i),8,8)'); axis equal; axis off; colormap gray;
end


