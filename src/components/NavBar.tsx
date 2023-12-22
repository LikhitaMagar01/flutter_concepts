"use client";
import { BiSolidBox } from "react-icons/bi";
import { PiHamburgerLight } from "react-icons/pi";
import { AiOutlineArrowDown } from "react-icons/ai";
import Link from "next/link";
import { useState } from "react";
import Drawer from "./Drawer";

const NavBar = () => {
  const [isOpen, setIsOpen] = useState(false);
  function toggle() {
    setIsOpen((isOpen) => !isOpen);
  }
  return (
    <nav className="md:flex block justify-between md:justify-around p-5">
      <div className="flex gap-x-6 justify-between">
        <div>SiLai</div>
        <div className="flex gap-x-2">
          <PiHamburgerLight
            size={25}
            onClick={toggle}
            className="cursor-pointer flex"
          />
          <div className="md:block hidden">Categories</div>
        </div>
      </div>

      {isOpen && (
        <Drawer isOpen={isOpen} onClose={toggle}>
          <div className="flex flex-col gap-4 p-2">
            Category one Category two
          </div>
        </Drawer>
      )}
      <div className="gap-x-8 hidden md:flex">search field</div>
      <div className="gap-x-4 hidden md:flex">
        <Link href="/sign-in" className="cursor-pointer">
          Sign In
        </Link>
        <BiSolidBox size={25} href={"/"} className="cursor-pointer" />
        <AiOutlineArrowDown size={25} href={"/"} className="cursor-pointer" />
      </div>
    </nav>
  );
};

export default NavBar;
