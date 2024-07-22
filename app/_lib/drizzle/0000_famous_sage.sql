CREATE TABLE IF NOT EXISTS "discount" (
	"id" uuid PRIMARY KEY NOT NULL,
	"name" text,
	"desc" text,
	"discount_percent" numeric,
	"active" boolean,
	"created_at" timestamp,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "product" (
	"id" uuid PRIMARY KEY NOT NULL,
	"name" text,
	"desc" text,
	"SKU" text,
	"category_id" uuid NOT NULL,
	"inventoryId" uuid NOT NULL,
	"price" numeric,
	"discount_id" uuid,
	"created_at" timestamp,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "product_category" (
	"id" uuid PRIMARY KEY NOT NULL,
	"name" text,
	"desc" text,
	"created_at" timestamp,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "product_inventory" (
	"id" uuid PRIMARY KEY NOT NULL,
	"quantity" integer,
	"created_at" timestamp,
	"updated_at" timestamp
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "product" ADD CONSTRAINT "product_category_id_product_category_id_fk" FOREIGN KEY ("category_id") REFERENCES "public"."product_category"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "product" ADD CONSTRAINT "product_inventoryId_product_inventory_id_fk" FOREIGN KEY ("inventoryId") REFERENCES "public"."product_inventory"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "product" ADD CONSTRAINT "product_discount_id_discount_id_fk" FOREIGN KEY ("discount_id") REFERENCES "public"."discount"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
