clear all;
load Sample_T;
load Sample_T_Plus;
%[b,bint,r] = regress(y,X);
[SampleSize ExampleLenth]=size(Sample_T);
Train_T=Sample_T(1:fix(SampleSize*0.8),:);
Train_T_Plus=Sample_T_Plus(1:fix(SampleSize*0.8),:);
Test_T=Sample_T(fix(SampleSize*0.8):SampleSize,:);
Test_T_Plus=Sample_T_Plus(fix(SampleSize*0.8):SampleSize,:);
%%%
[TrainSize ExampleLenth]=size(Train_T);
X=[Train_T(:,2:35), ones(TrainSize,1)];
y=Train_T_Plus(:,2);
k=1;
minimum=Inf;
for i=1:TrainSize
    temp=X(i,k);
    index1=find(X(:,k)>=temp);
    index2=find(X(:,k)<temp);
    X1=X(index1,:);
    y1=y(index1,1);
    X2=X(index2,:);
    y2=y(index2,1);
    [b1,bint1,r1] = regress(y1,X1);
    [b2,bint2,r2] = regress(y2,X2);
    sqaloss=sum(r1.*r1)+sum(r2.*r2);
    if(minimum>sqaloss)
    minimum=sqaloss;
    node.value=temp;
    end
    i
end
