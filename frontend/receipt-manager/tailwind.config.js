/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./projects/receipt-manager/src/**/*.{html,ts}",
    "./projects/common-lib/src/**/*.{html,ts}"
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        light: {
          bg: '#ffffff',
          text: '#000000',
        },
        dark: {
          bg: '#1a202c',
          text: '#ffffff',
        },
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
  ],
}

