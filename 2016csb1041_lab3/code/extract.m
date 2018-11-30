function [X,Y] = extract( )

% path of folder & read data.txt
path_of_folder = '../steering/';
f1 = fopen('../steering/data.txt','r');
A = textscan(f1,'%c %c %s %f');
pos_imgfiles = A{3}; 
labels = A{4}; 
Y = labels(2:size(labels,1),:); 
fclose(f1);

% put into csv
fprintf('wait... \n');
if(exist('Images.csv','file')==0)
    pos_imgfiles = char(pos_imgfiles);
    X = zeros(length(pos_imgfiles)-1,1024);
    for i = 2:length(pos_imgfiles)
        I = imread(strcat(path_of_folder, pos_imgfiles(i,:)));
        X(i-1,:) = reshape(rgb2gray(I)',[1 1024]);
    end
    csvwrite('Images.csv',X);
end
X = csvread('Images.csv');

end

