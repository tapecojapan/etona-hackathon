/** @type {import('tailwindcss').Config} */
module.exports = {
  mode: 'jit',
  content: ["./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      fontFamily: {
        body: ["Noto Sans JP"],
      },
    },
  },
  plugins: [],
}
