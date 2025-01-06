const axios = require("axios");
const cheerio = require("cheerio");
const fs = require("fs");
const path = require("path");

// Tạo danh sách các đường dẫn, chương 7 có 6 sections
const links = [];
for (let chapter = 1; chapter <= 7; chapter++) {
  const sectionCount = chapter === 7 ? 6 : 5; // Chương 7 có 6 sections, các chương khác có 5
  for (let section = 1; section <= sectionCount; section++) {
    const url = `https://jtest.net/tu-vung-n4/chapter-${chapter}/section-${section}`;
    links.push(url);
  }
}

// Hàm tải file MP3
async function downloadMP3(url, outputPath) {
  try {
    const response = await axios.get(url, { responseType: "stream" });
    const writer = fs.createWriteStream(outputPath);
    response.data.pipe(writer);
    return new Promise((resolve, reject) => {
      writer.on("finish", resolve);
      writer.on("error", reject);
    });
  } catch (error) {
    console.error(`Lỗi khi tải file: ${url} - ${error.message}`);
  }
}

// Hàm lấy link MP3 từ HTML
async function fetchMp3Links(url) {
  try {
    // Gửi yêu cầu GET đến URL
    const { data } = await axios.get(url);

    // Load HTML vào cheerio
    const $ = cheerio.load(data);

    // Tìm thẻ button trong tbody > tr > th
    const mp3Links = [];
    $("tbody > tr > th > button").each((index, button) => {
      const link = $(button).attr("value"); // Lấy thuộc tính value
      if (link && link.endsWith(".mp3")) {
        mp3Links.push(link);
      }
    });

    console.log(`Đã tìm thấy ${mp3Links.length} link MP3 từ ${url}:`, mp3Links);
    return mp3Links;
  } catch (error) {
    console.error(`Lỗi khi xử lý ${url}:`, error.message);
    return [];
  }
}

// Hàm để chạy và tải tất cả file MP3 từ tất cả các link
async function getAndDownloadAllMp3() {
  const downloadDir = "../Sound/N4"; // Thư mục lưu file MP3
  if (!fs.existsSync(downloadDir)) {
    fs.mkdirSync(downloadDir, { recursive: true });
  }

  for (const link of links) {
    const mp3Links = await fetchMp3Links(link);
    for (const mp3Link of mp3Links) {
      const fileName = path.basename(mp3Link); // Lấy tên file từ URL
      const outputPath = path.join(downloadDir, fileName);
      console.log(`Đang tải: ${mp3Link} -> ${outputPath}`);
      await downloadMP3(mp3Link, outputPath);
    }
  }

  console.log("Tất cả các file MP3 đã được tải xuống.");
}

// Chạy hàm
getAndDownloadAllMp3();
