clc;
clear all;
close all; 

%% Zad 1

fs = 1000;
T = -0.5:1/fs:2.5;
expon = exp(0.81*-T);

impuls_prostokatny=zeros(1,length(T));

for i = 1:length(impuls_prostokatny)  
    if T(i)< 0
       impuls_prostokatny(1,i) = 0;
    elseif (T(i)>= 0) & (T(i) < 2)
       impuls_prostokatny(1,i) = 1;
    elseif T > 2
       impuls_prostokatny(1,i) = 0;   
    end
end 

figure(1)
subplot(3,1,1)
plot(T,impuls_prostokatny)
title("Impuls prostokatny")
xlabel('Czas [s]')
ylabel('Amplituda')
subplot(3,1,2)
plot(T,expon)
title("Exp")
xlabel('Czas [s]')
ylabel('Amplituda')
subplot(3,1,3)
plot(T,impuls_prostokatny.*expon)
title("Zlozenie")
xlabel('Czas [s]')
ylabel('Amplituda')
grid on;


%% Zad2: Utworz sygnal 

f = 1;
fs = 10000;
n = [5, 50, 1000];
C = 4/pi;
omega = 2*pi*f;
t = 0:1/fs:3;

for j=1:3
    suma=0;
    for i = 1:2:n(:,j)
        suma = suma + ((i+1)*sin((i+1)*omega*t))/(i*(i+2));
    end
suma = C*suma;
Y(j,:)= suma;
end

figure(2)
sgtitle('Sygnal')
subplot(3,1,1);
plot(t,Y(1,:));
title('Funkcja 5 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,2);
plot(t,Y(2,:));
title('Funkcja 50 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,3);
plot(t,Y(3,:));
title('Funkcja 1000 skladnikow')
xlabel('Czas [s]');
ylabel('Amplituda');


%% Zad 3: Conv 

A=[0,0,0,0,0,1,1,1,1,1,0,0,0,0,0];
B=[1,1,1,1,1,0,0,0,0,0,1,1,1,1,1];

convulsion_m = conv(A,B);
B = B(end:-1:1);
newL = length(A) + (2*(length(B)-1));
newA = zeros(1,newL);
newB = zeros(1,newL);
for i = 1:length(A)
 newA(length(B)-1+i) = A(i);
end
dl=(newL-length(B)+1);
wynik = [];
for k = 0:dl-1
 u = 1;
 for j = 1:length(B)
 newB(u+k) = B(u); 
 u = u + 1;
 end
 wynik = [wynik, sum(newA.*newB)];
 
 newB = zeros(1,newL);
end
convulsion_w = wynik;
g = [convulsion_w; convulsion_m];

blad = convulsion_m - convulsion_w;

figure(3)
subplot(3,1,1)
plot(convulsion_m)
title("Funkcja Matlab")
subplot(3,1,2)
plot(convulsion_w)
title("Funkcja wlasna")
subplot(3,1,3)
plot(blad)
title("Blad")

%% Zad 4: Korelacja
t4 = 0:0.001:0.999;

Y4 = [zeros(1,1000),0.1*sin(2*pi*10*t4)];
X4 = [sin(2*pi*10*t4), zeros(1,1000)];

autocorr1 =xcorr(Y4);
autocorr2 =xcorr(X4);
cor = xcorr(Y4,X4);

figure(4)
subplot(3,1,1)
plot(autocorr1)
title('Autokorelacka Y4')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,2)
plot(autocorr2)
title('Autokorelacka X4')
xlabel('Czas [s]');
ylabel('Amplituda');
subplot(3,1,3)
plot(cor)
title('Korleacja X4 i Y4')
xlabel('Czas [s]');
ylabel('Amplituda');
