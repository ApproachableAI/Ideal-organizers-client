// fb-config.js — feedback system configuration, loaded by the Blueprint page
// and by /admin/feedback/.
//
// Fill both values from Supabase → Project Settings → API, then redeploy.
// The anon (public) key is SAFE to publish by design: what protects the data
// is Row Level Security, defined in supabase/schema.sql. Reviewers can only
// insert comments; only the authenticated admin user can read or update them.
// NEVER put the service_role key in this file or anywhere client-side.
//
// While these placeholders are unchanged, the feedback button stays hidden
// and the admin page shows setup instructions instead of a login.
window.FEEDBACK_CONFIG = {
  url: 'YOUR_SUPABASE_PROJECT_URL',   // e.g. https://abcdefghijkl.supabase.co
  anonKey: 'YOUR_SUPABASE_ANON_KEY'
};
