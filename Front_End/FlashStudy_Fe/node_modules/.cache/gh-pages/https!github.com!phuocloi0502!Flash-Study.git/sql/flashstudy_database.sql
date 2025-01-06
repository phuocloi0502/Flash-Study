DROP DATABASE IF EXISTS FlashStudy;
CREATE DATABASE FlashStudy;
USE FlashStudy;
CREATE TABLE level (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(10) NOT NULL UNIQUE 
);
CREATE TABLE chapter (
    id INT AUTO_INCREMENT PRIMARY KEY,
    chapter_number INT NOT NULL ,
    chapter_name VARCHAR(255) NOT NULL,
    level_id INT NOT NULL ,
    FOREIGN KEY (level_id) REFERENCES level(id) ON DELETE CASCADE
);
CREATE TABLE lesson (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lesson_number INT NOT NULL,
    lesson_name VARCHAR(255) NOT NULL,
    chapter_id INT NOT NULL ,
    FOREIGN KEY (chapter_id) REFERENCES chapter(id) ON DELETE CASCADE
);

CREATE TABLE vocabulary (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kanji VARCHAR(255) ,
    furigana VARCHAR(255) ,
    meaning TEXT ,
    example TEXT ,
    example_meaning TEXT ,
    lesson_id INT NOT NULL ,
     sound_url VARCHAR(255) ,
    FOREIGN KEY (lesson_id) REFERENCES lesson(id) ON DELETE CASCADE
);

CREATE TABLE `user` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL UNIQUE, 
    `password` VARCHAR(255) NOT NULL,  
    rules ENUM('ADMIN','USER') DEFAULT 'USER'
);
CREATE TABLE user_vocab_status (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    vocab_id INT NOT NULL,
    `status` TINYINT(1) NOT NULL DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES `user`(id),
    FOREIGN KEY (vocab_id) REFERENCES vocabulary(id)
);

INSERT INTO level (name) VALUES ( "N1");
INSERT INTO level (name) VALUES ( "N2");
INSERT INTO level (name) VALUES ( "N3");
INSERT INTO level (name) VALUES ( "N4");
INSERT INTO level (name) VALUES ( "N5");

INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("1","Quan hệ giữa người với người",3);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("2","Cuộc sống hàng ngày 1",3);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("3","Cuộc sống hàng ngày 2",3);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("4","Thành phố của chúng tôi",3);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("5","Học nào",3);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("6","Công việc",3);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("7","Những điều vui",3);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("8","Vì sức khỏe",3);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("9","Tự nhiên và cuộc sống",3);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("10","Hãy học trên bản tin thời sự !",3);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("11","Hãy truyền đạt cảm xúc của mình",3);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("12","Hãy truyền đạt ấn tượng của mình",3);

INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("1","Mỗi ngày của chúng tôi",4);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("2","Việc học và công việc",4);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("3","Những việc vui vẻ",4);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("4","Hãy đi ra ngoài nào",4);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("5","Mối quan hệ giữa người với người",4);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("6","Sức khỏe và trạng thái",4);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("7","Khi nào? Tại đâu?",4);

INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("1","Tự giới thiệu",5);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("2","Học tập",5);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("3","Công việc",5);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("4","Bạn bè",5);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("5","Cơm hôm nay",5);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("6","Sở thích",5);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("7","Mua sắm",5);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("8","Ngày nghỉ",5);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("9","Sống",5);
INSERT INTO chapter (chapter_number,chapter_name,level_id) VALUES ("10","Sức khỏe",5);



-- N3
-- chapter 1
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Gia đình",1);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Bạn bè và người quen",1);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Người yêu",1);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Giao tiếp",1);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Là người như thế nào?",1);

-- chapter 2
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Cách nói về thời gian",2);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Đời sống ẩm thực",2);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Dụng cụ và nguyên liệu nấu ăn",2);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Cách làm món ăn",2);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Việc nhà",2);

-- chapter 3
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Nhà",3);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Tiền và ngân hàng",3);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Mua sắm",3);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Từ sáng đến tối",3);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Cả những việc như thế này",3);


-- chapter 4
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Quanh cảnh thành phố",4);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Đi bộ trong thành phố",4);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Tàu điện và tàu Shin kansen",4);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Xe buýt",4);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Lái xe",4);

-- chapter 5
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Trường học",5);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Học tập",5);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Trường đại học của Nhật Bản",5);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Thi cử",5);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Hãy cố gắng hơn nữa",5);

-- chapter 6
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Việc làm",6);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Công ty",6);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Quan hệ trên dưới",6);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Là công việc như thế nào?",6);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Bằng máy vi tính",6);

-- chapter 7
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Du lịch",7);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Thế thao",7);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Thời trang",7);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Ăn diện",7);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Sở thích",7);

-- chapter 8
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Cơ thể",8);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Có dấu hiệu gì?",8);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Triệu chứng",8);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Không sao chứ?",8);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Bệnh viện",8);

-- chapter 9
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Tự nhiên",9);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Thời tiết ngày mai",9);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Ngày nóng và ngày lạnh",9);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Thay đổi như thế nào?",9);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Một năm của Nhật Bản",9);

-- chapter 10
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Truyền thông đại chúng",10);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Vụ việc",10);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Hãy chú ý!",10);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Rắc rối",10);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Dữ liệu",10);

-- chapter 11
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Tính cách",11);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Tâm trạng vui mừng",11);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Tâm trạng buồn chán",11);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Có cảm giác gì?",11);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Tâm trạng phức tạp",11);

-- chapter 12
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Thiết kế",12);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Ấn tượng về con người",12);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Ấn tượng về vật",12);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Xã hội của chúng ta",12);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Xã hội quốc tế",12);


-- N4
-- chapter 1
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Thời gian",13);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Gia đình",13);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Nhà",13);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Phòng",13);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Từ sáng đến tối",13);

-- chapter 2
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Trường học",14);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Trường đại học",14);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Việc học",14);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Công việc 1",14);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Công việc 2",14);

-- chapter 3
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Du lịch",15);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Món ăn - Ăn",15);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Món ăn - Nấu",15);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Đi chợ, mua sắm",15);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Nơi, chỗ",15);

-- chapter 4
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Thời tiết",16);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Tự nhiên",16);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Phương tiện giao thông",16);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Lái xe (xe,tàu)",16);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Thế giới",16);

-- chapter 5
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Giao tiếp",17);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Người yêu",17);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Những rắc rối",17);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Sở thích",17);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Thể thao",17);

-- chapter 6
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Cơ thể / Sức khỏe",18);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Đau ốm / Bị thương",18);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Thời trang",18);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Trạng thái, tình trạng 1",18);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Trang thái, tình trạng 2",18);

-- chapter 7
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Tin tức",19);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Lời hứa",19);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Cảm giác",19);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Hãy ghi nhớ cả phó từ 1",19);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Hãy ghi nhớ cả phó từ 2",19);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (6,"Hãy ghi nhớ cả phó từ 3",19);

-- N5
-- chapter 1
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Là",20);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Xin chào",20);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Gia đình",20);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Bao nhiêu người",20);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Đến từ",20);

-- chapter 2
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Trường học",21);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Số đếm",21);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Thứ (trong tuần)",21);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Từ ngữ",21);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Học tập",21);

-- chapter 3
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Làm việc, lao động",22);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Công việc",22);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Đây là cái gì?",22);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Có bao nhiêu cái?",22);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Thời gian",22);

-- chapter 4
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Người như thế nào?",23);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Mặc áo",23);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Mặc váy",23);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Chơi",23);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Phố xá, thị trấn",23);

-- chapter 5
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Sáng, tối",24);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Ăn, uống",24);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Món ăn",24);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Nhà hàng",24);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Như thế nào?",24);

-- chapter 6
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Sở thích",25);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Âm nhạc",25);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Thể thao",25);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Thời tiết",25);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Mùa",25);

-- chapter 7
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Mua sắm",26);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Cửa hàng, cửa tiệm",26);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Máy rút tiền tự động",26);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Gửi",26);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Quà tặng",26);

-- chapter 8
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Phương tiện giao thông",27);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Khoảng bao lâu?",27);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Đường đi",27);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Ở đâu",27);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Ra ngoài",27);

-- chapter 9
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Nhà",28);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"Tầng 2 chung cư",28);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Chuyển nhà",28);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Nhà của giáo viên",28);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Điện",28);

-- chapter 10
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (1,"Bệnh",29);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (2,"(Bạn) Khỏe không?",29);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (3,"Vật - việc quan trọng",29);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (4,"Tương lai",29);
INSERT INTO lesson (lesson_number,lesson_name,chapter_id) VALUES (5,"Hãy nhớ cả những từ này!",29);



