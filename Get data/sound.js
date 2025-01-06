const fs = require("fs");

// Đọc file SQL gốc
const inputFilePath = "../sql/vocabulary_inserts.sql"; // Đổi thành đường dẫn file SQL của bạn
const outputFilePath = "../sql/vocabulary_inserts_with_audio.sql"; // File SQL mới sẽ được lưu

// Đọc nội dung file SQL gốc
fs.readFile(inputFilePath, "utf-8", (err, data) => {
  if (err) {
    console.error("Lỗi khi đọc file:", err);
    return;
  }

  // Tách các câu lệnh INSERT
  const insertStatements = data
    .split(";")
    .map((statement) => statement.trim())
    .filter((statement) => statement.length > 0);

  // Khởi tạo số thứ tự bắt đầu từ 0001, đến 0178 rồi nhảy lên 0182 và tăng dần
  let currentNumber = 1;
  let skippedNumbers = [178, 182]; // Các số cần nhảy

  const updatedInsertStatements = insertStatements.map((statement, index) => {
    let soundUrl;

    // Kiểm tra xem số thứ tự có phải là số cần nhảy không
    if (currentNumber === skippedNumbers[0]) {
      soundUrl = `/Sound/N3/${String(currentNumber).padStart(4, "0")}.mp3`;
      currentNumber = skippedNumbers[1]; // Nhảy tới số 0182
    } else if (currentNumber === skippedNumbers[1]) {
      soundUrl = `/Sound/N3/${String(currentNumber).padStart(4, "0")}.mp3`;
      currentNumber++; // Sau đó, tiếp tục từ 0183
    } else {
      soundUrl = `/Sound/N3/${String(currentNumber).padStart(4, "0")}.mp3`;
      currentNumber++; // Tiếp tục tăng dần từ 0183
    }

    // Thêm cột sound_url vào câu lệnh INSERT
    const statementParts = statement.split("VALUES");
    if (statementParts.length > 1) {
      return `${statementParts[0]}, sound_url) VALUES${statementParts[1].slice(
        0,
        -1
      )}, '${soundUrl}');`;
    }
    return statement; // Trả về câu lệnh nếu không có đúng cú pháp VALUES
  });

  // Ghi vào file SQL mới
  const updatedSQL = updatedInsertStatements.join(";\n") + ";";
  fs.writeFileSync(outputFilePath, updatedSQL, "utf-8");
  console.log("File SQL đã được tạo:", outputFilePath);
});
