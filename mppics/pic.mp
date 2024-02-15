input macros
input hatching
input mparrows

verbatimtex
%&latex
\documentclass[a4paper,10pt]{article}
\usepackage{../paper-en}
\begin{document}
etex

filenametemplate "%j-%1c.mps";
prologues:=3;
setarrows(barbedsharp);
linecap:=butt;
%linejoin:=mitered;
%filenametemplate "%j-%1c.svg";
outputformat := "eps";

beginfig(5) 
save u, p;
path p[];
u:=.5cm;

z.p=origin;
z.q=(2,0)*u;
p1=z.p{1,-1}..z.q{up}..{-1,.5}z.p;

draw circle(z.p, z.q-z.p);
draw p1;

dOt z.p,z.q;

label.lft (btex $p$ etex, z.p);
label.rt (btex $q$ etex, z.q);
label.bot (btex $\gamma$ etex, point .5 of p1);
endfig;

beginfig(10) 
save u, p, e, r;
path p[];
u:=.7cm;
e:=.4*u;
r:=2*u;

z.x=origin;
z.x1=(2.8,.2)*u;
z.x0=(-2.8,-.3)*u;

draw circle(z.x, r+e);
p1=z.x0{1,1}..z.x{1,-1}..{0,1}z.x1;
draw p1 pensemibold;

l=arclength (subpath (0,1) of p1);

z.s=point (arctime (l-r) of p1) of p1;
z.e=point (arctime (l+r) of p1) of p1;

for t=0 step r/10 until (2*r)+1: 
draw 
(point arctime l-r+t of p1 of p1)+(unitvector(direction arctime l-r+t of p1 of p1) zscaled (0,e))
--
(point arctime l-r+t of p1 of p1)-(unitvector(direction arctime l-r+t of p1 of p1) zscaled (0,e))
 penhair withcolor .6;
endfor

draw 
for t=0 step r/10 until (2*r)-1: 
(point arctime l-r+t of p1 of p1)+(unitvector(direction arctime l-r+t of p1 of p1) zscaled (0,e))..
endfor
(point arctime l+r of p1 of p1)+(unitvector(direction arctime l+r of p1 of p1) zscaled (0,e))
penhair withcolor .6;

draw
for t=0 step r/10 until (2*r)-1: 
(point arctime l-r+t of p1 of p1)-(unitvector(direction arctime l-r+t of p1 of p1) zscaled (0,e))..
endfor
(point arctime l+r of p1 of p1)-(unitvector(direction arctime l+r of p1 of p1) zscaled (0,e))
penhair withcolor .6;

dOt z.x;

label.lrt (btex $M$ etex, z.x1);
label.top (btex {\small $B(x,R+\eps)_{\RR^q}$} etex, z.x-(0,r+e)+(0,4));
label (btex {\small $\pi^{-1}[B(x,R)_{M}]$} etex rotated -28, z.x+(.5*e,1.8*e));
whitelabel.llft (btex $x$ etex, z.x+(-1,-1));

endfig;


beginfig(20) 
save u, p;
path p[];
u:=1.4cm;

z.x=origin;
z.p=(0,1)*u rotated 30;
z.q=z.p rotated -70;
z.pq=(0,1)*u scaled 1.2;
z.pp= z.p rotated 20 scaled 1.5;
z.qq= z.q rotated -15 scaled 2;

p1=z.pp..z.p{z.p rotated -90}..z.pq..z.q{z.q rotated -90}..z.qq;

draw circle(z.x,z.p);
draw p1 pensemibold;
draw z.x--z.pq;

dOt z.x,z.p,z.q,z.pq;

label.bot (btex $x$ etex, z.x);
label.ulft (btex $f(p)$ etex, z.p+(2,0));
label.urt (btex $f(q)$ etex, z.q+(-1,0));
label.top (btex $y$ etex,z.pq);
label.rt (btex $r$ etex,.5[z.x,z.pq]);
label.lrt (btex $f(M)$ etex, point 3.5 of p1);
endfig;

end
