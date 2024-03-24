clc; clf; clear all;
m = 2340; % masa en kg
g = 9.81; % gravedad
dt = 10; % incremento en el tiempo
% lapso de tiempo
t = 0:dt:5000; % va de 0 hasta 5000 de 10 en 10
a = 4000; % la altura del volcan
figure(1)
hold on
b = 2000;
ba = 500;
x = [-b,-ba,ba,b];
y = [0,a,a,0];
plot([-b,-ba,ba,b],[0,a,a,0],'k')
xlim([-a, a])
ylim([0 6000])
xlabel("Tiempo") % Título eje x
ylabel("Altura")% Título eje y
grid on
v0 = linspace(100,80,5); % *velocidad inicial en m/s
ang = linspace(135,45,5)% *ángulo de disparo en grados
for i=1:length(v0)
    for j=1:length(ang)
        dibuja(g,v0(i),ang(j),t,a)
    end
end
function dibuja (g,v0,ang,t,a)
    %dibujar a la izquierda para el segundo cuadrante
    if (ang > 90) && (ang < 180)
        izquierda(g,v0,ang,t,a)
    end
    %dibujar a la derecha para el primer cuadrante
    if (ang > 0) && (ang < 90)
       derecha(g,v0,ang,t,a)
    end
end
function izquierda(g,v0,ang,t,a)
    ang=deg2rad(180-ang);
    y_t = a + t * tan(ang)-(g*t.^2)/(2*v0^2 *cos(ang)^2);
    % posición en 'y' con respecto al tiempo
    for i=1:5:length(t)
        plot(-t(i),y_t(i),'+b')
        pause(0.005)
    end
end
function derecha(g,v0,ang,t,a)
    ang=deg2rad(ang); %convertir a radianes los grados
    y_t = a + t * tan(ang)-(g*t.^2)/(2*v0^2 *cos(ang)^2);
    % posición en 'y' con respecto al tiempo
    for i=1:5:length(t)
        plot(t(i),y_t(i),'+m')
        pause(0.005)
    end
end
