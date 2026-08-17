// fb-config.js — feedback system configuration, loaded by the Blueprint page
// and by /admin/feedback/.
//
// The anon (public) key below is SAFE to publish by design: what protects
// the data is Row Level Security, defined in supabase/schema.sql. Reviewers
// can only insert comments; only the four admin logins can read or update.
// NEVER put the service_role key in this file or anywhere client-side.
window.FEEDBACK_CONFIG = {
  url: 'https://fejlgzrcxkmcmgmzoaoz.supabase.co',
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZlamxnenJjeGttY21nbXpvYW96Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODY5ODA2MDQsImV4cCI6MjEwMjU1NjYwNH0.ovQ4WiFtn-Fu5iWEZTyEbgYYVcOltQ5cY2bo-MdoV0E'
};
