import { serve } from "https://deno.land/std@0.137.0/http/server.ts";

serve(handler, { port: 3002 });

async function handler(req: Request): Promise<Response> {
    console.log("Method:", req.method);
  
    const url = new URL(req.url);
    console.log("Path:", url.pathname);

    if (req.body) {
      const body = await req.text();
      console.log("Body:", body);
    }
  
    return new Response("Hello from service 2!");
  }