-- Feedback system schema for the Ideal Blueprint site.
-- Run this once in Supabase → SQL Editor after creating the project.
--
-- Security model:
--   * The browser widget uses the PUBLIC anon key. Anon may INSERT only,
--     with length limits, and can never SELECT — reviewers cannot read
--     each other's comments.
--   * The admin page signs in through Supabase Auth. Only the admin
--     email(s) listed in the policies below may SELECT or UPDATE.
--   * The service_role key is never used by any page.
--
-- After running this, also do BOTH of these in the dashboard:
--   1. Authentication → Sign In / Up → disable "Allow new users to sign up".
--   2. Authentication → Users → Add user → create a login for EACH admin
--      email listed in the policies below (ty@, info@, sean@, jordyn@).
--      The policy grants access to the email; the account has to exist too.

create table if not exists public.feedback_comments (
  id            uuid primary key default gen_random_uuid(),
  created_at    timestamptz not null default now(),
  page          text not null,
  element_id    text not null,
  element_label text,
  excerpt       text,
  reviewer      text not null,
  comment       text not null,
  resolved      boolean not null default false,
  resolved_at   timestamptz
);

alter table public.feedback_comments enable row level security;

drop policy if exists "reviewers may submit" on public.feedback_comments;
drop policy if exists "admins may read"      on public.feedback_comments;
drop policy if exists "admins may update"    on public.feedback_comments;

-- Reviewers (anon key): insert only, bounded sizes, nothing readable back.
create policy "reviewers may submit"
  on public.feedback_comments
  for insert
  to anon
  with check (
    char_length(comment)  between 1 and 1500
    and char_length(reviewer) between 1 and 80
    and char_length(page) <= 200
    and char_length(element_id) <= 120
    and (element_label is null or char_length(element_label) <= 200)
    and (excerpt is null or char_length(excerpt) <= 300)
    and resolved = false
  );

-- Admins (authenticated through Supabase Auth): read and update.
create policy "admins may read"
  on public.feedback_comments
  for select
  to authenticated
  using (
    (auth.jwt() ->> 'email') in (
      'ty@approachableintelligence.ai',
      'info@approachableintelligence.ai',
      'sean@approachableintelligence.ai',
      'jordyn@approachableintelligence.ai'
    )
  );

create policy "admins may update"
  on public.feedback_comments
  for update
  to authenticated
  using (
    (auth.jwt() ->> 'email') in (
      'ty@approachableintelligence.ai',
      'info@approachableintelligence.ai',
      'sean@approachableintelligence.ai',
      'jordyn@approachableintelligence.ai'
    )
  )
  with check (true);

-- No delete policy on purpose: nobody deletes feedback from the pages.
-- Delete from the Supabase dashboard if ever genuinely needed.
