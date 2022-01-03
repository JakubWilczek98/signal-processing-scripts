clc;
clear all;

%% Parametry sygnalu
f1 =15;
f2 = 1000;
fs = 10000;

%Amplitudy
A=1;
B=0.5;

%Czas
t=0:1/fs:1;

omega1 = 2*pi*f1;
omega2= 2*pi*f2;

%% Zad 1: Wygeneroj sygnał sin i cos
y1 = A*sin(omega1*t);
y2 = B*cos(omega2*t);


figure(1)
subplot(2,1,1)
plot(t,y1)
title('Signal funkcji sin')
xlabel('czas [s]')
ylabel('Amplituda')
grid on;

subplot(2,1,2)
plot(t,y2)
axis([0 0.01 -0.5 0.5])
title('Signal funkcji cos')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on;

%% Zad 2: Wygeneruj sygnal wykladniczo malejacy

C=1;
alfa = 20;
i=0;
for i = 1:length(t)
    if t(i)>0
        x(i)=C*(exp(-alfa*t(i)));
    else
        x(i)=0;
    end
end


C=1;
alfa = 50;
i=0;
for i = 1:length(t)
    if t(i)>0
        x1(i)=C*(exp(-alfa*t(i)));
    else
        x1(i)=0;
    end
end



%% Zad 3. Utworz sygnal wynikowy z 1 oraz 2.

syg_wyn1 = x.*y1;
syg_wyn2 = x1.*y1;

figure(2)
subplot(2,1,1)
plot(t,x,t,syg_wyn1)
axis([0 0.6 0 1])
title('Signal wykladniczy malejacy do 0 w 0.5')
xlabel('czas [s]')
ylabel('Amplituda')
grid on;
subplot(2,1,2)
plot(t,x1,t,syg_wyn2)
axis([0 0.6 0 1])
title('Signal wykladniczy malejacy do 0 po okresie')
xlabel('czas [s]')
ylabel('Amplituda')
grid on;


%% Zad 4 Utworz sygnal zmodulowany sin jest obwiednia a cos wypelnieniem

figure(3)
y4 = y1.*y2;
subplot(2,1,1)
plot(t,y4)
title('Signal zmodulowany')
xlabel('czas [s]')
ylabel('Amplituda')
grid on; 
subplot(2,1,2)
plot(t,y4)
axis([0 0.1 -0.5 0.5])
title('Signal zmodulowany przybliżony')
xlabel('czas [s]')
ylabel('Amplituda')
grid on; 

%% Zad 5. Wygeneruj sygnal Sa przy pomocy funkcji Sinc

y5 = sinc(t);

figure(4)
plot(t,y5)
title('Sygnal Sa')
xlabel('czas [s]')
ylabel('Amplituda')

%% Wyznaczanie parametrów sygnału min, max, srednia, energia.

%Sygnaly
y1;
y2;
syg_wyn1;
syg_wyn2;
y4;
y5;
sygnaly = [y1;y2;syg_wyn1;syg_wyn2;y4;y5]';


%% Wartości minimalne

for i = 1:6
    sygnal = sygnaly(:,i);
    min_w(i)=f_min(sygnal,length(sygnal));
    min_m(i)=min(sygnal);
 end

%% Wartosci maksymalne 

for i = 1:6
    sygnal = sygnaly(:,i);
    max_w(i)=f_max(sygnal,length(sygnal));
    max_m(i)=max(sygnal);
end

%% Wartosci srednie 

for i = 1:6
    sygnal = sygnaly(:,i);
    mean_w(i)=f_sr(sygnal,length(sygnal));
    mean_m(i)=mean(sygnal);
end

%% Wartosci energii sygnalu

for i = 1:6
    sygnal = sygnaly(:,i);
    energia_w(i)=f_energia(sygnal,length(sygnal));
    energia_m(i)=sum(sygnal.*sygnal);
end

%% Zapis parametrów do pliku Binarnego

parametry_w = [min_w; max_w; mean_w; energia_w];
parametry_m = [min_m; max_m; mean_m; energia_m];

parametry_w_o = fopen('.\parametry_w.bin','w');
fprintf(parametry_w_o, '%12.4f %12.4f %12.4f %12.4f\n', parametry_w);
fclose('all');

parametry_m_o = fopen('.\parametry_m.bin','w');
fprintf(parametry_m_o, '%12.4f %12.4f %12.4f %12.4f\n', parametry_m);
fclose('all');



%% Wyznacznie roznic pomiedzy parametrami przed i po zapisie

plik1 = fopen('.\parametry_w.bin','r');
parametry_w_r = fscanf(plik1,'%g %g %g %g %g\n',[4,inf]);

plik2 = fopen('.\parametry_m.bin','r');
parametry_m_r = fscanf(plik2,'%g %g %g %g %g\n',[4,inf]);

roznice_w = parametry_w - parametry_w_r; 
roznice_m = parametry_m - parametry_m_r; 
format short g

x = roznice_m'
