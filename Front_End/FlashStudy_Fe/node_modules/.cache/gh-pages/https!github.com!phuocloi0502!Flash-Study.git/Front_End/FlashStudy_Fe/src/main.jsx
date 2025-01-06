import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import "./styles/global.scss";
import App from "./App.jsx";
import "@fontsource/inter"; // Defaults to weight 400.
import "@fontsource/inter/500.css"; // Optional: weight 500.
import "@fontsource/inter/700.css"; // Optional: weight 700.

createRoot(document.getElementById("root")).render(
  <StrictMode>
    <App />
  </StrictMode>
);
