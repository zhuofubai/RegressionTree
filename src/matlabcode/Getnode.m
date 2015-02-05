function [tnode]=Getnode(X,Y,Max, accuracy, rsq)
[row col]=size(X);
RegTree=javaObject('RegressionTree');
tempnode=javaObject('node');
maximum.index1=1;
maximum.index2=1;
maximum.sqare=inf;
for j=1:col-1
    [X2 Y2]=tsort(X,Y,j);
    tempnode=RegTree.build(X2,Y2,Max,accuracy,rsq);
    if maximum.sqare>(tempnode.s2l+tempnode.s2r)
    maximum.index2=j;
    maximum.index1=tempnode.index+1;
    maximum.sqare=tempnode.s2l+tempnode.s2r;
    maximum.s2l=tempnode.s2l;
    maximum.s2r=tempnode.s2r;
    maximum.value=X2(maximum.index1,maximum.index2);
    end
end
% tnode.x=maximum.index1;
tnode.col=maximum.index2;
tnode.s2l=maximum.s2l;
tnode.s2r=maximum.s2r;
tnode.value=maximum.value;
tnode.Lchild=0;
tnode.Rchild=0;
tnode.Lreg=0;
tnode.Rreg=0;

%node = struct('Lchild',0,'Rchild',0,'Lreg',0,'Rreg',0,'col',0,'value',0,'s2l',0,'s2r',0);
return