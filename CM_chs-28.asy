if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-28";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

texpreamble("\usepackage{xeCJK}");
texpreamble("\setCJKmainfont{SimSun}");
usepackage("amsmath");
import graph;
import math;
size(200);
//空间转动
pair O,OO,R1,R2;
real h,r,theta;
path cir;
O = (0,0);
h = 2;
r = 1;
theta = -30;
OO = rotate(theta)*(0,2);
cir = shift(OO)*rotate(theta)*yscale(1/2)*scale(r)*unitcircle;
draw(Label("$\boldsymbol{e}$",EndPoint),O--3/2*OO,Arrow);
draw(cir);
R1 = relpoint(cir,0.85);
R2 = relpoint(cir,0.95);
draw(R1--OO--R2);
draw(Label("$\delta \boldsymbol{r}_i$",MidPoint,N),R1--R2,red,Arrow);
draw(Label("$\boldsymbol{r}_i$",MidPoint,Relative(W)),O--R1,Arrow);
draw(Label("$\boldsymbol{r}_i+\delta \boldsymbol{r}_i$",MidPoint,Relative(E)),O--R2,Arrow);
label("$\delta q_1$",OO,5*dir((R1+R2)/2-OO));
//draw(O--(2.1,0),invisible);