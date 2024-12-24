const axios = require("axios");
const cheerio = require("cheerio");
const fs = require("fs");

// Tạo danh sách các đường dẫn
const links = [];
for (let chapter = 1; chapter <= 12; chapter++) {
  for (let section = 1; section <= 5; section++) {
    const url = `https://jtest.net/tu-vung-n3/chapter-${chapter}/section-${section}`;
    links.push(url);
  }
}

// Dữ liệu chứa tất cả từ vựng
let allVocabularyData = [];
let idCounter = 1; // ID từ vựng tự tăng

// Hàm lấy dữ liệu từ một trang
async function fetchVocabularyData(url) {
  try {
    // Gửi request GET đến trang
    const { data } = await axios.get(url);
    const $ = cheerio.load(data);

    // Lấy dữ liệu từ bảng từ vựng
    $("table tr").each((index, row) => {
      const cells = $(row).find("td");
      if (cells.length > 0) {
        // Lấy ID từ thẻ <th> (trong thẻ scope="row")
        let id = $(row).find("th").text().trim() || "Không có ID";

        // Tạo selector cho Furigana theo ID
        let furiganaId = `furigana${id}`; // Tạo ID động dựa vào số ID trong <th>
        let furigana =
          $(cells[0]).find(`#${furiganaId}`).text().trim() ||
          "Không có Furigana";

        // Lấy các thông tin khác từ bảng
        const kanji =
          $(cells[0]).find("h5 small").text().trim() || "Không có Hán tự";
        const meaning =
          $(cells[0]).find("span").text().trim() || "Không có nghĩa";
        const example = $(cells[1]).find("p").text().trim() || "Không có ví dụ";
        const exampleMeaning =
          $(cells[1]).find("span").text().trim() || "Không có nghĩa ví dụ";

        // Lấy chapter và lessons từ thẻ main > p > span thứ 2 và thứ 4
        let chapter =
          $("main p span").eq(1).text().trim().replace(/\D/g, "") ||
          "Không có chapter";
        let lessons =
          $("main p span").eq(3).text().trim().replace(/\D/g, "") ||
          "Không có lessons";

        // Tạo đối tượng từ vựng
        const entry = {
          id: idCounter++, // ID từ vựng tự động tăng
          kanji: kanji,
          furigana: furigana,
          meaning: meaning,
          example: example,
          exampleMeaning: exampleMeaning,
          chapter: chapter,
          lessons: lessons,
        };

        // Đẩy đối tượng vào mảng dữ liệu
        allVocabularyData.push(entry);
      }
    });
  } catch (error) {
    console.error(`Lỗi khi lấy dữ liệu từ ${url}:`, error.message);
  }
}

// Hàm để chạy và lấy dữ liệu từ tất cả các link
async function getAllVocabularyData() {
  for (let link of links) {
    await fetchVocabularyData(link);
  }

  // Chuyển mảng dữ liệu thành định dạng JSON
  const jsonData = JSON.stringify(allVocabularyData, null, 2);

  // Lưu dữ liệu vào file JSON
  fs.writeFileSync("vocabulary_data.json", jsonData, "utf-8");
  console.log("Dữ liệu đã được lưu vào vocabulary_data.json");
}

// Chạy hàm lấy dữ liệu
getAllVocabularyData();
