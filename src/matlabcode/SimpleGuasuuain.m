clear all;
load Sample_T;
load Sample_T_Plus;
%[b,bint,r] = regress(y,X);
[SampleSize ExampleLenth]=size(Sample_T);
Train_T=Sample_T(1:fix(SampleSize*0.8),:);
Train_T_Plus=Sample_T_Plus(1:fix(SampleSize*0.8),:);
Test_T=Sample_T(fix(SampleSize*0.8):SampleSize,:);
Test_T_Plus=Sample_T_Plus(fix(SampleSize*0.8):SampleSize,:);
for i=1:34
[TrainSize ExampleLenth]=size(Train_T);
X=[Train_T(:,2:35), ones(TrainSize,1)];
y=Train_T_Plus(:,i+1);
[b,bint,r] = regress(y,X);
Model.reg=b;
Model.var=mean(r.*r);
ModelSet(i)=Model;
end
tmean=mean(Train_T(:,2:35),1);
tmeanplus=mean(Train_T_Plus(:,2:35),1);
clear Sample_T
clear Sample_T_Plus
clear Train_T
clear Train_Plus
Meantest=(tmean+tmeanplus)/2;
Regmean=zeros(1,34);
for i=1:34
Rmean=Test_T_Plus(:,i+1)-Meantest(:,i);
SqaRmean=Rmean.*Rmean;
SumRmean=sum(SqaRmean);
Regmean(i)=SumRmean/length(SqaRmean);
end
[TestSize ExampleLenth]=size(Test_T);
T=[Test_T(:,2:35) ones(TestSize,1)];
Reg=zeros(1,34);
for i=1:34
Observation=Test_T_Plus(:,i+1);
R=T*ModelSet(i).reg;
R=R-Observation;
SqaR=R.*R;
Sum=sum(SqaR);
Reg(i)=Sum/length(SqaR);
%Q=estimation(ModelSet(i),T);
end
R_squar=Reg./Regmean;
clear Test_T
clear Test_T_Plus

