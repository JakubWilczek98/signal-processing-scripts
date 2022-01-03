clear all;
close all;
clc;

%% Zad 1: Wszystkie charakterystyki ponizszych ukladow odpowiedzi impulsowe
%Skokowe itp

B1 = [1];
A1 = [1 1.14142 1];
G1 = tf(B1, A1);

B2 = [1 0 0];
A2 = [1 888.97 3.9478*10^5];
G2 = tf(B2, A2);

B3 = [0.5 -2 3];
A3 = [1 2 -0.5 2];
G3 = tf(B3, A3);

%Impuls and step response
[y1_i, t1_i] = impulse(G1);
[y1_s, t1_s] = step(G1);

[y2_i, t2_i] = impulse(G2);
[y2_s, t2_s] = step(G2);

[y3_i, t3_i] = impulse(G3);
[y3_s, t3_s] = step(G3);

% Charakterystyki

[h1, w1] = freqs(B1,A1);
[h2, w2] = freqs(B2,A2);
[h3, w3] = freqs(B3,A3);

f1 = w1/(2*pi);
f2 = w2/(2*pi);
f3 = w3/(2*pi);

% Wykresy

%Uklad 1
figure(1)
sgtitle('Uklad nr 1');
subplot(4,1,1)
plot(t1_i, y1_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(4,1,2)
plot(t1_s, y1_s)
title("Odpowiedz skokowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(4,1,3)
plot(f1, 20*log10(abs(h1)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(4,1,4)
plot(f1, 180*angle(h1)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

%Uklad 2
figure(2)
sgtitle('Uklad nr 2');
subplot(4,1,1)
plot(t2_i, y2_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(4,1,2)
plot(t2_s, y2_s)
title("Odpowiedz skokowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(4,1,3)
plot(f2, 20*log10(abs(h2)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(4,1,4)
plot(f2, 180*angle(h2)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

%Uklad 3
figure(3)
sgtitle('Uklad nr 3');
subplot(4,1,1)
plot(t3_i, y3_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(4,1,2)
plot(t3_s, y3_s)
title("Odpowiedz skokowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(4,1,3)
plot(f3, 20*log10(abs(h3)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(4,1,4)
plot(f3, 180*angle(h3)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

% Stabilnosc
roots_B1 = roots(B1);
roots_A1 = roots(A1);

roots_B2 = roots(B2);
roots_A2 = roots(A2);

roots_B3 = roots(B3);
roots_A3 = roots(A3);

%Stabilnosc ukladu 1
figure(4)
title("Stabilnosc ukladu nr 1")
plot(roots_B1, 'o');
hold on; 
plot(roots_A1, 'x');
hold on; 
grid on;

%Stabilnosc ukladu 2
figure(5)
plot(roots_B2, 'o');
title("Stabilnosc ukladu nr 2")
hold on; 
plot(roots_A2, 'x');
legend("Zera", "Bieguny")
hold on; 
grid on;

%Stabilnosc ukladu 3
figure(6)
plot(roots_B3, 'o');
title("Stabilnosc ukladu nr 3")
hold on; 
plot(roots_A3, 'x');
legend("Zera", "Bieguny")
hold on; 
grid on;

%% Zad 2 - Wyznacz charakterystyki dla ponizszych ukladow analogowych

% Uklad nr 1 - RC
R1 = 1E6;
C1 = 1E-6;

B_RC = [1];
A_RC = [R1*C1, 1];
G_RC = tf(B_RC, A_RC);

%Impuls and step response
[yRC_i, tRC_i] = impulse(G_RC);
[yRC_s, tRC_s] = step(G_RC);

% Charakterystyki

[hRC, wRC] = freqs(B_RC,A_RC);

%Czestotliwosc
fRC = wRC/(2*pi);

%Wykresy - Uklad RC
figure(7)
sgtitle('Uklad RC');
subplot(4,1,1)
plot(tRC_i, yRC_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(4,1,2)
plot(tRC_s, yRC_s)
title("Odpowiedz skokowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(4,1,3)
plot(fRC, 20*log10(abs(hRC)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(4,1,4)
plot(fRC, 180*angle(hRC)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

%Wykresy Układ RLC
%Dla wspl tlumienia = 0.5
R2 = 1E6;
L2 = 1E6;
C2 = 1E-6;

B_RLC = [1];
A_RLC = [L2*C2, R2*C2, 1];
G_RLC = tf(B_RLC, A_RLC);

%Impuls and step response
[yRLC_i, tRLC_i] = impulse(G_RLC);
[yRLC_s, tRLC_s] = step(G_RLC);

% Charakterystyki

[hRLC, wRLC] = freqs(B_RLC,A_RLC);

%Czestotliwosc
fRLC = wRLC/(2*pi);

%Wykresy - Uklad RLC
figure(8)
sgtitle('Uklad RLC');
subplot(4,1,1)
plot(tRLC_i, yRLC_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(4,1,2)
plot(tRLC_s, yRLC_s)
title("Odpowiedz skokowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(4,1,3)
plot(fRLC, 20*log10(abs(hRLC)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(4,1,4)
plot(fRLC, 180*angle(hRLC)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

%% Zad 3 Transmitancja i charakterystki układów złożonych z ukł z zad 1

%Połączenie szeregowe
G_zl_1 = G1*G2;
B_zl_1 = [1 0 0];
A_zl_1 = [1 890.1 3.958e5 4.515e5 394780];

%Impuls and step response
[yG_zl_1_i, tG_zl_1_i] = impulse(G_zl_1);
[yG_zl_1_s, tG_zl_1_s] = step(G_zl_1);

% Charakterystyki

[hG_zl_1, wG_zl_1] = freqs(B_zl_1,A_zl_1);

%Czestotliwosc
fG_zl_1 = wG_zl_1/(2*pi);

%Wykresy - Uklad polaczony szeregowo
figure(9)
sgtitle('Uklad złożony połączony szeregowo');
subplot(4,1,1)
plot(tG_zl_1_i, yG_zl_1_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(4,1,2)
plot(tG_zl_1_s, yG_zl_1_s)
title("Odpowiedz skokowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(4,1,3)
plot(fG_zl_1, 20*log10(abs(hG_zl_1)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(4,1,4)
plot(fG_zl_1, 180*angle(hG_zl_1)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

%Połączenie rownolegle
G_zl_2 = G1+G2
B_zl_2 = [1 1.141 2 889 394780];
A_zl_2 = [1 890.1 3.958e5 4.515e5 394780];

%Impuls and step response
[yG_zl_2_i, tG_zl_2_i] = impulse(G_zl_2);
[yG_zl_2_s, tG_zl_2_s] = step(G_zl_2);

% Charakterystyki

[hG_zl_2, wG_zl_2] = freqs(B_zl_2,A_zl_2);

%Czestotliwosc
fG_zl_2 = wG_zl_2/(2*pi);

%Wykresy - Uklad polaczony szeregowo
figure(10)
sgtitle('Uklad złożony połączony rownolegle');
subplot(4,1,1)
plot(tG_zl_2_i, yG_zl_2_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(4,1,2)
plot(tG_zl_2_s, yG_zl_2_s)
title("Odpowiedz skokowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(4,1,3)
plot(fG_zl_2, 20*log10(abs(hG_zl_2)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(4,1,4)
plot(fG_zl_2, 180*angle(hG_zl_2)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;
