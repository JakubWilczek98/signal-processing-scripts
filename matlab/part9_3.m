clc;
clear all;
close all;

%% zad 6
fs = 1000;
F = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
A = [1 1 1 0.5 0.5 0.7 0.7 0.7 0.1 0.1 0.1];

[B6, A6] = yulewalk(4, F, A);

%Impuls response
[y6_i, t6_i] = impz(B6,A6);

%Charakterystyki

[h6, w6] = freqz(B6,A6);

%Czestotliwosc
f6 = (w6*fs)/(2*pi);

% Wykresy
figure(1)
sgtitle('Uklad nr 6');
subplot(3,1,1)
stem(t6_i, y6_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(3,1,2)
plot(f6, 20*log10(abs(h6)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(3,1,3)
plot(f6, 180*angle(h6)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

% Stabilnosc
roots_B6 = roots(B6);
roots_A6 = roots(A6);

% Koło jednostkowe
t_jednostkowe=0:2*pi/1000:2*pi;
r=1;
x_jednostkowe=r*cos(t_jednostkowe);
y_jednostkowe=r*sin(t_jednostkowe);

%Stabilnosc ukladu 6
figure(2)
plot(roots_B6, 'o');
title("Stabilnosc ukladu nr 6")
hold on; 
plot(roots_A6, 'x');
hold on; 
plot(x_jednostkowe,y_jednostkowe);
hold on; 
grid on;

%% Zad 7
N = 4;
fo1 = 200;
fo2 = 300;

[z,p,k] = buttap(N);
[A,B,C,D] = zp2ss(z,p,k);
u1=2*fs*tan(fo1*(2*pi/fs)/2);
u2=2*fs*tan(fo2*(2*pi/fs)/2);
Bw = u2 - u1;
Wo = sqrt(u1*u2);
[At,Bt,Ct,Dt] = lp2bp(A,B,C,D,Wo,Bw);
[Ad,Bd,Cd,Dd] = bilinear(At,Bt,Ct,Dt,fs);
[bz,az] = ss2tf(Ad,Bd,Cd,Dd);

%Impuls response
[y7_i, t7_i] = impz(bz,az);

%Charakterystyki

[h7, w7] = freqz(bz,az);

%Czestotliwosc
f7 = (w7*fs)/(2*pi);

% Wykresy
figure(3)
sgtitle('Uklad nr 7');
subplot(3,1,1)
stem(t7_i, y7_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(3,1,2)
plot(f7, 20*log10(abs(h7)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(3,1,3)
plot(f7, 180*angle(h7)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

% Stabilnosc
roots_B7 = roots(bz);
roots_A7 = roots(az);

% Koło jednostkowe
t_jednostkowe=0:2*pi/1000:2*pi;
r=1;
x_jednostkowe=r*cos(t_jednostkowe);
y_jednostkowe=r*sin(t_jednostkowe);

%Stabilnosc ukladu 7
figure(4)
plot(roots_B7, 'o');
title("Stabilnosc ukladu nr 7")
hold on; 
plot(roots_A7, 'x');
hold on; 
plot(x_jednostkowe,y_jednostkowe);
hold on; 
grid on;

%% zad 8 Testy
ft_1 = 100;
ft_2 = 250;
ft_3 = 400;

time =0:1/fs:1.023;

Amp1 = 1;

omega1 = 2*pi*ft_1;
omega2 = 2*pi*ft_2;
omega3 = 2*pi*ft_3;

y = Amp1*sin(omega1*time)+Amp1*sin(omega2*time)+Amp1*sin(omega3*time);

%Filtr Y-W

y_filter_6 = filter(B6,A6,y);
N6 = length(y_filter_6);
S6 = fft(y_filter_6);
widmo_fft_S6 = sqrt(S6.*conj(S6))/N6;
F6 = fs*(0:N6/2-1)/N6;
widmo6 = widmo_fft_S6(1:N6/2);

figure(5)
sgtitle('Filtr Y-W')
subplot(2,1,1)
plot(time,y_filter_6)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F6,widmo6)
title('Widmo sygnalu po filtracji filtrem Y-W')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on;

%Filtr ukladu 7

y_filter_7 = filter(bz,az,y);
N7 = length(y_filter_7);
S7 = fft(y_filter_7);
widmo_fft_S7 = sqrt(S7.*conj(S7))/N7;
F7 = fs*(0:N7/2-1)/N7;
widmo7 = widmo_fft_S6(1:N7/2);

figure(6)
sgtitle('Filtr z układu 7')
subplot(2,1,1)
plot(time,y_filter_7)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F7,widmo7)
title('Widmo sygnalu po filtracji filtrem z układu 7 ')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on;
