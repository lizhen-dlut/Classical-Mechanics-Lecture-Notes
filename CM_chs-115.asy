if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-115";
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
//45页5.15
picture tmp,dashpic;
pair O;
real a,r,theta,l,da,d,ri,ro,tri;
O = (0,0);
a = 1;
r = 1.6;
l = 4;
da = 0.4;
d = 0.05;
theta = 50;
draw(shift(O)*scale(a)*unitcircle,linewidth(0.8bp));
draw(tmp,O--r*dir(theta)--l*dir(90),dashed);
draw(tmp,O--l*dir(90),dashed);
draw(box(l*dir(90)-(da,da),l*dir(90)+(da,da)));
draw(tmp,rotate(theta)*box((0,-d),(r,d)),linewidth(0.8bp));
draw(tmp,shift(r*dir(theta))*rotate(degrees(l*dir(90)-r*dir(theta)))*box((0,-d),(length(l*dir(90)-r*dir(theta)),d)),linewidth(0.8bp));
ri = 0.04;
ro = 0.08;
draw(tmp,r*dir(theta)--r*dir(theta)+1*r*dir(theta-90));
unfill(tmp,shift(r*dir(theta))*scale(ro)*unitcircle);
draw(tmp,shift(r*dir(theta))*scale(ro)*unitcircle);
draw(tmp,shift(r*dir(theta))*scale(ri)*unitcircle);
unfill(tmp,shift(l*dir(90))*scale(ro)*unitcircle);
draw(tmp,shift(l*dir(90))*scale(ro)*unitcircle);
draw(tmp,shift(l*dir(90))*scale(ri)*unitcircle);
unfill(tmp,shift(O)*scale(a)*unitcircle);
draw(tmp,Label("$a$",MidPoint,Relative(E)),O--a*dir(150),Arrow);
draw(tmp,a*dir(180)--a*dir(0),dashed);
draw(tmp,O--a*dir(90),dashed);
draw(tmp,O--a*dir(theta),dashed);
draw(tmp,O--1*r*dir(theta-90));
tri = 0.35;
draw(tmp,O--tri*a*dir(-60)--tri*a*dir(-120)--cycle);
unfill(tmp,shift(O)*scale(ro)*unitcircle);
draw(tmp,shift(O)*scale(ro)*unitcircle);
draw(tmp,shift(O)*scale(ri)*unitcircle);
add(tmp);
erase(tmp);
pair dash,P,pace;
int imax;
imax = 20;
dash = 1*dir(120);
pace = 4*da*dir(0)/imax;
P = 2*da*dir(180);
draw(dashpic,2*da*dir(180)--2*da*dir(0),linewidth(1bp));
for(int i=1;i<=imax;i=i+1){
draw(dashpic,P--P+dash);
P = P+pace;
}
add(tmp,dashpic);
clip(tmp,box((-0.3*a,-1),(0.3*a,0.15*a)));
add(shift(tri*Sin(60)*dir(-90))*yscale(-1)*tmp);
erase(tmp);
add(tmp,dashpic);
clip(tmp,box((-1.5*da,-1),(1.5*da,0.15*a)));
add(shift(1.15*da*dir(180)+l*dir(90))*rotate(90)*tmp);
add(shift(1.15*da*dir(0)+l*dir(90))*rotate(-90)*tmp);
label("$A$",l*dir(90),E);
draw(Label("$\boldsymbol{P}$",BeginPoint,Relative(E)),(l+da)*dir(90)+dir(90)--(l+da)*dir(90),Arrow);
draw(a*dir(180)--a*dir(180)+1.2*a*dir(-90),linewidth(0.8bp));
unfill(box(a*dir(180)+1.2*a*dir(-90)-(0.5*da,0.5*da),a*dir(180)+1.2*a*dir(-90)+(0.5*da,0.5*da)));
draw(box(a*dir(180)+1.2*a*dir(-90)-(0.5*da,0.5*da),a*dir(180)+1.2*a*dir(-90)+(0.5*da,0.5*da)));
draw(Label("$\boldsymbol{Q}$",EndPoint,Relative(W)),a*dir(180)+1.2*a*dir(-90)--a*dir(180)+2.2*a*dir(-90),Arrow);
draw(Label("$r$",MidPoint,Relative(E)),0.8*r*dir(theta-90)--r*dir(theta)+0.8*r*dir(theta-90),Arrows);
real rr = 0.5;
draw(Label("$\theta$",MidPoint,Relative(E)),arc(O,rr,theta,90),Arrows);
rr = 1.2;
draw(Label("$\phi$",MidPoint,Relative(E)),arc(l*dir(90),rr,360-90,degrees(r*dir(theta)-l*dir(90))),Arrows);