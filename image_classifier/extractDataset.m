clearvars;

directory = '../images';
directoryDelimiter = '/';

sunnyDirname = '../images/sunny';
cloudyDirname = '../images/cloudy';

outputCloudyDirname = '../images/content';
outputSunnyDirname = '../images/style';

cloudyImages = dir(strcat(cloudyDirname, directoryDelimiter, '*.jpg'));
sunnyImages = dir(strcat(sunnyDirname, directoryDelimiter, '*.jpg'));
cloudyfnames = {cloudyImages.name};
sunnyfnames = {sunnyImages.name};

imageCount = min(length(cloudyImages), length(sunnyImages));

imagePrefix = 'weather_';
imageExtension = '.jpg';
mkdir(outputCloudyDirname);
mkdir(outputSunnyDirname);
for index = 1:imageCount
    imageName = strcat(imagePrefix, int2str(index), imageExtension);
    inputCloudyFilepath = strcat(cloudyDirname, directoryDelimiter, cloudyfnames{index});
    outputCloudyFilepath = strcat(outputCloudyDirname, directoryDelimiter, imageName);
    inputSunnyFilepath = strcat(sunnyDirname, directoryDelimiter, sunnyfnames{index});
    outputSunnyFilepath = strcat(outputSunnyDirname, directoryDelimiter, imageName);
    copyfile(inputCloudyFilepath, outputCloudyFilepath);
    copyfile(inputSunnyFilepath, outputSunnyFilepath);
end