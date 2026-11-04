-- Ali-Fathi shared data. Run this once in Supabase: SQL Editor > New query > paste > Run.
create table if not exists public.kv (
  key        text primary key,
  value      jsonb not null,
  updated_at timestamptz not null default now()
);

create or replace function public.kv_touch() returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end $$;

drop trigger if exists kv_touch on public.kv;
create trigger kv_touch before insert or update on public.kv
  for each row execute function public.kv_touch();

alter table public.kv enable row level security;

drop policy if exists "bizou read"   on public.kv;
drop policy if exists "bizou insert" on public.kv;
drop policy if exists "bizou update" on public.kv;
create policy "bizou read"   on public.kv for select to anon using (true);
create policy "bizou insert" on public.kv for insert to anon with check (true);
create policy "bizou update" on public.kv for update to anon using (true) with check (true);

-- Demo-level security: anyone who has your site's anon key can read and change this table.
-- That is fine for a class project. For real customers, move to Supabase Auth with one table
-- per kind of data and per-user row rules.
