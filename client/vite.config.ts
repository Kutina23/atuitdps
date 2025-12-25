import { defineConfig, loadEnv } from 'vite';
import react from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig(({ mode }) => {
  // Load environment variables based on the current mode
  const env = loadEnv(mode, process.cwd(), '');
  
  // Determine the API URL based on the environment
  const apiUrl = env.VITE_API_URL || 'http://localhost:5000';
  const isProduction = mode === 'production';

  return {
    base: isProduction ? '/' : '/',
    plugins: [react(), tailwindcss()],
    server: {
      port: 3000,
      proxy: {
        '/api': {
          target: apiUrl,
          changeOrigin: true,
        },
        '/uploads': {
          target: apiUrl,
          changeOrigin: true,
        },
        '/default-avatar.svg': {
          target: apiUrl,
        changeOrigin: true,
      },
    },
  },
})