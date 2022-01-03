clc;
clear all;
close all;
format long e

%% Zad 1: Wyrysuj impulsy: prostokątny, trójkątny, piłokształtny

%Dane
fs = 10000;
t=0:(1/fs):3;

% Impuls prostokatny

impuls_prostokatny=zeros(size(t));
impuls_prostokatny(10000:19999)=1;
%impuls_prost(22000:24999)=1/2;

figure(1)
plot(t,impuls_prostokatny)
title("Impuls prostokatny")
xlabel('Czas [s]')
ylabel('Amplituda')
grid on;

% Impuls trojkatny

impuls_trojkatny=zeros(size(t));
impuls_trojkatny_1=0;
impuls_trojkatny_2=0;

for i=(1:5000)
    impuls_trojkatny_1(i)=i/5000;
    impuls_trojkatny_2(i)=(5000-i)/5000;
end

impuls_trojkatny(10000:14999)=impuls_trojkatny_1;
impuls_trojkatny(15000:19999)=impuls_trojkatny_2;

figure(2)
plot(t,impuls_trojkatny)
title("Impuls trojkatny")
xlabel('Czas [s]')
ylabel('Amplituda')
grid on;

% Impuls piloksztaltny

impuls_piloksztaltny=zeros(size(t));
impuls_piloksztaltny_1=0;

for i=1:10000
 impuls_piloksztaltny_1(i)=i/10000;
end

impuls_piloksztaltny(10000:19999)=impuls_piloksztaltny_1;

figure(3)
plot(t,impuls_piloksztaltny)
title('Impuls piloksztaltny')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on;


%% Zad 2: 	Utwórz oraz wyrysuj funkcje harmoniczne sin oraz cos
%Czas
t1=0:0.001:1;

%Czestotliwosci
f1=100;
f2=200;

%Amplitudy 
A=1 %sin
B=0.5 %cos
omega1= 2*pi*f1;
omega2= 2*pi*f2;

%Generowanie sygnalow
y1= A*sin(omega1*t1);
y2= B*cos(omega2*t1);

figure(4)
subplot(4,1,1)
plot(t1,y1)
xlabel('Czas [s]')
ylabel('Amplituda')
title('Wykres funkcji sinus oryginalny')
grid on;

subplot(4,1,3)
plot(t1,y2)
xlabel('Czas [s]')
ylabel('Amplituda')
title('Wykres funkcji cosinus oryginalny')
grid on;

%% Zapis przebiegow do pliku

plik = fopen('F:\Semestr2MGR\CPS\Lab2\plik.txt','w');

fprintf(plik, '%12.4f %12.f %12.4f\n',[t1;y1;y2]) 
fclose('all')

%% Wczytanie i wyrysowanie wczesniej zapisanych wartosci z pliku txt
plik = fopen('F:\Semestr2MGR\CPS\Lab2\plik.txt','r')
A = fscanf(plik,'%g',[3,inf]);
 
fclose('all')

B = A';
size(A);
size(B);


subplot(4,1,2)
plot(A(1,:),A(2,:))
xlabel('Czas [s]')
ylabel('Amplituda')
title('Wykres funkcji sinus po wczytaniu')
grid on;

subplot(4,1,4)
plot(A(1,:),A(3,:))
xlabel('Czas [s]')
ylabel('Amplituda')
title('Wykres funkcji cosinus po wczytaniu')
grid on;



%% Wyznaczenie roznic pomiedzy wartosciami przed i po zapisie

t2= t1 - A(1,:);
x1= y1 - A(2,:);
x2= y2 - A(3,:);

figure(5)
subplot(3,1,1)
plot(t1,t2)
xlabel('Czas [s]')
ylabel('Amplituda')
title('Roznica czasu po odczycie')
grid on;
subplot(3,1,2)
plot(t1,x1,'r')
xlabel('Czas [s]')
ylabel('Amplituda')
title('Roznica funkcji sinus po odczycie')
grid on;
subplot(3,1,3)
plot(t1,x2,'g')
xlabel('Czas [s]')
ylabel('Amplituda')
title('Roznica funkcji cosinus po odczycie')
grid on;

%zmieniamy notacje na e i dodajemy 24


