global tree;
global nodenum;
nodenum=0;
tree= struct('col',0,'s2l',0,'s2r',0,'value',0,'Lchild',0,'Rchild',0,'Lreg',0,'Rreg',0,'index',0);
load Sample_T;
load Sample_T_Plus;
basic_T=Sample_T(1:5500,8:10);
c=ones(5500,1);
basic_T=[basic_T c];
basic_T_plus=Sample_T_Plus(1:5500,9);
Max=3;
accuracy=0.01
rsq=100;
[node]=Getnode(basic_T,basic_T_plus,Max, accuracy, rsq)
[XL,XR, YL, YR]=split(basic_T,basic_T_plus,node);
root=BuildTree(basic_T,basic_T_plus,Max,accuracy,rsq);


test1=[Sample_T(5501:5550,8:10) ones(50,1)];
test1_plus=Sample_T_Plus(5501:5550,9);
[beta]=TreeSearch(tree,test1(10,:));
[yhat residual]=Prediction(test1,test1_plus, tree);

r1sq=sum(residual.*residual);
[b,bint,r] = regress(basic_T_plus,basic_T);
rsq=sum(r.*r);
uhat=test1*b;
residual2=test1_plus-uhat;
r2sq=sum(residual2.*residual2);

