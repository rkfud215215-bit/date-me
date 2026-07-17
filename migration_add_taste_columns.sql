-- profile_taste에 아직 없는 컬럼들을 추가. 새 쿼리 탭 열고 이 파일 내용만 단독으로 실행할 것
-- (이미 있는 컬럼은 "if not exists" 덕분에 에러 없이 그냥 건너뜀)
-- Supabase 대시보드 > SQL Editor 에 붙여넣고 Run

alter table profile_taste add column if not exists intro text;
alter table profile_taste add column if not exists series text;
alter table profile_taste add column if not exists music_playlist_url text;
