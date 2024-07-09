[audio, f] = audioread("audio/JazzTrio.wav");
N = length(audio);
t = (0:N-1)/f;

% Generate sinusoidal signals
sin1 = 0.02 * sin(2 * pi * 4500 * t);
sin2 = 0.02 * sin(2 * pi * 10000 * t) + 0.03 * sin(2 * pi * 18000 * t);
cos1 = 0.02 * cos(2 * pi * 7500 * t) + 0.03 * cos(2 * pi * 15000 * t);

% Add the sinusoidal signals
x = (sin1 + sin2 + cos1);

% Adjust the length of generated signal to match audio
x = x(1:N);

% Adjust the length of audio to match the generated signal
audio = audio(1:N);

% Combine the generated signal with the audio
modifiedAudio = x + audio;

% Normalize the modified audio to prevent clipping
modifiedAudio = modifiedAudio / max(abs(modifiedAudio));

% Play the modified audio
sound(modifiedAudio, f);
audiowrite("JazzTrioNoisy.wav",modifiedAudio, f);