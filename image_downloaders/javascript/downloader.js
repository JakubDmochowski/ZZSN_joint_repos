const { default: axios } = require("axios");
const fs = require("fs");
const moment = require("moment");

const emptyImageLength = 3547;

var download = async function (uri, filename) {
  try {
    await axios.get(uri, { responseType: "stream" }).then(async (response) => {
      if (Number(response.headers["content-length"]) > emptyImageLength) {
        await response.data.pipe(fs.createWriteStream(filename));
      }
    });
  } catch (e) {
    console.log(e);
  }
};

const websiteURI = `https://images.webcamgalore.com/oneyear`;
const outputFolder = "../../../images";
const extension = "jpg";
const range = {
  min: 14990,
  max: 15001,
};

const manual = true;

if (manual) {
  const requestURI = `${websiteURI}/01-30/15000.${extension}`;
  download(requestURI, `test.${extension}`, (response) => {
    console.log(response);
  });
} else {
  const now = moment();
  for (let webcamId = range.min; webcamId < range.max; ++webcamId) {
    const date = moment().dayOfYear(1);
    while (date < now) {
      const month = date.format("MM");
      const day = date.format("DD");
      date.add(1, "d");
      const fileCode = `${month}-${day}/${webcamId}.${extension}`;
      const filename = fileCode.replace("/", "_");
      const requestURI = `${websiteURI}/${fileCode}`;
      const outputPath = `${outputFolder ? outputFolder + "/" : ""}${filename}`;
      download(requestURI, outputPath).then(() => {
        console.log(`Downloaded ${filename}`);
      });
    }
  }
}
