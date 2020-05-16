%% BatchModifyExtension
ets1='*.mp4';
ets2='rar';

% ets1='*.rar';
% ets2='mp4';

file = dir(ets1); 
for i=1:length(file)
    fileName = file(i).name;
    newName = [fileName(1:end-length(ets1)+2) ets2];               
    movefile(fileName, newName)
end
