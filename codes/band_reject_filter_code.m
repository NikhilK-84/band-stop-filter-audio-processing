clc; clear; close all;

% Display audio choices
disp('Available audio choices:');
disp('1. White Noise');
disp('2. Music Track');
disp('3. Noisy Music Track');

audio_choice = input("Enter the audio choice (digits 1-3): ");
switch audio_choice
    case 1
        file = "audio/White_Noise.wav";
    case 2
        file = "audio/Harpsichord_Melody.mp3";
    case 3
        file = "audio/JazzTrioNoisy.wav";
    otherwise
        error('Error. Select from the available choices.');
end

[x, fs] = audioread(file);
disp("The current sampling rate is: " + fs + " Hz");
fl_vector = fs.*[1/96, 1/48, 1/24, 1/12, 1/6, 1/4.8];

disp("The following frequency-bandwidth choices are available: ");
disp("Center Frequency: " + fs/4 + " Hz");
for i = 1:length(fl_vector)
    disp(i + ". Bandwidth: " + ((fs/2 - 2*fl_vector(i))));
end

choice = input("Enter your choice (digits 1-6): ");
if choice > length(fl_vector) || choice < 1
    error('Error. Select from the available choices.');
end

% define the stopband frequencies
fl = fl_vector(choice);
fh = fs/2 - fl;

% design the analog lpf
order = 10;
[z,p,k] = buttap(order);
[b,a] = zp2tf(z,p,k);

% pre-warping of frequencies: 
u1 = 2*fs*tan((2*pi*fl)*(1/fs)/2);
u2 = 2*fs*tan((2*pi*fh)*(1/fs)/2); 

Wo = sqrt(u1 * u2);                 % center frequency
Bw = abs(u2-u1);                    % bandwidth

[bs,as] = lp2bs(b,a,Wo,Bw);
[bd, ad] = bilinear(bs, as, fs);
y = filter(bd, ad, x);

[Hz, f] = freqz(bd, ad, 4096, fs);

N = length(x);
X = fft(x);
Y = fft(y);

freq = (0:(N-1)/2) * (fs / N); % 0 to fs/2 Hz
figure(1)
subplot(4, 1, 1)
plot(freq, abs(X(1:length(freq)))),
title('spectrum of i/p audio signal'),
xlabel('frequency (Hz)'), ylabel('magnitude')
subplot(4, 1, 3)
plot(freq, abs(Y(1:length(freq)))),
title(['frequency response of filter: fc1 = ',num2str(fl),' Hz and fc2 = ',num2str(fh), ' Hz']),
xlabel('frequency (Hz)'), ylabel('magnitude')
subplot(4, 1, 2)
plot(f, abs(Hz)), title('spectrum of filtered audio signal'),
xlabel('frequency (Hz)'), ylabel('magnitude')
subplot(4, 1, 4)
plot(f, angle(Hz)), title('phase response of filter'),
xlabel('frequency (Hz)'), ylabel('magnitude')

time = (0:N-1)/fs;
figure(2)
subplot(2, 1, 1)
plot(time, x),
title('Time domain input signal'),
xlabel('time in seconds'), ylabel('Magnitude')
subplot(2, 1, 2)
plot(time, y),
title('Time domain output signal'),
xlabel('time in seconds'), ylabel('Magnitude')

disp("Now playing..Input");
x_input = audioplayer(x, fs);
play(x_input);
playblocking(x_input);
pause(2);
disp("Now playing..Output");
y_output = audioplayer(y, fs);
play(y_output);
playblocking(y_output);