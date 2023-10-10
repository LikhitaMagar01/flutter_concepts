import { Button } from "@/components/ui/button"
import Link from "next/link"
export default function Home() {
  return (
    <h1 className="container">hello Guys
      <Button asChild>
      <Link href="/sign-up">Sign UP</Link>
    </Button>
    </h1>
  )
}
