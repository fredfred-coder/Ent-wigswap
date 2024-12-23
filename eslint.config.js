import { FlatESLint } from "@eslint/eslintrc";

export default new FlatESLint({
  files: ["**/*.js"],
  languageOptions: {
    sourceType: "module",
  },
  rules: {
    "no-console": "off", // Permet d'utiliser console.log pour les logs Firebase
  },
});

