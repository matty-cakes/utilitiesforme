import { defineConfig } from "vite"
import react from "@vitejs/plugin-react"

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  build: {
    rollupOptions: {
      output: {
        entryFileNames: "bundle.js",
        assetFileNames: (_file) => {
          if (_file.name === "index.css") {
            return "styles/[name][extname]"
          }
          return "assets/[name]-[hash][extname]"
        },
      },
    },
  },
})
