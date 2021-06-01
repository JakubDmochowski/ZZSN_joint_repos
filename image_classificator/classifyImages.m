clearvars;

directory = '../images';
directoryDelimiter = '/';

sunnyDirname = '../images/sunny';
cloudyDirname = '../images/cloudy';

fileinfo = dir(strcat(directory, directoryDelimiter, '*.jpg'));
fnames = {fileinfo.name};

mkdir(sunnyDirname);
mkdir(cloudyDirname);

for filename = fnames
    inputFilePath = strcat(directory, directoryDelimiter, filename{1});
    image = im2double(imread(inputFilePath));
    if ndims(image) ~= 3
        image = cat(3, image, image, image);
    end
    
    [label, score] = weather_predict(image); % score is resulting SVM score.
    if label == 1
        outputFilePath = strcat(cloudyDirname, directoryDelimiter, filename{1});
    else
        outputFilePath = strcat(sunnyDirname, directoryDelimiter, filename{1});
    end
    copyfile(inputFilePath, outputFilePath);
end

