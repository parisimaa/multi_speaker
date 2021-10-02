% -----------------------------------------------------------------------
% ------------- Creating .WAV with more than 2 speakers -----------------
% -----------------------------------------------------------------------
%% --------------------------- Processing -------------------------------
clc
clear 
close all

path='/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/1 Speaker';
fileFolder=fullfile(path); % open new resampled audios
dirOutput=dir(fullfile(fileFolder,'*')); % go to the direstion
Audio={dirOutput.name}';  % create a list
Audio(1:3)=[];

% reading audio files
l=[]; 
% we need to set all audio files to a specific length for further mixture
% we consider minimum length as standard
for i= 1:length(Audio)
    a = audioread([path,'/',Audio{i}]);
    audio_name = [Audio{i}(1:end-4)];
    eval([audio_name '=a;']);
    l(i)= length(eval(Audio{i}(1:end-4)));
    clear a audio_name;
end


% Randomly choose two Audio file among 4620 file to evaluate for further
% concatenation 
%% --------------------------- 2 SPEAKERS -------------------------------
for j=1:10
    % generating unique integers from 4620
    r= randperm(length(Audio),2);
    x= eval(Audio{r(1)}(1:end-4)); % speaker 1
    y= eval(Audio{r(2)}(1:end-4)); % speaker 2
    % if the selected speakers were different then concatenate them
    if strcmp(Audio{r(1)}(1:5),Audio{r(2)}(1:5))==0
       a = x(1:min(l)) + y(1:min(l));
       filename = ['/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/2 Speakers/',Audio{r(1)}(1:end-4),'&',Audio{r(2)}(1:end-4),'.wav'];  
       audiowrite(filename,a,16000);  
    end   
    clear a x y; 
end

%% --------------------------- 3 SPEAKERS -------------------------------
for j=1:10
    r= randperm(length(Audio),3);
    x= eval(Audio{r(1)}(1:end-4)); % speaker 1
    y= eval(Audio{r(2)}(1:end-4)); % speaker 2
    z= eval(Audio{r(3)}(1:end-4)); % speaker 3
    % if the selected speakers were different then concatenate them
    m=[];
    for i=1:length(r)-1
        for k=i:length(r)-1
            m=strcmp(Audio{r(i)}(1:5),Audio{r(k+1)}(1:5));
        end
    end
    if (prod(~m,'all'))==1
       a = x(1:min(l)) + y(1:min(l)) + z(1:min(l));
       filename = ['/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/3 Speakers/',Audio{r(1)}(1:end-4),'&',Audio{r(2)}(1:end-4),'&',Audio{r(3)}(1:end-4),'.wav'];  
       audiowrite(filename,a,16000);   
    end 
    clear m a x y z;
end
%% --------------------------- 4 SPEAKERS -------------------------------
for j=1:10
    r= randperm(length(Audio),4);
    x= eval(Audio{r(1)}(1:end-4)); % speaker 1
    y= eval(Audio{r(2)}(1:end-4)); % speaker 2
    z= eval(Audio{r(3)}(1:end-4)); % speaker 3
    w= eval(Audio{r(4)}(1:end-4)); % speaker 4
    % if the selected speakers were different then concatenate them
    m=[];
    for i=1:length(r)-1
        for k=i:length(r)-1
            m=strcmp(Audio{r(i)}(1:5),Audio{r(k+1)}(1:5));
        end
    end
    if (prod(~m,'all'))==1
       a = x(1:min(l)) + y(1:min(l)) + z(1:min(l)) + w(1:min(l));
       filename = ['/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/4 Speakers/',Audio{r(1)}(1:end-4),'&',Audio{r(2)}(1:end-4),'&',Audio{r(3)}(1:end-4),'&',Audio{r(4)}(1:end-4),'.wav'];  
       audiowrite(filename,a,16000);  
    end   
    clear m a x y z w; 
end

%% --------------------------- 5 SPEAKERS -------------------------------
for j=1:10
    r= randperm(length(Audio),5);
    x= eval(Audio{r(1)}(1:end-4)); % speaker 1
    y= eval(Audio{r(2)}(1:end-4)); % speaker 2
    z= eval(Audio{r(3)}(1:end-4)); % speaker 3
    w= eval(Audio{r(4)}(1:end-4)); % speaker 4
    v= eval(Audio{r(5)}(1:end-4)); % speaker 5
    % if the selected speakers were different then concatenate them
    m=[];
    for i=1:length(r)-1
        for k=i:length(r)-1
            m=strcmp(Audio{r(i)}(1:5),Audio{r(k+1)}(1:5));
        end
    end
    if (prod(~m,'all'))==1
       a = x(1:min(l)) + y(1:min(l)) + z(1:min(l)) + w(1:min(l)) + v(1:min(l));
       filename = ['/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/5 Speakers/',Audio{r(1)}(1:end-4),'&',Audio{r(2)}(1:end-4),'&',Audio{r(3)}(1:end-4),'&',Audio{r(4)}(1:end-4),'&',Audio{r(5)}(1:end-4),'.wav'];  
       audiowrite(filename,a,16000);  
    end  
    clear m a x y z w v; 
end
%% --------------------------- 6 SPEAKERS -------------------------------
for j=1:10
    r= randperm(length(Audio),6);
    x= eval(Audio{r(1)}(1:end-4)); % speaker 1
    y= eval(Audio{r(2)}(1:end-4)); % speaker 2
    z= eval(Audio{r(3)}(1:end-4)); % speaker 3
    w= eval(Audio{r(4)}(1:end-4)); % speaker 4
    v= eval(Audio{r(5)}(1:end-4)); % speaker 5
    o= eval(Audio{r(6)}(1:end-4)); % speaker 6
    % if the selected speakers were different then concatenate them
    m=[];
    for i=1:length(r)-1
        for k=i:length(r)-1
            m=strcmp(Audio{r(i)}(1:5),Audio{r(k+1)}(1:5));
        end
    end
    if (prod(~m,'all'))==1
       a = x(1:min(l)) + y(1:min(l)) + z(1:min(l)) + w(1:min(l)) + v(1:min(l)) + o(1:min(l));
       filename = ['/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/6 Speakers/',Audio{r(1)}(1:end-4),'&',Audio{r(2)}(1:end-4),'&',Audio{r(3)}(1:end-4),'&',Audio{r(4)}(1:end-4),'&',Audio{r(5)}(1:end-4),'&',Audio{r(6)}(1:end-4),'.wav'];  
       audiowrite(filename,a,16000);  
    end  
    clear m a x y z w v o; 
end

%% --------------------------- 7 SPEAKERS -------------------------------
for j=1:10
    r= randperm(length(Audio),7);
    x= eval(Audio{r(1)}(1:end-4)); % speaker 1
    y= eval(Audio{r(2)}(1:end-4)); % speaker 2
    z= eval(Audio{r(3)}(1:end-4)); % speaker 3
    w= eval(Audio{r(4)}(1:end-4)); % speaker 4
    v= eval(Audio{r(5)}(1:end-4)); % speaker 5
    o= eval(Audio{r(6)}(1:end-4)); % speaker 6
    u= eval(Audio{r(7)}(1:end-4)); % speaker 7
    % if the selected speakers were different then concatenate them
    m=[];
    for i=1:length(r)-1
        for k=i:length(r)-1
            m=strcmp(Audio{r(i)}(1:5),Audio{r(k+1)}(1:5));
        end
    end
    if (prod(~m,'all'))==1
       a = x(1:min(l)) + y(1:min(l)) + z(1:min(l)) + w(1:min(l)) + v(1:min(l)) + o(1:min(l)) + u(1:min(l));
       filename = ['/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/7 Speakers/',Audio{r(1)}(1:end-4),'&',Audio{r(2)}(1:end-4),'&',Audio{r(3)}(1:end-4),'&',Audio{r(4)}(1:end-4),'&',Audio{r(5)}(1:end-4),'&',Audio{r(6)}(1:end-4),'&',Audio{r(7)}(1:end-4),'.wav'];  
       audiowrite(filename,a,16000);  
    end  
    clear m a x y z w v o u; 
end
%% --------------------------- 8 SPEAKERS -------------------------------
for j=1:10
    r= randperm(length(Audio),8);
    x= eval(Audio{r(1)}(1:end-4)); % speaker 1
    y= eval(Audio{r(2)}(1:end-4)); % speaker 2
    z= eval(Audio{r(3)}(1:end-4)); % speaker 3
    w= eval(Audio{r(4)}(1:end-4)); % speaker 4
    v= eval(Audio{r(5)}(1:end-4)); % speaker 5
    o= eval(Audio{r(6)}(1:end-4)); % speaker 6
    u= eval(Audio{r(7)}(1:end-4)); % speaker 7
    p= eval(Audio{r(7)}(1:end-4)); % speaker 8
    % if the selected speakers were different then concatenate them
    m=[];
    for i=1:length(r)-1
        for k=i:length(r)-1
            m=strcmp(Audio{r(i)}(1:5),Audio{r(k+1)}(1:5));
        end
    end
    if (prod(~m,'all'))==1
       a = x(1:min(l)) + y(1:min(l)) + z(1:min(l)) + w(1:min(l)) + v(1:min(l)) + o(1:min(l)) + u(1:min(l)) + p(1:min(l));
       filename = ['/Users/apple/Documents/MATLAB/Speaker Detection/TRAIN/8 Speakers/',Audio{r(1)}(1:end-4),'&',Audio{r(2)}(1:end-4),'&',Audio{r(3)}(1:end-4),'&',Audio{r(4)}(1:end-4),'&',Audio{r(5)}(1:end-4),'&',Audio{r(6)}(1:end-4),'&',Audio{r(7)}(1:end-4),'&',Audio{r(8)}(1:end-4),'.wav'];  
       audiowrite(filename,a,16000);  
    end  
    clear m a x y z w v o u p; 
end