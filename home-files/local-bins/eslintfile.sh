#!/bin/sh

npm init -y
npx install-peerdeps --dev eslint-config-wesbos
npm i -D eslint-plugin-unused-imports
echo '{
    "extends": ["wesbos"],
    "plugins": ["unused-imports"],
    "rules": {
        "no-unused-vars": "off",
        "unused-imports/no-unused-imports": "error",
        "unused-imports/no-unused-vars": [
            "warn",
            {
                "vars": "all",
                "varsIgnorePattern": "^_",
                "args": "after-used",
                "argsIgnorePattern": "^_"
            }
        ],
          "sort-imports": [
      "error",
      {
        "ignoreDeclarationSort": true
      }
  ],
        "prefer-const": 0,
        "react/prop-types": 0,
        "react/destructuring-assignment": 0,
        "react-hooks/rules-of-hooks": 0,
        "react/jsx-no-bind": [
            0,
            {
                "ignoreDOMComponents": true,
                "ignoreRefs": true,
                "allowArrowFunctions": true,
                "allowFunctions": true,
                "allowBind": true
            }
        ],
        "no-unused-expressions": "off",
        "react/jsx-boolean-value": 0
    },
    "overrides": [
        {
            "files": ["**/*.ts?(x)"],
            "parser": "@typescript-eslint/parser",
            "parserOptions": {
                "ecmaFeatures": {
                    "jsx": true
                },
                "ecmaVersion": 2018,
                "sourceType": "module"
            },
            "rules": { "@typescript-eslint/no-unused-vars": "off" }
        }
    ]
}

' >.eslintrc
echo "js
package-lock.json
node_modules
/build" >.prettierignore
echo '{
    "semi": true,
    "trailingComma": "all",
    "singleQuote": true,
    "printWidth": 100,
    "tabWidth": 4,
    "bracketSpacing": true,
    "bracketSameLine": false,
    "arrowParens": "avoid",
    "embeddedLanguageFormatting": "auto",
    "endOfLine": "lf"
}
' >.prettierrc
