import { defineConfig, loadEnv } from 'vite';
import react from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), '');
  const isProduction = mode === 'production';
  
  // For Vercel, we'll use relative URLs in production
  const base = isProduction ? '/' : '/';
  
  // API URL - will be replaced by Vercel's environment variables
  const apiUrl = env.VITE_API_URL || (isProduction ? '/api' : 'http://localhost:5000');

  return {
    plugins: [
      react(),
      tailwindcss()
    ],
    define: {
      'import.meta.env.VITE_API_URL': JSON.stringify(apiUrl)
    },
    base,
    server: {
      port: 3000,
      strictPort: true
    },
    preview: {
      port: 3000,
      strictPort: true
    }
  };
})