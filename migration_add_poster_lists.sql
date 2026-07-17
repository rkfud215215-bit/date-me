-- 영화/시리즈를 검색+포스터로 추가하는 기능용 컬럼 추가. 새 쿼리 탭 열고 단독 실행할 것
-- (기존 movie/series 텍스트 컬럼은 더 이상 안 쓰지만 그냥 둬도 무해함)
-- Supabase 대시보드 > SQL Editor 에 붙여넣고 Run

alter table profile_taste add column if not exists movie_list jsonb default '[]'::jsonb;
alter table profile_taste add column if not exists series_list jsonb default '[]'::jsonb;
