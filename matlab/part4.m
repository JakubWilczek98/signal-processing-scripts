clear all; 
close all;
clc; 


%% Parametry
fs = 10000;
t = -5:1/fs:5;

%% Zad 1: Sygnal wykladniczo malejacy e^(-t)*skok jednostkowy
x1 = exp(-t);

%Skok jednostkowy
for i =1:length(t)
    if t(i)<0
        x(i)=0;
    elseif t(i)>0
        x(i)=1;
    else x(i)=1/2;
    end
end

%Wykres skoku jednostkowego - x

figure(1)
subplot(3,1,1)
plot(t,x)
title('Skok jednostkowy');
xlabel('Czas [s]');
ylabel('Amplituda');
grid on; 

%Wykres sygnalu e^(-t) - x1

subplot(3,1,2)
plot(t,x1)
title('Sygnal x (e do (-t))');
xlabel('Czas [s]');
ylabel('Amplituda');
grid on; 

%Wykres zlozenia powyzszych sygnalow x1*x

xz=x1.*x;

subplot(3,1,3)
plot(t,xz)
title('Sygnal x1*x ');
xlabel('Czas [s]');
ylabel('Amplituda');
grid on;

%% Rozkład na składowa parzystą i nie parzystą

%Przywolanie funkcji znajdujacej sie na koncu kodu
evenandodd(t,xz);

%% Zad 2: Sygnaly zespolone harmoniczne na podstawie rownania eulera

%Dane
A=0.5;
alfa=5;
f1= 15;
t = 1:(1/fs):1.5;
omega = 2*pi*f1;
 
euler = complex(A*cos(omega*t),A*sin(omega*t));
y2=real(euler);
z=imag(euler);

%% Wykresy 3D przy pomocy plot3

figure(3)
plot3(t,y2,z)
title('Sygnal trojwymiarowy na wykresie 3D');
xlabel('Czas [s]');
ylabel('Czesc rzeczywista');
zlabel('Czesc urojona');
grid on;

euler_wm = complex(A*cos(omega*t),A*sin(omega*t)).*exp(-t*alfa);
y2_wm=real(euler_wm);
z_wm=imag(euler_wm);

figure(4)
plot3(t,y2_wm,z_wm)
title('Sygnal trojwymiarowy na wykresie 3D wymnozony z wykladniczo malejacym');
xlabel('Czas [s]');
ylabel('Czesc rzeczywista');
zlabel('Czesc urojona');
grid on;

%% Sygnaly szeregow fouriera

C=(4*A/pi); %stala
n=[5,50,100]; %liczba skladnikow
C=4*A/pi;

for j=1:3
    suma=0;
    for i=1:2:n(:,j)
        suma=suma+((1/i)*sin(i*omega*t));
    end
suma=suma*C;
Y(j,:)=suma;
end

figure(5)
sgtitle('Sygnal prostokatny bipolarny')
%5
subplot(3,1,1)
plot(t,Y(1,:))
title('Funkcja 5 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
%50
subplot(3,1,2)
plot(t,Y(2,:))
title('Funkcja 50 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
%10000
subplot(3,1,3)
plot(t,Y(3,:))
title('Funkcja 10000 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');

%% Prostokatny unipolarny z wypelnieniem 1/2

C1=A/2;
C2=2*(A/pi);
for j=1:3
    suma1=0;
    for i=1:4:n(:,j)
        suma1=suma1+((1/i)*cos(i*omega*t));
    end
    for i=3:4:n(:,j)
        suma1=suma1-((1/i)*cos(i*omega*t));
    end
    suma1=(suma1*C2)+C1;
    Y1(j,:)=suma1;
end

figure(6)
sgtitle('Sygnal prostokatny unipolarny z wypelnieniem 1/2')
subplot(3,1,1);
plot(t,Y1(1,:));
title('Funkcja 5 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,2);
plot(t,Y1(2,:));
title('Funkcja 50 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,3);
plot(t,Y1(3,:));
title('Funkcja 1000 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');

%% Prostokatny unipolarny z wypelnieniem dowolnym

T=1; %1/f
tau=0.5;
for j=1:3
    suma2=0;
    for i=1:1:n(:,j)
        suma2=suma2+sin((i*pi*tau)/(T))*cos(i*omega*t)/((i*pi*tau)/(T));
    end
    suma2=((A*tau)/(T))+((2*A*tau*suma2)/(T));
    Y2(:,j)=suma2;
end

figure(7)
sgtitle('Sygnal prostokatny unipolarny z wypelnieniem dowolnym')
subplot(3,1,1);
plot(t,Y2(:,1));
title('Funkcja 5 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,2);
plot(t,Y2(:,2));
title('Funkcja 50 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,3);
plot(t,Y2(:,3));
title('Funkcja 10000 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');

%% Trojkatny bipolarny 1

C3=8*A/(pi*pi);
for j=1:3
    suma3=0;
    for i=1:4:n(:,j)
        suma3=suma3+(1/(i^2))*sin(i*omega*t);
    end
    for i=3:4:n(:,j)
        suma3=suma3-(1/(i^2))*sin(i*omega*t);
    end
    Y3(j,:)=suma3*C3;
end

figure(8)
sgtitle('Sygnal trojkatny bipolarny 1')
subplot(3,1,1)
plot(t,Y3(1,:))
title('Funkcja 5 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,2)
plot(t,Y3(2,:))
title('Funkcja 50 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,3)
plot(t,Y3(3,:))
title('Funkcja 10000 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');

%% Trojkatny bipolarny 2

C4=2*A/(pi);
for j=1:3
    suma4=0;
    for i=1:2:n(:,j)
        suma4=suma4+(1/(i))*sin(i*omega*t);
    end
    for i=2:2:n(:,j)
        suma4=suma4-(1/(i))*sin(i*omega*t);
    end
    Y4(j,:)=suma4*C4;
end
figure(9)
sgtitle('Sygnal trojkatny bipolarny 2')
subplot(3,1,1)
plot(t,Y4(1,:))
title('Funkcja 5 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,2)
plot(t,Y4(2,:))
title('Funkcja 50 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,3)
plot(t,Y4(3,:))
title('Funkcja 10000 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');

%% Trojkatny unipolarny 1

C5=-4*A/(pi*pi);
C6=A/2;
for j=1:3
    suma5=0;
    for i=0:n(:,j)
        suma5=suma5+(1/((2*i+1)^2))*cos((2*i+1)*omega*t);
    end
    Y5(j,:)=(suma5*C5)+C6;
end
figure(10)
sgtitle('Sygnal trojkatny unipolarny 1')
subplot(3,1,1)
plot(t,Y5(1,:))
title('Funkcja 5 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,2)
plot(t,Y5(2,:))
title('Funkcja 50 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,3)
plot(t,Y5(3,:))
title('Funkcja 10000 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');

%% Trojkatny unipolarny 2

C7=-A/(pi);
C8=A/2;
for j=1:3
    suma6=0;
    for i=1:n(:,j)
        suma6=suma6+(1/i)*sin(i*omega*t);
    end
    Y6(j,:)=(suma6*C7)+C8;
end
figure(11)
sgtitle('Sygnal trojkatny unipolarny 2')
subplot(3,1,1)
plot(t,Y6(1,:))
title('Funkcja 5 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,2)
plot(t,Y6(2,:))
title('Funkcja 50 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,3)
plot(t,Y6(3,:))
title('Funkcja 10000 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');

%% Sinusoidalny wyprostowany dwupolowkowo

C9=2*A/(pi);
C10=-4*A/(pi);
for j=1:3
    suma7=0;
    for i=1:n(:,j)
        suma7=suma7+(1/(4*i*i-1))*cos(2*i*omega*t);
    end
    Y7(j,:)=(suma7*C10)+C9;
end
figure(12)
sgtitle('Sygnal sinusoidalny wyprostowany dwupolowkowo')
subplot(3,1,1)
plot(t,Y7(1,:))
title('Funkcja 5 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,2)
plot(t,Y7(2,:))
title('Funkcja 50 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,3)
plot(t,Y7(3,:))
title('Funkcja 10000 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');

%% Sinusoidalny wyprostowany jednopolowkowo

C11=A/(pi);
C12=A/2;
C13=-2*A/pi;
for j=1:3
    suma8=0;
    for i=1:n(:,j)
        suma8=suma8+(1/(4*i*i-1))*cos(2*i*omega*t);
    end
    Y8(j,:)=(suma8*C13)+(sin(omega*t)*C12)+C11;
end
figure(13)
sgtitle('Sygnal sinusoidalny wyprostowany jednopolowkowo')
subplot(3,1,1)
plot(t,Y8(1,:))
title('Funkcja 5 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,2)
plot(t,Y8(2,:))
title('Funkcja 50 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,3)
plot(t,Y8(3,:))
title('Funkcja 10000 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');

function [xe,xo] = evenandodd(t,x)  
    x_reverse = fliplr(x);% Odwrocenie czasu
    xe = 0.5*(x + x_reverse); %Czesc parzysta
    xo = 0.5*(x - x_reverse); %Czesc nieparzysta
    %wykresy
    figure(2)
    subplot(3,1,1);
    plot(t,x);
    grid on;
    title('Sygnal oryginalny x')
    subplot(3,1,2); 
    plot(t,xe);
    grid on;
    title('Parzysta czesc sygnalu');
    subplot(3,1,3);
    plot(t,xo);
    grid on;
    title('Nieparzysta czesc sygnalu');
end
