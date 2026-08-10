-- Run this whole file once in Supabase → SQL Editor → New query → Run.

-- 1. Table
create table if not exists public.events (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  date date not null,
  time text,                 -- "HH:MM" 24h, nullable for all-day events
  location text,
  description text,
  notes text,
  created_at timestamptz not null default now()
);

create index if not exists events_user_id_idx on public.events (user_id);
create index if not exists events_user_date_idx on public.events (user_id, date);

-- 2. Row Level Security — must be enabled, and every operation needs its
--    own policy. Without this, ANY authenticated user could read/write
--    every row in the table (RLS defaults to deny-all once enabled, so
--    forgetting a policy just breaks that operation rather than opening it up).
alter table public.events enable row level security;

create policy "Users can view their own events"
  on public.events for select
  using (auth.uid() = user_id);

create policy "Users can insert their own events"
  on public.events for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own events"
  on public.events for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "Users can delete their own events"
  on public.events for delete
  using (auth.uid() = user_id);

-- 3. Realtime — required so a change on one device shows up live on
--    another device without a manual refresh.
alter publication supabase_realtime add table public.events;
