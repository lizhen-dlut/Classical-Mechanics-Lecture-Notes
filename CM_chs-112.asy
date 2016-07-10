if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
defaultfilename="CM_chs-112";
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
size(200);
//37页4.57受力分析2
pair O;
real theta,alpha,phi,P,T1,NN,l,r,delta;
O = (0,0);
theta = 130;
alpha = 50;
phi = theta-alpha/2-90;
P = 2;
T1 = P/Sin(theta-alpha-phi)*Sin(90+phi);
NN = P/Sin(theta-alpha-phi)*Sin(90-theta+alpha);
draw(Label("$\boldsymbol{N}$",EndPoint,Relative(E)),O--NN*dir(-phi),Arrow);
draw(Label("$\boldsymbol{T}_1$",MidPoint,Relative(E)),NN*dir(-phi)--NN*dir(-phi)+T1*dir(180-theta+alpha),Arrow);
draw(Label("$\boldsymbol{P}_1$",EndPoint,Relative(E)),NN*dir(-phi)+T1*dir(180-theta+alpha)--O,Arrow);
l = NN/Sin(180-theta+alpha)*Sin(theta-alpha-phi);
r = 0.1;
draw(NN*dir(-phi)+T1*dir(180-theta+alpha)--NN*dir(-phi)+T1*dir(180-theta+alpha)+l*dir(0),dashed);
draw(Label("$\theta-\alpha$",MidPoint,Relative(E)),arc(NN*dir(-phi)+T1*dir(180-theta+alpha),r,-theta+alpha,0),Arrows);
delta = 15;
draw(O--l*dir(0),dashed);
r = 0.2;
draw(Label("$\phi$",BeginPoint,E),arc(O,r,delta,0),Arrow);
draw(arc(O,r,-phi-delta,-phi),Arrow);
r = 0.15;
//draw(Label("$\alpha$",MidPoint,Relative(E)),arc(T2*dir(180-theta),r,-theta,-theta+alpha),Arrows);

dot(NN*dir(-phi)+T1*dir(180-theta+alpha)+(0,0.01),invisible);