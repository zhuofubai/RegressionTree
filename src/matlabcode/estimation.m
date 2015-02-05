function position=estimation(Model,example)
mean=example*Model.reg;
var=Model.var;
syms x;
A=(1/sqrt(2*3.1416*var)*exp((x-mean)^2/(2*var)*(-1))*x);
position=double(int(A,mean-2*sqrt(var),mean+2*sqrt(var)));