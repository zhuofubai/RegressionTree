function [XL,XR, YL, YR]=split(X,Y,node)
temp=node.value;
a=find(X(:,node.col)<=temp);
b=find(X(:,node.col)>temp);
XL=X(a,:);
XR=X(b,:);
YL=Y(a,:);
YR=Y(b,:);
return