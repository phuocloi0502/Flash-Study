const axios = require("axios");
const cheerio = require("cheerio");
const fs = require("fs");

// Tạo danh sách các đường dẫn
const links = [];
for (let chapter = 1; chapter <= 7; chapter++) {
  const sectionCount = chapter === 7 ? 6 : 5; // Chapter 7 có 6 sessions, các chapter khác có 5
  for (let section = 1; section <= sectionCount; section++) {
    const url = `https://jtest.net/tu-vung-n4/chapter-${chapter}/section-${section}`;
    links.push(url);
  }
}

// Biến đếm lesson_id bắt đầu từ 61
let lessonIdCounter = 61;

// Hàm lấy dữ liệu từ một trang
async function fetchVocabularyData(url) {
  try {
    // Gửi request GET đến trang
    const { data } = await axios.get(url);
    const $ = cheerio.load(data);

    // Biến lưu trữ các câu lệnh SQL INSERT
    let sqlCommands = [];

    // Lấy dữ liệu từ bảng từ vựng
    $("table tr").each((index, row) => {
      const cells = $(row).find("td");
      const headerCells = $(row).find("th"); // Lấy thẻ <th> chứa button

      if (cells.length > 0) {
        // Lấy Kanji từ thẻ <h5><small id="wordX" class="text-danger">Kanji</small></h5>
        const kanji =
          $(cells[0]).find("h5 small").first().text().trim() ||
          "Không có Kanji";

        // Lấy Furigana từ thẻ <small id="furiganaX">furigana</small>
        const furigana =
          $(cells[0]).find("small").last().text().trim() || "Không có Furigana";

        // Lấy Meaning từ thẻ <span id="meaningX">meaning</span>
        const meaning =
          $(cells[0]).find("span").text().trim() || "Không có nghĩa";

        // Lấy Example và Example Meaning từ thẻ <p> và <span> trong cells[1]
        const example = $(cells[1]).find("p").text().trim() || "Không có ví dụ";
        const exampleMeaning =
          $(cells[1]).find("span").text().trim() || "Không có nghĩa ví dụ";

        // Lấy sound_url từ value trong button nằm trong <th> (thẻ header)
        const sound_url = $(headerCells).find("button").attr("value");
        const soundFile = sound_url
          ? `/Sound/N4/${sound_url.split("/").pop()}`
          : "Không có sound_url";

        // Tạo câu lệnh INSERT INTO cho từng từ vựng
        const sqlCommand = `INSERT INTO vocabulary (kanji, furigana, meaning, example, example_meaning, lesson_id, sound_url) 
        VALUES ('${kanji}', '${furigana}', '${meaning}', '${example}', '${exampleMeaning}', ${lessonIdCounter}, '${soundFile}');`;

        // Thêm câu lệnh vào mảng sqlCommands
        sqlCommands.push(sqlCommand);
      }
    });

    // Tăng lessonIdCounter sau khi xử lý xong 1 trang
    lessonIdCounter++;

    return sqlCommands;
  } catch (error) {
    console.error(`Lỗi khi lấy dữ liệu từ ${url}:`, error.message);
  }
}

// Hàm để chạy và lấy dữ liệu từ tất cả các link
async function getAllVocabularyData() {
  let allSqlCommands = [];
  for (let link of links) {
    const sqlCommands = await fetchVocabularyData(link);
    allSqlCommands = allSqlCommands.concat(sqlCommands);
  }

  // Lưu các câu lệnh SQL vào file
  fs.writeFileSync(
    "vocabulary_data_n4.sql",
    allSqlCommands.join("\n"),
    "utf-8"
  );
  console.log("Dữ liệu đã được lưu vào vocabulary_data_n4.sql");
}

// Chạy hàm lấy dữ liệu
getAllVocabularyData();
