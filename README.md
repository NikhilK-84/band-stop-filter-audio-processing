# band-stop-filter-audio-processing

## Table of Contents
1. [Project Overview](#project-overview)
2. [Files and Directories](#files-and-directories)
3. [Requirements](#requirements)
4. [Usage](#usage)
5. [License](#license)

## Project Overview
This project demonstrates the application of a band-stop filter for audio processing. The goal is to filter out specific frequency ranges from audio signals to reduce or eliminate unwanted noise. The repository contains MATLAB code for adding noise to audio files and applying the band-stop filter.

## Project Overview
1.	To get the results of a Band-reject filter by eliminating higher frequency components from an input audio.
2.	To understand how the band-reject filter shapes the spectrum of the input signal based on the filter characteristics.
3.	To compare the graphs of input, and output audio signals obtained from their frequency and time response.

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

## Instructions for using Scripts
### add_noise_to_audio.m
* This script can be used to add noise to an audio file. The noise here consists of sinusoidal signals with desired frequencies that the user wants to introduce into the audio.
* The code applies noise to the JazzTrio.wav file to generate a noisy audio file named JazzTrioNoisy.wav.
### band_reject_filter_code.m
* 
