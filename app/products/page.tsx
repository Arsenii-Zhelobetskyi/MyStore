import { db } from "@/app/_lib/db";
import { product } from "@/app/_lib/schema";

export default async function page() {
  const result = await db.select().from(product);
  console.log(result, "result");
  return <div>page</div>;
}
