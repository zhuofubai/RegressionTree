function [yhat residual]=Prediction(X,Y, tree)
[m n]=size(X);
yhat=zeros(m,1);
for i=1:m
beta=TreeSearch(tree,X(i,:));
yhat(i) = X(i,:)*beta;
i
end
residual=Y-yhat;

