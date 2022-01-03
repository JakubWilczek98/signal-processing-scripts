clear all;
close all; 
clc;

%% Zadanie 1 - filtr butterwortha

fo1 = 200;
N = 2;
fs = 1000;

wn1 = (2*fo1)/fs;

%Filtr butterwortha
[B1,A1] =butter(N, wn1, 'low');

%Impuls response
[y1_i, t1_i] = impz(B1,A1);

%Charakterystyki

[h1, w1] = freqz(B1,A1);

%Czestotliwosc
f1 = (w1*fs)/(2*pi);

% Wykresy
figure(1)
sgtitle('Uklad nr 1');
subplot(3,1,1)
stem(t1_i, y1_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(3,1,2)
plot(f1, 20*log10(abs(h1)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(3,1,3)
plot(f1, 180*angle(h1)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

% Stabilnosc
roots_B1 = roots(B1);
roots_A1 = roots(A1);

% Koło jednostkowe
t_jednostkowe=0:2*pi/1000:2*pi;
r=1;
x_jednostkowe=r*cos(t_jednostkowe);
y_jednostkowe=r*sin(t_jednostkowe);

%Stabilnosc ukladu 1
figure(2)
plot(roots_B1, 'o');
title("Stabilnosc ukladu nr 1")
hold on; 
plot(roots_A1, 'x');
hold on; 
plot(x_jednostkowe,y_jednostkowe);
hold on; 
grid on;

%% Zad 2 Filtr cheby1

wn1 = (2*fo1)/fs;

%Filtr cheby1
[B2,A2] =cheby1(N, 3, wn1, 'high');

%Impuls response
[y2_i, t2_i] = impz(B2,A2);

%Charakterystyki

[h2, w2] = freqz(B2,A2);

%Czestotliwosc
f2 = (w2*fs)/(2*pi);

% Wykresy
figure(3)
sgtitle('Uklad nr 2');
subplot(3,1,1)
stem(t2_i, y2_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(3,1,2)
plot(f2, 20*log10(abs(h2)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(3,1,3)
plot(f2, 180*angle(h2)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

% Stabilnosc
roots_B2 = roots(B2);
roots_A2 = roots(A2);

% Koło jednostkowe
t_jednostkowe=0:2*pi/1000:2*pi;
r=1;
x_jednostkowe=r*cos(t_jednostkowe);
y_jednostkowe=r*sin(t_jednostkowe);

%Stabilnosc ukladu 2
figure(4)
plot(roots_B2, 'o');
title("Stabilnosc ukladu nr 2")
hold on; 
plot(roots_A2, 'x');
hold on; 
plot(x_jednostkowe,y_jednostkowe);
hold on; 
grid on;

%% Zad 3 Filtr cheby2
fo2 = 300;

wn1 = (2*fo1)/fs;
wn2 = (2*fo2)/fs;

%Filtr cheby2
[B3,A3] =cheby1(N, 3, [wn1,wn2], 'bandpass');

%Impuls response
[y3_i, t3_i] = impz(B3,A3);

%Charakterystyki

[h3, w3] = freqz(B3,A3);

%Czestotliwosc
f3 = (w3*fs)/(2*pi);

% Wykresy
figure(5)
sgtitle('Uklad nr 3');
subplot(3,1,1)
stem(t3_i, y3_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(3,1,2)
plot(f3, 20*log10(abs(h3)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(3,1,3)
plot(f3, 180*angle(h3)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

% Stabilnosc
roots_B3 = roots(B3);
roots_A3 = roots(A3);

% Koło jednostkowe
t_jednostkowe=0:2*pi/1000:2*pi;
r=1;
x_jednostkowe=r*cos(t_jednostkowe);
y_jednostkowe=r*sin(t_jednostkowe);

%Stabilnosc ukladu 3
figure(6)
plot(roots_B3, 'o');
title("Stabilnosc ukladu nr 3")
hold on; 
plot(roots_A3, 'x');
hold on; 
plot(x_jednostkowe,y_jednostkowe);
hold on; 
grid on;

%% Zad 4 Filtr ellip

%Filtr ellip
[B4,A4] =ellip(4, 3, 20, [wn1,wn2], 'stop');

%Impuls response
[y4_i, t4_i] = impz(B4,A4);

%Charakterystyki

[h4, w4] = freqz(B4,A4);

%Czestotliwosc
f4 = (w4*fs)/(2*pi);

% Wykresy
figure(7)
sgtitle('Uklad nr 4');
subplot(3,1,1)
stem(t4_i, y4_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(3,1,2)
plot(f4, 20*log10(abs(h4)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(3,1,3)
plot(f4, 180*angle(h4)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

% Stabilnosc
roots_B4 = roots(B4);
roots_A4 = roots(A4);

% Koło jednostkowe
t_jednostkowe=0:2*pi/1000:2*pi;
r=1;
x_jednostkowe=r*cos(t_jednostkowe);
y_jednostkowe=r*sin(t_jednostkowe);

%Stabilnosc ukladu 4
figure(8)
plot(roots_B4, 'o');
title("Stabilnosc ukladu nr 4")
hold on; 
plot(roots_A4, 'x');
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

%Filtr butterwortha

y_filter_1 = filter(B1,A1,y);
N1 = length(y_filter_1);
S1 = fft(y_filter_1);
widmo_fft_S1 = sqrt(S1.*conj(S1))/N1;
F1 = fs*(0:N1/2-1)/N1;
widmo1 = widmo_fft_S1(1:N1/2);

figure(9)
sgtitle('Filtr dolnoprzepustowym Butterwortha')
subplot(2,1,1)
plot(time,y_filter_1)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F1,widmo1)
title('Widmo sygnalu po filtracji filtrem dolnoprzepustowym Butterwortha')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on;

%Filtr Cheby1

y_filter_2 = filter(B2,A2,y);
N2 = length(y_filter_2);
S2 = fft(y_filter_2);
widmo_fft_S2 = sqrt(S2.*conj(S2))/N2;
F2 = fs*(0:N2/2-1)/N2;
widmo2 = widmo_fft_S2(1:N2/2);

figure(10)
sgtitle('Filtr gornoprzepustowym Cheby1')
subplot(2,1,1)
plot(time,y_filter_2)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F2,widmo2)
title('Widmo sygnalu po filtracji filtrem gornoprzepustowym Cheby1')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on


%Filtr Cheby2

y_filter_3 = filter(B3,A3,y);
N3 = length(y_filter_3);
S3 = fft(y_filter_3);
widmo_fft_S3 = sqrt(S3.*conj(S3))/N3;
F3 = fs*(0:N3/2-1)/N3;
widmo3 = widmo_fft_S3(1:N3/2);

figure(11)
sgtitle('Filtr pasmowoprzepustowym Cheby2')
subplot(2,1,1)
plot(time,y_filter_3)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F3,widmo3)
title('Widmo sygnalu po filtracji filtrem pasmowoprzepustowym Cheby2')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on

%Filtr Ellip

y_filter_4 = filter(B4,A4,y);
N4 = length(y_filter_4);
S4 = fft(y_filter_4);
widmo_fft_S4 = sqrt(S4.*conj(S4))/N4;
F4 = fs*(0:N4/2-1)/N4;
widmo4 = widmo_fft_S4(1:N4/2);

figure(12)
sgtitle('Filtr Ellip')
subplot(2,1,1)
plot(time,y_filter_4)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F4,widmo4)
title('Widmo sygnalu po filtracji filtrem Ellip')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on




