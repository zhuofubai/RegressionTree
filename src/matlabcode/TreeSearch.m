function [beta]=TreeSearch(tree,example)
current=tree(2);
reg=0;
while(reg==0)
if example(current.col)>current.value
    if(current.Rreg==0)
        current=tree(current.Rchild);
    else
        reg=current.Rreg;
    end
else 
        if(current.Lreg==0)
        current=tree(current.Lchild);
        else
        reg=current.Lreg;
        end
end
beta=reg;

end