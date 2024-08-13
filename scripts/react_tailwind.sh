#!/bin/bash

/bin/npm create vite@latest frontend -- --template react-ts

# Change to project directory
cd frontend

# Install dependencies
npm install

# Install Tailwind CSS and its dependencies
npm install -D tailwindcss postcss autoprefixer
npm install react-router-dom
# Initialize Tailwind CSS
npx tailwindcss init -p

# Update tailwind.config.js
cat >tailwind.config.js <<EOL
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOL

# Update src/index.css
cat >src/index.css <<EOL
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL

# Update src/App.tsx with a basic Tailwind CSS example
cat >src/App.tsx <<EOL
import React from 'react'

function App() {
  return (
    <div className="min-h-screen bg-gray-100 flex items-center justify-center">
      <h1 className="text-4xl font-bold text-blue-600">
        Vite + React + TypeScript + Tailwind CSS
      </h1>
    </div>
  )
}

export default App
EOL

echo "Project setup complete. To start your development server, run:"
echo "cd $PROJECT_NAME && npm run dev"
