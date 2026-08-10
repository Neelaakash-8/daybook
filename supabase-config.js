// Public Supabase config for Daybook.
//
// SAFE TO COMMIT: the URL and "anon" key below are meant to be public —
// every Supabase frontend ships them in the browser bundle. They only let
// a client talk to your project's API; what a signed-in user can actually
// read/write is enforced by the Row Level Security policies on the
// database side (see supabase-schema.sql), not by keeping this key secret.
//
// NEVER put your "service_role" key or your database password here, in
// any other file in this repo, or anywhere that ends up in the browser.
// The service_role key bypasses Row Level Security entirely — treat it
// like a master admin password and keep it out of any public repo.

export const SUPABASE_URL = 'https://YOUR-PROJECT-REF.supabase.co';
export const SUPABASE_ANON_KEY = 'YOUR-ANON-PUBLIC-KEY';
