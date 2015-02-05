function [node]=BuildTree(X,Y,Max,accuracy,rsq)
global tree;
global nodenum;

node=Getnode(X,Y,Max,accuracy,rsq);
Max=Max-1;
nodenum=nodenum+1;
node.index=nodenum;
%------------------



%------------------
%tree=[tree node];
[XL,XR, YL, YR]=split(X,Y,node);
clear X;
clear Y;
if(Max~=0&&node.s2l~=0&&node.s2r~=0)   
    tree=[tree node];
node2=BuildTree(XL,YL,Max,accuracy,node.s2l);
node3=BuildTree(XR,YR,Max,accuracy,node.s2r);

tree(node.index+1).Lchild=node2.index+1;
tree(node.index+1).Rchild=node3.index+1;
else    
    Reg=javaObject('Regression');
    %reginfo=javaObject(reg);
    
    node.Lchild=-1;
    node.Lreg=Reg.getbeta(XL,YL);
    
    node.Rchild=-1;
    node.Rreg=Reg.getbeta(XR,YR);
    tree=[tree node];
end
return

