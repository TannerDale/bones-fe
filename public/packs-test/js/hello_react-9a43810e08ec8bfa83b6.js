/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs-test/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/hello_react.jsx");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/hello_react.jsx":
/*!**********************************************!*\
  !*** ./app/javascript/packs/hello_react.jsx ***!
  \**********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /Users/tannerdale/turing/3mod/projects/bonez/bones-fe/app/javascript/packs/hello_react.jsx: Support for the experimental syntax 'jsx' isn't currently enabled (10:3):\n\n   8 |\n   9 | const Hello = props => (\n> 10 |   <div>Hello {props.name}!</div>\n     |   ^\n  11 | )\n  12 |\n  13 | Hello.defaultProps = {\n\nAdd @babel/preset-react (https://git.io/JfeDR) to the 'presets' section of your Babel config to enable transformation.\nIf you want to leave it as-is, add @babel/plugin-syntax-jsx (https://git.io/vb4yA) to the 'plugins' section to enable parsing.\n    at Parser._raise (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:541:17)\n    at Parser.raiseWithData (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:534:17)\n    at Parser.expectOnePlugin (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:3575:18)\n    at Parser.parseExprAtom (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11937:20)\n    at Parser.parseExprSubscripts (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11541:23)\n    at Parser.parseUpdate (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11521:21)\n    at Parser.parseMaybeUnary (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11496:23)\n    at Parser.parseMaybeUnaryOrPrivate (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11310:61)\n    at Parser.parseExprOps (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11317:23)\n    at Parser.parseMaybeConditional (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11287:23)\n    at Parser.parseMaybeAssign (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11250:21)\n    at /Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11208:39\n    at Parser.allowInAnd (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:13074:12)\n    at Parser.parseMaybeAssignAllowIn (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11208:17)\n    at Parser.parseParenAndDistinguishExpression (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:12262:28)\n    at Parser.parseExprAtom (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11848:23)\n    at Parser.parseExprSubscripts (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11541:23)\n    at Parser.parseUpdate (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11521:21)\n    at Parser.parseMaybeUnary (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11496:23)\n    at Parser.parseMaybeUnaryOrPrivate (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11310:61)\n    at Parser.parseExprOps (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11317:23)\n    at Parser.parseMaybeConditional (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11287:23)\n    at Parser.parseMaybeAssign (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11250:21)\n    at Parser.parseFunctionBody (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:12721:24)\n    at Parser.parseArrowExpression (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:12700:10)\n    at Parser.parseExprAtom (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11975:25)\n    at Parser.parseExprSubscripts (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11541:23)\n    at Parser.parseUpdate (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11521:21)\n    at Parser.parseMaybeUnary (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11496:23)\n    at Parser.parseMaybeUnaryOrPrivate (/Users/tannerdale/turing/3mod/projects/bonez/bones-fe/node_modules/@babel/parser/lib/index.js:11310:61)");

/***/ })

/******/ });
//# sourceMappingURL=hello_react-9a43810e08ec8bfa83b6.js.map