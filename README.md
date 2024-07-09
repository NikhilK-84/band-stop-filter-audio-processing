# band-stop-filter-audio-processing

## Table of Contents
1. [Project Overview](#project-overview)
2. [Project Goals](#project-goals)
3. [Files and Directories](#files-and-directories)
4. [Requirements](#requirements)
5. [Usage](#usage)
6. [License](#license)

## Project Overview
The Band-Stop Filter Audio Processing project aims to demonstrate the implementation and effects of a band-stop filter on various audio signals. Band-stop filters, also known as band-reject or notch filters, are used to attenuate frequencies within a specified range while allowing frequencies outside that range to pass through. This project includes MATLAB scripts for adding noise to an audio file and applying a band-stop filter to different types of audio signals. Specifically, the project designs a tenth-order Butterworth filter and utilizes a bilinear transform for filter implementation. Additionally, it provides a set of various bandwidths to select from, allowing users to experiment with different filtering effects. The project also includes options for selecting different audio files for processing, offering a comprehensive overview of audio filtering techniques. The repository contains all necessary code, audio files, and documentation to facilitate understanding and replication of the experiments.

## Project Goals
1. To demonstrate the results of a band-reject filter by eliminating higher frequency components from an input audio signal.
2. To understand how the band-reject filter shapes the spectrum of the input signal based on the filter characteristics.
3. To compare the frequency and time domain representations of the input and output audio signals.

## Files and Directories
band-stop-filter-audio-processing <br>
│ <br>
├── Band Stop Filter Report.pdf  (detailed report on the band-stop filter implementation) <br>
├── README.md  (project documentation) <br>
├── LICENSE  (license information) <br>
│ <br>
├── scripts  (directory containing MATLAB code and audio files) <br>
│ ├── add_noise_to_audio.m  (MATLAB script to add noise to audio files) <br>
│ ├── band_reject_filter_code.m  (MATLAB script implementing the band-stop filter) <br>
│ ├── audio  (directory containing audio files) <br>
│ │ ├── JazzTrio.wav  (original jazz trio audio file) <br>
│ │ ├── JazzTrioNoisy.wav  (jazz trio audio file with added noise) <br>
│ │ ├── Harpsichord_Melody.mp3  (harpsichord melody audio file) <br>
│ │ └── White_Noise.wav  (white noise audio file) <br>

## Requirements
- MATLAB or Octave software
- Audio Processing Toolbox (for MATLAB users)

## Usage
### add_noise_to_audio.m
* This script can be used to add noise to an audio file. The noise here consists of sinusoidal signals with desired frequencies that the user wants to introduce into the audio.
* The code applies noise to the JazzTrio.wav file to generate a noisy audio file named JazzTrioNoisy.wav.

### band_reject_filter_code.m
This script designs and applies a band-stop filter to an audio file. The user can select from three audio files: white noise, a music track, or a noisy music track. The script then designs a band-stop filter based on the user-selected bandwidth and applies it to the chosen audio file.
1. **Audio Selection**: The script displays three audio choices: White Noise, Music Track, and Noisy Music Track. The user selects one of these options.
2. **Reading the Audio File**: The script reads the chosen audio file and displays the current sampling rate.
3. **Bandwidth Choices**: The script displays six available frequency-bandwidth choices, allowing the user to select one.
4. **Filter Design**: The script designs a band-stop filter using a Butterworth filter. It computes the stopband frequencies, center frequency, and bandwidth.
5. **Applying the Filter**: The script applies the designed filter to the chosen audio file.
6. **Frequency and Time Domain Analysis**: The script plots the frequency and time domain representations of the input and filtered audio signals.
7. **Audio Playback**: The script plays the input and output (filtered) audio files sequentially.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
