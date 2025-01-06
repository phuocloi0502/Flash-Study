USE FlashStudy;
SELECT l.name, c.chapter_number,c.chapter_name, ls.lesson_number,ls.lesson_name
FROM level l
JOIN chapter c ON l.id = c.level_id
JOIN lesson ls ON ls.chapter_id = c.id
WHERE l.name = "N5";

SELECT v.id, l.name, c.chapter_number,c.chapter_name, ls.lesson_number,ls.lesson_name, v.kanji, v.furigana, v.meaning, v.example, v.example_meaning, v.sound_url
FROM vocabulary v, level l ,chapter c, lesson ls
WHERE 
l.id = c.level_id 
and c.id = ls.chapter_id
and ls.id = v.lesson_id
and lesson_id = 62;