const fs = require("fs");

// Đọc dữ liệu từ file JSON
const vocabularyData = JSON.parse(
  fs.readFileSync("vocabulary_data.json", "utf-8")
);

// Hàm tạo câu lệnh INSERT SQL
function generateInsertSQL(data) {
  return data
    .map((entry) => {
      return `INSERT INTO vocabulary (kanji, furigana, meaning, example, example_meaning, chapter, lessons, level, sound_url) 
    VALUES ('${entry.kanji.replace("'", "\\'")}', 
            '${entry.furigana.replace("'", "\\'")}', 
            '${entry.meaning.replace("'", "\\'")}', 
            '${entry.example.replace("'", "\\'")}', 
            '${entry.exampleMeaning.replace("'", "\\'")}', 
            '${entry.chapter}', 
            '${entry.lessons}', 
            '${entry.level}', 
            '/Sound/N4/${entry.sound_url}');`;
    })
    .join("\n");
}

// Tạo câu lệnh SQL từ dữ liệu JSON
const sqlStatements = generateInsertSQL(vocabularyData);

// Lưu các câu lệnh SQL vào file .sql
fs.writeFileSync("insert_vocabulary_N4.sql", sqlStatements, "utf-8");

console.log("Câu lệnh SQL đã được tạo và lưu vào insert_vocabulary.sql");
