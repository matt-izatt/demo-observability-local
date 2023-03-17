import { serve } from "https://deno.land/std@0.137.0/http/server.ts";


console.log("Info:    1");
console.log("Info:    2");
console.log("Info:    3");
console.log("Info:    4");
console.error(new Error("Test error"));

serve(handler, { port: 3001 });

async function handler(req: Request): Promise<Response> {
  console.log("Method:", req.method);

  const url = new URL(req.url);
  console.log("Path:", url.pathname);

  if (req.body) {
    const body = await req.text();
    console.log("Body:", body);
  }

  const res = await fetch("http://service-2:3002");

  console.log(await res.text());

  return new Response("Hello from service 1!");
}
