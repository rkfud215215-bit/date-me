-- 이미 setup.sql을 실행한 프로젝트에 music_playlist_url 컬럼만 추가할 때 사용
-- Supabase 대시보드 > SQL Editor 에 붙여넣고 Run

alter table profile_taste add column if not exists music_playlist_url text;
