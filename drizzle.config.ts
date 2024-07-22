import { defineConfig } from "drizzle-kit";

import dotenv from "dotenv";
dotenv.config({
  path: ".env.local",
});
export default defineConfig({
  dialect: "postgresql",
  schema: "./app/_lib/schema.ts",
  dbCredentials: {
    url: process.env.DATABASE_URL!,
  },
  out: "./app/_lib/drizzle",
});
