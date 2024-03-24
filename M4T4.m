clc; clf; clear all;

y0 = 4000; %Altura inicial
v0 = 200; %Velocidad inicial
an = 60; %Angulo en grados
m = 500; %masa del proyectil
delta = 0.5;

cd = 0.35;
d = 1.29;
a = 3.14;

g = 9.8;
x0 = 0;
vx0 = v0 * cos(deg2rad(an));
vy0 = v0 * sin(deg2rad(an));
k = (cd * d * a) / 2;

i = 1;
x(i) = x0;
vx(i) = vx0;
ax(i) = (-k/m) * v0 * vx0;
y(i) = y0;

vy(i) = vy0;
ay(i) = -g-(k/m) * v0 * vy0;
v(i) = v0;
t(i) = 0;

while min(y) > 0
    t = [t,t(i)+delta];

    vx = [vx, vx(i)+(ax(i)*delta)];
    vy = [vy, vy(i)+(ay(i)*delta)];

    x = [x, x(i)+(vx(i+1)*delta)];
    y = [y, y(i)+(vy(i+1)*delta)];

    v = [v, sqrt(vx(i+1)^2+vy(i+1)^2)];

    ax = [ax, (-k/m) * v(i+1)*vx(i+1)];
    ay = [ay, -g - (k/m)*v(i+1)*vy(i+1)];
    
    i = i + 1;
end

display(x);

display(y);

display(vx);

display(vy);

display(v);

display(ax);

display(ay);

%figure(1)
%plot(x,y)
res = scatter(x,y); %Crear una matriz de dos columnas para graficar
for i =1:30:length(x) %para cada 30 pts
 dt = datatip(res,x(i),y(i));
end
title("Vector Velocidad")
xlabel("Distancia")
ylabel("Altura")
hold on
plot (900,500,"b*")
plot (700,500,"r*")
