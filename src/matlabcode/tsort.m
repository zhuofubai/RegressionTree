function [X2 Y2]=tsort(X,Y,j)
[b index]=sort(X(:,j),'ascend');
X2=X(index,:);
Y2=Y(index,:);
return