% -----------------------------------------------------------------------
% --------------- Extracting .WAV data and resampling--------------------
% -----------------------------------------------------------------------

clc
clear
close all

% add the path of TIMIT dataset
path='/Users/apple/Documents/MATLAB/Speaker Detection/TIMIT Database/TIMIT/TRAIN';
fileFolder=fullfile(path); % going to path
dirOutput=dir(fullfile(fileFolder,'*')); % extracting folder's names 
TrainFolder={dirOutput.name}'; % adding folder names to a cell
TrainFolder(1:3)=[]; % erasing irrelevent cells

% Output TrainFolder is DR1 through DR8 folders

% searching trough folders
for i=1:length(TrainFolder) 
    fileFolder=fullfile(path,TrainFolder{i});
    dirOutput=dir(fullfile(fileFolder,'*'));
    DRSubF={dirOutput.name}'; 
    DRSubF(1:2)=[];
    % Output DRSubF is F-- through M--- folders
    for j=1:length(DRSubF)
        fileFolder=fullfile(path,TrainFolder{i},DRSubF{j});
        dirOutput=dir(fullfile(fileFolder,'*'));
        Audio={dirOutput.name}';
        % Output Audio is files with different suffix- (.WAV) is desired
        a=[];
        emp_test=isempty(Audio); % testing if the file is empty
        if emp_test~=1
        for k=1:length(Audio)
            fileFolder=fullfile(path,TrainFolder{i},DRSubF{j},Audio{k});
            [filepath,name,ext] = fileparts(fileFolder);
            if ext==".WAV" % there are other files in the main database folder too
               [temp_audio,Fs] = audioread([path,'/',TrainFolder{i},'/',DRSubF{j},'/',Audio{k}]);
               temp_audio=resample(temp_audio,16000,Fs); % resampling to a standard STFT frame size
               %a = [a; temp_audio];
               a= temp_audio;
               filename = ['/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/1 Speaker/',DRSubF{j},'_',Audio{k}(1:end-4),'.wav'];
               audiowrite(filename,a,16000); % audio write (sampling with 16khz rate)
               clear a Fs;
            end
        end
        end 
    end
end
