clear java;
load Sample_T
load Sample_T_Plus
[row column]=size(Sample_T);
%X=zeros(20,3);
%Y=zeros(20,1);
% for i=1:20
% X(i,:)=Sample_T(i,2:4);
% Y(i,:)=Sample_T_Plus(i,2);
% end
X=Sample_T(1:10000,2:30);
Y=Sample_T_Plus(1:10000,2);
Max=6;
accuracy=0.01
rsq=100;
Q=javaObject('RegressionTree');
 u=javaObject('node')
 u=Q.build(X,Y,Max,accuracy,rsq)