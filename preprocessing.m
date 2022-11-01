% -----------------------------------------------------------------------
% --------- Preprocessing: Extracting Matrices for Datastore ------------
% -----------------------------------------------------------------------

clc
clear
close all

% loading files 
path={'/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/1 Speaker',
      '/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/2 Speakers',
      '/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/3 Speakers',
      '/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/4 Speakers',
      '/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/5 Speakers',
      '/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/6 Speakers',
      '/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/7 Speakers',
      '/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/8 Speakers'};
  
window= 400; % Spectrogram window size for 25 ms 
k=1; % Total audio files counter
format= '.mat'; % format output files for processing you can change to .csv
data_chart= {};
% the Value of the corresponding Key should be in categorical format
% For Convolutional Neural Network
C = categorical({'1 talker' '2 talker' '3+ talker'});
% Number of required data from each class for training and validation
% train: 180(30 for each 3+ talker class) - validation: 120(20 for each 3+ talker class)


for i=1:8
    
    if i<=2 
     n_data=720;
    else
     n_data=120;
    end

    % List all audio files in the directory
    fileFolder=fullfile(path{i});
    dirOutput=dir(fullfile(fileFolder,'*'));
    Audio={dirOutput.name}';
    Audio(1:3)=[];
    
    % Generating unique integer number for choosing data
    r= randperm(length(Audio),n_data);
    
    for j=1: n_data
        
        a = audioread([path{i},'/',Audio{r(j)}]);
        %disp(Audio{r(j)})
        [s,f,t,ps]=spectrogram(a,window,'yaxis');
        %filename= ['/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/Data/','s',num2str(k),format];
        % for 2-d CNN we need absolute value of the matrix / if we need the
        % phase part of the signal use 's' instead of 'ps'
        % I updated the DataMix.m file to create 1 speaker files in a proper
        % size and format 
        
        % March 28- 2022 : according to refrence spectogram image input
        % layer should be 49*94 - we will resizing ps in few following line
        
        % convert input signals size to standard size
           ps=ps(1:50,1:95);
           s=s(1:50,1:95);
        
        
        %data_chart{k,1}=cat(3,real(s),imag(s),ps);
        data_chart{k,1}=ps;
        
        
        if i <= 2 
           data_chart{k,2}=C(i);
        else 
           data_chart{k,2}=C(3);
        end
        
        
        %cellsave(filename,'ps')
        k= k+1;
        clear a s f t ps; 
        
        
    end
    clear r;
    
end

% convert cell to dataset(table)
% 1: s (double format)
% 2: ps (absolut value)
% 3: output

Key= data_chart(:,1);
Value= data_chart(:,2);

% Save Input and Output from workspace together as a .mat file
% clear your workspace and load the .mat file 
% create a datastore from it: ds=datastore('-.mat','ReadSize',value)
% now you can import datastore in Deep Network Designer Tool




