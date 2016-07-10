if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-132";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

texpreamble("\usepackage{xeCJK}");
texpreamble("\setCJKmainfont{SimSun}");
usepackage("amsmath");
usepackage("siunitx");
import graph;
import math;
size(300);
//216页32.34
picture dashpic,tmp;
pair O,A,B,P,dash,Ps,Pe;
real alpha,a[],b,l[],ls,le,tri,ldash,ddash,ri,ro,M,d,h;
path pdash;
int nmax;
//画阴影
ldash = 10;
pdash = ldash*dir(180)--ldash*dir(0);
dash = ldash*dir(-135);
draw(dashpic,pdash,linewidth(1bp));
for(real r=0;r<=1;r=r+0.0025){
P = relpoint(pdash,r);
draw(dashpic,P--P+dash);
}
//画弹簧
guide spring(real d,real h,int nmax){
guide temp,springunit;
temp = O--(d/2,h/2);
springunit = (d/2,-3*h/2)--(-d/2,-h/2)--(d/2,h/2);
for(int i=1;i<nmax;i=i+1){
temp = temp--shift(2*i*h*dir(90))*springunit;
}
temp = temp--(-d/2,nmax*2*h-h/2)--(0,nmax*2*h);
return temp;
}
O = (0,0);
l[1] = 2;
l[2] = 0.7;
alpha = 15;
a[1] = 1.9;
a[2] = 1.4;
a[3] = 0.9;
ddash = 0.06;
draw(l[1]*dir(180-alpha)--l[2]*dir(-alpha),linewidth(1bp));
M = 0.05;
fill(shift(l[2]*dir(-alpha))*scale(M)*unitcircle);
label("$M$",l[2]*dir(-alpha),2*S);
draw(O--0.6*l[2]*dir(90-alpha));
draw(a[1]*dir(180-alpha)--a[1]*dir(180-alpha)+0.6*l[2]*dir(90-alpha));
draw(Label("$a_1$",MidPoint,Relative(W)),a[1]*dir(180-alpha)+0.9*0.6*l[2]*dir(90-alpha)--0.9*0.6*l[2]*dir(90-alpha),Arrows);
draw(a[2]*dir(180-alpha)--a[2]*dir(180-alpha)+0.4*l[2]*dir(90-alpha));
draw(Label("$a_2$",MidPoint,Relative(W)),a[2]*dir(180-alpha)+0.9*0.4*l[2]*dir(90-alpha)--0.9*0.4*l[2]*dir(90-alpha),Arrows);
draw(a[3]*dir(180-alpha)--a[3]*dir(180-alpha)+0.2*l[2]*dir(90-alpha));
draw(Label("$a_3$",MidPoint,Relative(W)),a[3]*dir(180-alpha)+0.9*0.2*l[2]*dir(90-alpha)--0.9*0.2*l[2]*dir(90-alpha),Arrows);
draw(l[2]*dir(-alpha)--l[2]*dir(-alpha)+0.4*l[2]*dir(90-alpha));
draw(Label("$b$",MidPoint,Relative(E)),l[2]*dir(-alpha)+0.9*0.4*l[2]*dir(90-alpha)--0.9*0.4*l[2]*dir(90-alpha),Arrows);
ro = 0.05;
ri = 0.025;
tri = 0.12;
unfill(shift(O)*scale(ro)*unitcircle);
draw(O--tri*dir(-60)--tri*dir(-120)--cycle,linewidth(1bp));
unfill(shift(O)*scale(ri)*unitcircle);
draw(shift(O)*arc(O,ro,-alpha,180-alpha),linewidth(1bp));
draw(shift(O)*scale(ri)*unitcircle,linewidth(1bp));
add(tmp,dashpic);
clip(tmp,box((-1.3*tri,-ddash),(1.3*tri,1)));
add(shift(tri*Sin(60)*dir(-90))*tmp);
label("$O$",O,2*ENE);
l[3] = 1;
erase(tmp);
add(tmp,dashpic);
clip(tmp,box((-0.5*a[2],-ddash),(0.5*a[2],1)));
add(shift(a[2]*dir(180)+l[3]*dir(-90))*tmp);
unfill(shift(a[1]*dir(180-alpha))*scale(ro)*unitcircle);
unfill(shift(a[2]*dir(180-alpha))*scale(ro)*unitcircle);
unfill(shift(a[3]*dir(180-alpha))*scale(ro)*unitcircle);
draw(shift(a[1]*dir(180-alpha))*arc(O,ro,-alpha,180-alpha),linewidth(1bp));
draw(shift(a[2]*dir(180-alpha))*arc(O,ro,-alpha,180-alpha),linewidth(1bp));
draw(shift(a[3]*dir(180-alpha))*arc(O,ro,-alpha,180-alpha),linewidth(1bp));
Ps = a[1]*dir(180-alpha);
Pe = a[1]*dir(180)+l[3]*dir(-90);
ls = 0.1;
le = 0.1;
nmax = 8;
h = (length(Ps-Pe)-ls-le)/2/nmax;
d = 0.1;
draw(Pe--shift(Pe+le*dir(Ps-Pe))*rotate(degrees(Ps-Pe)-90)*spring(d,h,nmax)--Ps,linewidth(1bp));
label("$k_1$",(Pe+Ps)/2,2*W);
Ps = a[2]*dir(180-alpha);
Pe = a[2]*dir(180)+l[3]*dir(-90);
ls = 0.1;
le = 0.1;
nmax = 6;
h = (length(Ps-Pe)-ls-le)/2/nmax;
d = 0.1;
draw(Pe--shift(Pe+le*dir(Ps-Pe))*rotate(degrees(Ps-Pe)-90)*spring(d,h,nmax)--Ps,linewidth(1bp));
label("$k_2$",(Pe+Ps)/2,2*W);
Ps = a[3]*dir(180-alpha);
Pe = a[3]*dir(180)+l[3]*dir(-90);
ls = 0.1;
le = 0.1;
nmax = 14;
h = (length(Ps-Pe)-ls-le)/2/nmax;
d = 0.1;
draw(Pe--shift(Pe+le*dir(Ps-Pe))*rotate(degrees(Ps-Pe)-90)*spring(d,h,nmax)--Ps,linewidth(1bp));
label("$k_3$",(Pe+Ps)/2,2*W);
unfill(shift(a[1]*dir(180-alpha))*scale(ri)*unitcircle);
unfill(shift(a[2]*dir(180-alpha))*scale(ri)*unitcircle);
unfill(shift(a[3]*dir(180-alpha))*scale(ri)*unitcircle);
draw(shift(a[1]*dir(180-alpha))*scale(ri)*unitcircle,linewidth(1bp));
draw(shift(a[2]*dir(180-alpha))*scale(ri)*unitcircle,linewidth(1bp));
draw(shift(a[3]*dir(180-alpha))*scale(ri)*unitcircle,linewidth(1bp));
unfill(shift(a[1]*dir(180)+l[3]*dir(-90))*scale(ri)*unitcircle);
unfill(shift(a[2]*dir(180)+l[3]*dir(-90))*scale(ri)*unitcircle);
unfill(shift(a[3]*dir(180)+l[3]*dir(-90))*scale(ri)*unitcircle);
draw(shift(a[1]*dir(180)+l[3]*dir(-90))*scale(ri)*unitcircle,linewidth(1bp));
draw(shift(a[2]*dir(180)+l[3]*dir(-90))*scale(ri)*unitcircle,linewidth(1bp));
draw(shift(a[3]*dir(180)+l[3]*dir(-90))*scale(ri)*unitcircle,linewidth(1bp));