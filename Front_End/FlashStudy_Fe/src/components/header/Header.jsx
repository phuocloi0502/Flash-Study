import React from "react";
import "./header.scss";
import logoWeb from "../../assets/logo_web.png";
import { FaHome } from "react-icons/fa";
import { FaUser } from "react-icons/fa";
export const Header = (props) => {
  return (
    <div className="header-area">
      <div className="logo-web-area">
        <img src={logoWeb} alt="" />
        <div className="logo-text"> Flash Study</div>
      </div>
      <div className="main-menu">
        <div className="menu-item">
          <span>
            {" "}
            <FaHome />
          </span>
        </div>
        <div className="menu-item">Từ Vựng</div>
        <div className="menu-item">Ngữ Pháp</div>
        <div className="menu-item">Kanji</div>
        <div className="menu-item">Blog</div>
        <div className="menu-item">
          <FaUser />
        </div>
        <div className="menu-item sign-button">Sign up</div>
      </div>
    </div>
  );
};
