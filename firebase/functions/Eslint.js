
import { ESLint } from "eslint";

export default new ESLint({
  baseConfig: {
    extends: ["eslint:recommended"],
    env: {
      node: true,
      es6: true,
    },
    parserOptions: {
      ecmaVersion: 2020,
    },
  },
});
