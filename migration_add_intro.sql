-- 자기소개(intro) 컬럼 추가. 새 쿼리 탭 열고 이 줄만 단독으로 실행할 것.
-- Supabase 대시보드 > SQL Editor 에 붙여넣고 Run

alter table profile_taste add column if not exists intro text;
