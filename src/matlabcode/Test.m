load Test_T
load Test_T_Plus

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
clear Test_T
clear Test_T_Plus