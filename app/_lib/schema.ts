import {
  uuid,
  text,
  integer,
  decimal,
  boolean,
  timestamp,
  pgTable,
} from "drizzle-orm/pg-core";

export const product = pgTable("product", {
  id: uuid("id").primaryKey(),
  name: text("name"),
  desc: text("desc"),
  SKU: text("SKU"),
  categoryId: uuid("category_id")
    .references(() => productCategory.id)
    .notNull(),
  inventoryId: uuid("inventoryId")
    .references(() => productInventory.id)
    .notNull(),
  thumbnailImage: text("thumbnail_image"),
  images: text("images").array(),
  price: decimal("price"),
  discountId: uuid("discount_id").references(() => discount.id),
  createdAt: timestamp("created_at"),
  updatedAt: timestamp("updated_at"),
});

export const productCategory = pgTable("product_category", {
  id: uuid("id").primaryKey(),
  name: text("name"),
  desc: text("desc"),
  createdAt: timestamp("created_at"),
  updatedAt: timestamp("updated_at"),
});

export const productInventory = pgTable("product_inventory", {
  id: uuid("id").primaryKey(),
  quantity: integer("quantity"),
  createdAt: timestamp("created_at"),
  updatedAt: timestamp("updated_at"),
});

export const discount = pgTable("discount", {
  id: uuid("id").primaryKey(),
  name: text("name"),
  desc: text("desc"),
  discountPercent: decimal("discount_percent"),
  active: boolean("active"),
  createdAt: timestamp("created_at"),
  updatedAt: timestamp("updated_at"),
});
