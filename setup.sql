-- 소개팅 예약 웹사이트용 테이블 (도쿄 플래너와 같은 Supabase 프로젝트에 추가)
-- Supabase 대시보드 > SQL Editor 에 전체 붙여넣고 Run

create table reservations (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  date date not null,
  menu text not null,
  created_at timestamptz default now()
);

create table blocked_dates (
  date date primary key
);

create table profile_taste (
  id int primary key default 1,
  intro text,
  movie text,
  series text,
  music text,
  photo_url text,
  music_playlist_url text
);
insert into profile_taste (id, intro, movie, series, music, photo_url, music_playlist_url)
values (1, '', '', '', '', null, null);

-- RLS 활성화 + anon(비로그인 브라우저)에게 전체 권한 허용
-- (이 앱은 백엔드 서버가 없어서, 관리자 비밀번호는 화면단 잠금일 뿐 실제 쓰기 권한은
--  anon 키를 아는 누구나 가능함. 지인 공유용이라 이 정도로 충분하다는 전제.)

alter table reservations enable row level security;
create policy "anon full access" on reservations for all using (true) with check (true);

alter table blocked_dates enable row level security;
create policy "anon full access" on blocked_dates for all using (true) with check (true);

alter table profile_taste enable row level security;
create policy "anon full access" on profile_taste for all using (true) with check (true);

-- 프로필 사진용 Storage 버킷 생성 + 정책 (대시보드에서 따로 안 만들어도 됨)
insert into storage.buckets (id, name, public)
values ('profile-photos', 'profile-photos', true)
on conflict (id) do nothing;

create policy "anon upload profile photos"
on storage.objects for insert
to anon
with check (bucket_id = 'profile-photos');

create policy "anon update profile photos"
on storage.objects for update
to anon
using (bucket_id = 'profile-photos');

create policy "public read profile photos"
on storage.objects for select
to anon
using (bucket_id = 'profile-photos');
