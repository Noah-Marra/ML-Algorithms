%Testing - Gaussian Classifier 
for k = 1:1:K
    for i = 1:1:400
        for j = 1:1:K
            N(i,j,k) = exp(sum(-(digits_test(:,i,k) - uk(:,j)).^2));%calculate probability/distribution
        end

    end
end

[~,x] = max(N,[],2);%find the max probability at a certain index/class

errorG(1:10) = 0;%initilize a 1x10 matrix of 0's
for k = 1:1:K
    for i = 1:1:400
        if x(i,1,k) ~= k
            errorG(k) = errorG(k) + 1; %add each time the algorithm classified a digit incorrectly
        end
    end
end
 
%Testing Naive Bayes
Y = (digits_test>0.5); %Make test data Binary

for k = 1:1:K
      for i = 1:1:400
          for j = 1:1:K
             P(i,j,k) = prod((nki(:,j).^Y(:,i,k)).*(1-nki(:,j)).^(1-Y(:,i,k))); %calculate probability
          end
     end
end

[~,y] = max(P,[],2); %find the max probability at a certain index/class

errorN(1:10) = 0;
for k = 1:1:K
    for i = 1:1:400
        if y(i,1,k) ~= k
            errorN(k) = errorN(k) + 1; %add each time the algorithm classified a digit incorrectly
        end
    end
end

errorRateG = (sum(errorG)/4000)*100; %calculate error rate Gaussian
errorRateN = (sum(errorN)/4000)*100; %calculate error rate Naive Bayes

errorG(end+1) = errorRateG;
errorN(end+1) = errorRateN;
errorGN = [errorG ;errorN];

t = array2table(errorGN,'RowNames',{'Gaussian', 'Naive Bayes'},'VariableNames', ...
    {'1','2','3','4','5','6','7','8','9','10','Total Error Rate %'})

