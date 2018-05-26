(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["main"],{

/***/ "./src/$$_lazy_route_resource lazy recursive":
/*!**********************************************************!*\
  !*** ./src/$$_lazy_route_resource lazy namespace object ***!
  \**********************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

function webpackEmptyAsyncContext(req) {
	// Here Promise.resolve().then() is used instead of new Promise() to prevent
	// uncaught exception popping up in devtools
	return Promise.resolve().then(function() {
		var e = new Error('Cannot find module "' + req + '".');
		e.code = 'MODULE_NOT_FOUND';
		throw e;
	});
}
webpackEmptyAsyncContext.keys = function() { return []; };
webpackEmptyAsyncContext.resolve = webpackEmptyAsyncContext;
module.exports = webpackEmptyAsyncContext;
webpackEmptyAsyncContext.id = "./src/$$_lazy_route_resource lazy recursive";

/***/ }),

/***/ "./src/app/app.component.html":
/*!************************************!*\
  !*** ./src/app/app.component.html ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<app-nav></app-nav>\r\n<div class=\"container\">\r\n  <router-outlet></router-outlet>\r\n</div>\r\n"

/***/ }),

/***/ "./src/app/app.component.scss":
/*!************************************!*\
  !*** ./src/app/app.component.scss ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/app.component.ts":
/*!**********************************!*\
  !*** ./src/app/app.component.ts ***!
  \**********************************/
/*! exports provided: AppComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppComponent", function() { return AppComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var AppComponent = /** @class */ (function () {
    function AppComponent() {
        this.title = 'app';
    }
    AppComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-root',
            template: __webpack_require__(/*! ./app.component.html */ "./src/app/app.component.html"),
            styles: [__webpack_require__(/*! ./app.component.scss */ "./src/app/app.component.scss")]
        }),
        __metadata("design:paramtypes", [])
    ], AppComponent);
    return AppComponent;
}());



/***/ }),

/***/ "./src/app/app.module.ts":
/*!*******************************!*\
  !*** ./src/app/app.module.ts ***!
  \*******************************/
/*! exports provided: AppModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppModule", function() { return AppModule; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_platform_browser__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/platform-browser */ "./node_modules/@angular/platform-browser/fesm5/platform-browser.js");
/* harmony import */ var _angular_platform_browser_animations__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/platform-browser/animations */ "./node_modules/@angular/platform-browser/fesm5/animations.js");
/* harmony import */ var ngx_electron__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ngx-electron */ "./node_modules/ngx-electron/index.js");
/* harmony import */ var _app_component__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./app.component */ "./src/app/app.component.ts");
/* harmony import */ var _modules_routing_module__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./modules/routing.module */ "./src/app/modules/routing.module.ts");
/* harmony import */ var _services_powershell_service__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ./services/powershell.service */ "./src/app/services/powershell.service.ts");
/* harmony import */ var _progress_kendo_angular_grid__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! @progress/kendo-angular-grid */ "./node_modules/@progress/kendo-angular-grid/dist/es/index.js");
/* harmony import */ var _progress_kendo_angular_layout__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! @progress/kendo-angular-layout */ "./node_modules/@progress/kendo-angular-layout/dist/es/index.js");
/* harmony import */ var _component_nav_nav_component__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(/*! ./component/nav/nav.component */ "./src/app/component/nav/nav.component.ts");
/* harmony import */ var _component_welcome_welcome_component__WEBPACK_IMPORTED_MODULE_10__ = __webpack_require__(/*! ./component/welcome/welcome.component */ "./src/app/component/welcome/welcome.component.ts");
/* harmony import */ var _component_license_license_component__WEBPACK_IMPORTED_MODULE_11__ = __webpack_require__(/*! ./component/license/license.component */ "./src/app/component/license/license.component.ts");
/* harmony import */ var _component_configuration_configuration_component__WEBPACK_IMPORTED_MODULE_12__ = __webpack_require__(/*! ./component/configuration/configuration.component */ "./src/app/component/configuration/configuration.component.ts");
/* harmony import */ var _component_confirmation_confirmation_component__WEBPACK_IMPORTED_MODULE_13__ = __webpack_require__(/*! ./component/confirmation/confirmation.component */ "./src/app/component/confirmation/confirmation.component.ts");
/* harmony import */ var _component_installation_installation_component__WEBPACK_IMPORTED_MODULE_14__ = __webpack_require__(/*! ./component/installation/installation.component */ "./src/app/component/installation/installation.component.ts");
/* harmony import */ var _component_nav_bottom_nav_bottom_component__WEBPACK_IMPORTED_MODULE_15__ = __webpack_require__(/*! ./component/nav-bottom/nav-bottom.component */ "./src/app/component/nav-bottom/nav-bottom.component.ts");
/* harmony import */ var _component_complete_complete_component__WEBPACK_IMPORTED_MODULE_16__ = __webpack_require__(/*! ./component/complete/complete.component */ "./src/app/component/complete/complete.component.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};

















var AppModule = /** @class */ (function () {
    function AppModule() {
    }
    AppModule = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"])({
            declarations: [
                _app_component__WEBPACK_IMPORTED_MODULE_4__["AppComponent"],
                _component_nav_nav_component__WEBPACK_IMPORTED_MODULE_9__["NavComponent"],
                _component_welcome_welcome_component__WEBPACK_IMPORTED_MODULE_10__["WelcomeComponent"],
                _component_license_license_component__WEBPACK_IMPORTED_MODULE_11__["LicenseComponent"],
                _component_configuration_configuration_component__WEBPACK_IMPORTED_MODULE_12__["ConfigurationComponent"],
                _component_confirmation_confirmation_component__WEBPACK_IMPORTED_MODULE_13__["ConfirmationComponent"],
                _component_installation_installation_component__WEBPACK_IMPORTED_MODULE_14__["InstallationComponent"],
                _component_nav_bottom_nav_bottom_component__WEBPACK_IMPORTED_MODULE_15__["NavBottomComponent"],
                _component_complete_complete_component__WEBPACK_IMPORTED_MODULE_16__["CompleteComponent"]
            ],
            imports: [
                _angular_platform_browser_animations__WEBPACK_IMPORTED_MODULE_2__["BrowserAnimationsModule"],
                _angular_platform_browser__WEBPACK_IMPORTED_MODULE_1__["BrowserModule"],
                ngx_electron__WEBPACK_IMPORTED_MODULE_3__["NgxElectronModule"],
                _modules_routing_module__WEBPACK_IMPORTED_MODULE_5__["AppRoutingModule"],
                _progress_kendo_angular_grid__WEBPACK_IMPORTED_MODULE_7__["GridModule"],
                _progress_kendo_angular_layout__WEBPACK_IMPORTED_MODULE_8__["LayoutModule"]
            ],
            providers: [_services_powershell_service__WEBPACK_IMPORTED_MODULE_6__["PowershellService"]],
            bootstrap: [_app_component__WEBPACK_IMPORTED_MODULE_4__["AppComponent"]]
        })
    ], AppModule);
    return AppModule;
}());



/***/ }),

/***/ "./src/app/component/complete/complete.component.html":
/*!************************************************************!*\
  !*** ./src/app/component/complete/complete.component.html ***!
  \************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<div class=\"row\">\r\n    <div class=\"col\">\r\n      <p>\r\n        Complete\r\n      </p>\r\n    </div>\r\n  </div>"

/***/ }),

/***/ "./src/app/component/complete/complete.component.scss":
/*!************************************************************!*\
  !*** ./src/app/component/complete/complete.component.scss ***!
  \************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/component/complete/complete.component.ts":
/*!**********************************************************!*\
  !*** ./src/app/component/complete/complete.component.ts ***!
  \**********************************************************/
/*! exports provided: CompleteComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "CompleteComponent", function() { return CompleteComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var CompleteComponent = /** @class */ (function () {
    function CompleteComponent() {
    }
    CompleteComponent.prototype.ngOnInit = function () {
    };
    CompleteComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-complete',
            template: __webpack_require__(/*! ./complete.component.html */ "./src/app/component/complete/complete.component.html"),
            styles: [__webpack_require__(/*! ./complete.component.scss */ "./src/app/component/complete/complete.component.scss")]
        }),
        __metadata("design:paramtypes", [])
    ], CompleteComponent);
    return CompleteComponent;
}());



/***/ }),

/***/ "./src/app/component/configuration/configuration.component.html":
/*!**********************************************************************!*\
  !*** ./src/app/component/configuration/configuration.component.html ***!
  \**********************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<div class=\"row\">\r\n  <div class=\"col\">\r\n    <p>\r\n      Configuration\r\n    </p>\r\n  </div>\r\n</div>\r\n<app-nav-bottom [linkNext]=\"linkNext\" [linkPrev]=\"linkPrev\"></app-nav-bottom>"

/***/ }),

/***/ "./src/app/component/configuration/configuration.component.scss":
/*!**********************************************************************!*\
  !*** ./src/app/component/configuration/configuration.component.scss ***!
  \**********************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/component/configuration/configuration.component.ts":
/*!********************************************************************!*\
  !*** ./src/app/component/configuration/configuration.component.ts ***!
  \********************************************************************/
/*! exports provided: ConfigurationComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ConfigurationComponent", function() { return ConfigurationComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var ConfigurationComponent = /** @class */ (function () {
    function ConfigurationComponent() {
        this.linkNext = '/confirmation';
        this.linkPrev = '/license';
    }
    ConfigurationComponent.prototype.ngOnInit = function () {
    };
    ConfigurationComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-configuration',
            template: __webpack_require__(/*! ./configuration.component.html */ "./src/app/component/configuration/configuration.component.html"),
            styles: [__webpack_require__(/*! ./configuration.component.scss */ "./src/app/component/configuration/configuration.component.scss")]
        }),
        __metadata("design:paramtypes", [])
    ], ConfigurationComponent);
    return ConfigurationComponent;
}());



/***/ }),

/***/ "./src/app/component/confirmation/confirmation.component.html":
/*!********************************************************************!*\
  !*** ./src/app/component/confirmation/confirmation.component.html ***!
  \********************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<div class=\"row\">\r\n  <div class=\"col\">\r\n    <p>\r\n      Confirmation\r\n    </p>\r\n  </div>\r\n</div>\r\n<app-nav-bottom [linkNext]=\"linkNext\" [linkPrev]=\"linkPrev\"></app-nav-bottom>"

/***/ }),

/***/ "./src/app/component/confirmation/confirmation.component.scss":
/*!********************************************************************!*\
  !*** ./src/app/component/confirmation/confirmation.component.scss ***!
  \********************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/component/confirmation/confirmation.component.ts":
/*!******************************************************************!*\
  !*** ./src/app/component/confirmation/confirmation.component.ts ***!
  \******************************************************************/
/*! exports provided: ConfirmationComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ConfirmationComponent", function() { return ConfirmationComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var ConfirmationComponent = /** @class */ (function () {
    function ConfirmationComponent() {
        this.linkNext = '/installation';
        this.linkPrev = '/configuration';
    }
    ConfirmationComponent.prototype.ngOnInit = function () {
    };
    ConfirmationComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-confirmation',
            template: __webpack_require__(/*! ./confirmation.component.html */ "./src/app/component/confirmation/confirmation.component.html"),
            styles: [__webpack_require__(/*! ./confirmation.component.scss */ "./src/app/component/confirmation/confirmation.component.scss")]
        }),
        __metadata("design:paramtypes", [])
    ], ConfirmationComponent);
    return ConfirmationComponent;
}());



/***/ }),

/***/ "./src/app/component/installation/installation.component.html":
/*!********************************************************************!*\
  !*** ./src/app/component/installation/installation.component.html ***!
  \********************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<div class=\"row\">\r\n  <div class=\"col\">\r\n    <p>\r\n      Installation\r\n    </p>\r\n  </div>\r\n</div>\r\n<app-nav-bottom [linkNext]=\"linkNext\" [linkPrev]=\"linkPrev\"></app-nav-bottom>"

/***/ }),

/***/ "./src/app/component/installation/installation.component.scss":
/*!********************************************************************!*\
  !*** ./src/app/component/installation/installation.component.scss ***!
  \********************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/component/installation/installation.component.ts":
/*!******************************************************************!*\
  !*** ./src/app/component/installation/installation.component.ts ***!
  \******************************************************************/
/*! exports provided: InstallationComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "InstallationComponent", function() { return InstallationComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var InstallationComponent = /** @class */ (function () {
    function InstallationComponent() {
        this.linkNext = '/complete';
        this.linkPrev = '/configuration';
    }
    InstallationComponent.prototype.ngOnInit = function () {
    };
    InstallationComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-installation',
            template: __webpack_require__(/*! ./installation.component.html */ "./src/app/component/installation/installation.component.html"),
            styles: [__webpack_require__(/*! ./installation.component.scss */ "./src/app/component/installation/installation.component.scss")]
        }),
        __metadata("design:paramtypes", [])
    ], InstallationComponent);
    return InstallationComponent;
}());



/***/ }),

/***/ "./src/app/component/license/license.component.html":
/*!**********************************************************!*\
  !*** ./src/app/component/license/license.component.html ***!
  \**********************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<div class=\"row\">\r\n  <div class=\"col\">\r\n    <p>\r\n      Licensing\r\n    </p>\r\n  </div>\r\n</div>\r\n<app-nav-bottom [linkNext]=\"linkNext\" [linkPrev]=\"linkPrev\"></app-nav-bottom>"

/***/ }),

/***/ "./src/app/component/license/license.component.scss":
/*!**********************************************************!*\
  !*** ./src/app/component/license/license.component.scss ***!
  \**********************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/component/license/license.component.ts":
/*!********************************************************!*\
  !*** ./src/app/component/license/license.component.ts ***!
  \********************************************************/
/*! exports provided: LicenseComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "LicenseComponent", function() { return LicenseComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var LicenseComponent = /** @class */ (function () {
    function LicenseComponent() {
        this.linkNext = '/configuration';
        this.linkPrev = '/welcome';
    }
    LicenseComponent.prototype.ngOnInit = function () {
    };
    LicenseComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-license',
            template: __webpack_require__(/*! ./license.component.html */ "./src/app/component/license/license.component.html"),
            styles: [__webpack_require__(/*! ./license.component.scss */ "./src/app/component/license/license.component.scss")]
        }),
        __metadata("design:paramtypes", [])
    ], LicenseComponent);
    return LicenseComponent;
}());



/***/ }),

/***/ "./src/app/component/nav-bottom/nav-bottom.component.html":
/*!****************************************************************!*\
  !*** ./src/app/component/nav-bottom/nav-bottom.component.html ***!
  \****************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<nav class=\"navbar fixed-bottom navbar-light bg-light\">\n  <ul class=\"nav mx-auto\">\n    <li class=\"nav-item\">\n      <a class=\"nav-link\" [routerLink]=\"linkPrev\">Previous</a>\n    </li>\n    <li class=\"nav-item\">\n      <a class=\"nav-link\" [routerLink]=\"linkNext\">Next</a>\n    </li>\n  </ul>\n</nav>"

/***/ }),

/***/ "./src/app/component/nav-bottom/nav-bottom.component.scss":
/*!****************************************************************!*\
  !*** ./src/app/component/nav-bottom/nav-bottom.component.scss ***!
  \****************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/component/nav-bottom/nav-bottom.component.ts":
/*!**************************************************************!*\
  !*** ./src/app/component/nav-bottom/nav-bottom.component.ts ***!
  \**************************************************************/
/*! exports provided: NavBottomComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "NavBottomComponent", function() { return NavBottomComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var NavBottomComponent = /** @class */ (function () {
    function NavBottomComponent() {
        this.linkPrev = null;
        this.linkNext = null;
    }
    NavBottomComponent.prototype.ngOnInit = function () {
    };
    __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"])(),
        __metadata("design:type", Object)
    ], NavBottomComponent.prototype, "linkPrev", void 0);
    __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"])(),
        __metadata("design:type", Object)
    ], NavBottomComponent.prototype, "linkNext", void 0);
    NavBottomComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-nav-bottom',
            template: __webpack_require__(/*! ./nav-bottom.component.html */ "./src/app/component/nav-bottom/nav-bottom.component.html"),
            styles: [__webpack_require__(/*! ./nav-bottom.component.scss */ "./src/app/component/nav-bottom/nav-bottom.component.scss")]
        }),
        __metadata("design:paramtypes", [])
    ], NavBottomComponent);
    return NavBottomComponent;
}());



/***/ }),

/***/ "./src/app/component/nav/nav.component.html":
/*!**************************************************!*\
  !*** ./src/app/component/nav/nav.component.html ***!
  \**************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<nav class=\"navbar navbar-expand-sm navbar-light bg-light\">\r\n  <a class=\"navbar-brand\" href=\"#\">\r\n    <img src=\"assets/cmp-icon.png\" width=\"30\" height=\"30\" alt=\"\" style=\"border-radius: .25rem\">\r\n  </a>\r\n  <ul class=\"navbar-nav content-justify-center\">\r\n    <li class=\"nav-item active\">\r\n      <a class=\"nav-link\" routerLink=\"/welcome\">Welcome</a>\r\n    </li>\r\n    <li class=\"nav-item\">\r\n      <a class=\"nav-link\" routerLink=\"/license\">License</a>\r\n    </li>\r\n    <li class=\"nav-item\">\r\n      <a class=\"nav-link\" routerLink=\"/configuration\">Configuration</a>\r\n    </li>\r\n    <li class=\"nav-item\">\r\n      <a class=\"nav-link\" routerLink=\"/confirmation\">Confirmation</a>\r\n    </li>\r\n    <li class=\"nav-item\">\r\n      <a class=\"nav-link\" routerLink=\"/installation\">Installation</a>\r\n    </li>\r\n    <li class=\"nav-item\">\r\n        <a class=\"nav-link\" routerLink=\"/complete\">Completed</a>\r\n      </li>\r\n  </ul>\r\n</nav>"

/***/ }),

/***/ "./src/app/component/nav/nav.component.scss":
/*!**************************************************!*\
  !*** ./src/app/component/nav/nav.component.scss ***!
  \**************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/component/nav/nav.component.ts":
/*!************************************************!*\
  !*** ./src/app/component/nav/nav.component.ts ***!
  \************************************************/
/*! exports provided: NavComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "NavComponent", function() { return NavComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var NavComponent = /** @class */ (function () {
    function NavComponent() {
    }
    NavComponent.prototype.ngOnInit = function () {
    };
    NavComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-nav',
            template: __webpack_require__(/*! ./nav.component.html */ "./src/app/component/nav/nav.component.html"),
            styles: [__webpack_require__(/*! ./nav.component.scss */ "./src/app/component/nav/nav.component.scss")]
        }),
        __metadata("design:paramtypes", [])
    ], NavComponent);
    return NavComponent;
}());



/***/ }),

/***/ "./src/app/component/welcome/welcome.component.html":
/*!**********************************************************!*\
  !*** ./src/app/component/welcome/welcome.component.html ***!
  \**********************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<div class=\"row\">\r\n  <div class=\"col\">\r\n    <p>\r\n      Welcome to the Cireson Control Center installer.\r\n    </p>\r\n    <p>\r\n      Here we will help you install the Control Center application and then take you to the Control Center website.\r\n    </p>\r\n  </div>\r\n</div>\r\n<div class=\"row\">\r\n  <div class=\"col-sm-6\">\r\n    <button class=\"btn btn-primary\" (click)=\"runStream()\">Run Stream</button>\r\n  </div>\r\n  <div class=\"col-sm-6\">\r\n    <button class=\"btn btn-primary\" (click)=\"runJson()\">Run Json</button>\r\n  </div>\r\n</div>\r\n<div class=\"row\">\r\n  <div class=\"col\">\r\n    <code>{{json | json}}</code>\r\n  </div>\r\n</div>\r\n<div class=\"row\">\r\n  <div class=\"col\">\r\n    <code *ngFor=\"let item of messages\">{{item}}<br></code>\r\n  </div>\r\n</div>\r\n<app-nav-bottom [linkNext]=\"linkNext\" [linkPrev]=\"linkPrev\"></app-nav-bottom>"

/***/ }),

/***/ "./src/app/component/welcome/welcome.component.scss":
/*!**********************************************************!*\
  !*** ./src/app/component/welcome/welcome.component.scss ***!
  \**********************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/component/welcome/welcome.component.ts":
/*!********************************************************!*\
  !*** ./src/app/component/welcome/welcome.component.ts ***!
  \********************************************************/
/*! exports provided: WelcomeComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "WelcomeComponent", function() { return WelcomeComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var rxjs_operators_take__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! rxjs/operators/take */ "./node_modules/rxjs-compat/_esm5/operators/take.js");
/* harmony import */ var _services_powershell_models__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../services/powershell.models */ "./src/app/services/powershell.models.ts");
/* harmony import */ var _services_powershell_service__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./../../services/powershell.service */ "./src/app/services/powershell.service.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};




var WelcomeComponent = /** @class */ (function () {
    function WelcomeComponent(psService, ref) {
        this.psService = psService;
        this.ref = ref;
        this.linkNext = '/license';
        this.linkPrev = null;
        this.messages = ["Waiting for stream..."];
    }
    WelcomeComponent.prototype.ngOnInit = function () {
    };
    WelcomeComponent.prototype.runStream = function () {
        var _this = this;
        this.psService
            .stream(_services_powershell_models__WEBPACK_IMPORTED_MODULE_2__["PsCommandType"].Script, 'Test-Stream.ps1', [
            { Number: 1 },
            { Letter: 'A' },
            { Text: 'Hello world.' },
            { ComputerName: 'localhost' },
            { InternetAddress: 'http://www.google.com' }
        ])
            .subscribe(function (data) {
            console.log(data);
            _this.messages.push(data.output);
        }, function (err) {
            console.log(err);
        });
    };
    WelcomeComponent.prototype.runJson = function () {
        var _this = this;
        setTimeout(function () { return _this.messages.push('Clicked the JSON button.'); }, 1000);
        this.psService
            .invoke(_services_powershell_models__WEBPACK_IMPORTED_MODULE_2__["PsCommandType"].Script, 'Test-Json.ps1', [
            { Number: 1 },
            { Letter: 'A' },
            { Text: 'Hello world.' },
            { ComputerName: 'localhost' },
            { InternetAddress: 'http://www.google.com' }
        ])
            .subscribe(function (data) {
            console.log(data);
            _this.json = data;
        }, function (err) {
            console.log(err);
        });
    };
    WelcomeComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-welcome',
            template: __webpack_require__(/*! ./welcome.component.html */ "./src/app/component/welcome/welcome.component.html"),
            styles: [__webpack_require__(/*! ./welcome.component.scss */ "./src/app/component/welcome/welcome.component.scss")]
        }),
        __metadata("design:paramtypes", [_services_powershell_service__WEBPACK_IMPORTED_MODULE_3__["PowershellService"], _angular_core__WEBPACK_IMPORTED_MODULE_0__["ChangeDetectorRef"]])
    ], WelcomeComponent);
    return WelcomeComponent;
}());



/***/ }),

/***/ "./src/app/modules/routing.module.ts":
/*!*******************************************!*\
  !*** ./src/app/modules/routing.module.ts ***!
  \*******************************************/
/*! exports provided: AppRoutingModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppRoutingModule", function() { return AppRoutingModule; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/fesm5/router.js");
/* harmony import */ var _component_configuration_configuration_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../component/configuration/configuration.component */ "./src/app/component/configuration/configuration.component.ts");
/* harmony import */ var _component_confirmation_confirmation_component__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../component/confirmation/confirmation.component */ "./src/app/component/confirmation/confirmation.component.ts");
/* harmony import */ var _component_installation_installation_component__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ../component/installation/installation.component */ "./src/app/component/installation/installation.component.ts");
/* harmony import */ var _component_license_license_component__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ../component/license/license.component */ "./src/app/component/license/license.component.ts");
/* harmony import */ var _component_welcome_welcome_component__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ../component/welcome/welcome.component */ "./src/app/component/welcome/welcome.component.ts");
/* harmony import */ var _component_complete_complete_component__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! ./../component/complete/complete.component */ "./src/app/component/complete/complete.component.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};








var routes = [
    {
        path: '',
        component: _component_welcome_welcome_component__WEBPACK_IMPORTED_MODULE_6__["WelcomeComponent"]
    },
    {
        path: 'welcome',
        component: _component_welcome_welcome_component__WEBPACK_IMPORTED_MODULE_6__["WelcomeComponent"]
    },
    {
        path: 'license',
        component: _component_license_license_component__WEBPACK_IMPORTED_MODULE_5__["LicenseComponent"]
    },
    {
        path: 'configuration',
        component: _component_configuration_configuration_component__WEBPACK_IMPORTED_MODULE_2__["ConfigurationComponent"]
    },
    {
        path: 'confirmation',
        component: _component_confirmation_confirmation_component__WEBPACK_IMPORTED_MODULE_3__["ConfirmationComponent"]
    },
    {
        path: 'installation',
        component: _component_installation_installation_component__WEBPACK_IMPORTED_MODULE_4__["InstallationComponent"]
    },
    {
        path: 'complete',
        component: _component_complete_complete_component__WEBPACK_IMPORTED_MODULE_7__["CompleteComponent"]
    }
];
var AppRoutingModule = /** @class */ (function () {
    function AppRoutingModule() {
    }
    AppRoutingModule = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"])({
            imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forRoot(routes, { useHash: true })],
            exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]]
        })
    ], AppRoutingModule);
    return AppRoutingModule;
}());



/***/ }),

/***/ "./src/app/services/powershell.models.ts":
/*!***********************************************!*\
  !*** ./src/app/services/powershell.models.ts ***!
  \***********************************************/
/*! exports provided: PsCommandType */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "PsCommandType", function() { return PsCommandType; });
var PsCommandType;
(function (PsCommandType) {
    PsCommandType[PsCommandType["Command"] = 0] = "Command";
    PsCommandType[PsCommandType["Script"] = 1] = "Script";
})(PsCommandType || (PsCommandType = {}));


/***/ }),

/***/ "./src/app/services/powershell.service.ts":
/*!************************************************!*\
  !*** ./src/app/services/powershell.service.ts ***!
  \************************************************/
/*! exports provided: PowershellService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "PowershellService", function() { return PowershellService; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var ngx_electron__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ngx-electron */ "./node_modules/ngx-electron/index.js");
/* harmony import */ var rxjs__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! rxjs */ "./node_modules/rxjs/_esm5/index.js");
/* harmony import */ var uuid_v4__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! uuid/v4 */ "./node_modules/uuid/v4.js");
/* harmony import */ var uuid_v4__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(uuid_v4__WEBPACK_IMPORTED_MODULE_3__);
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};




var PowershellService = /** @class */ (function () {
    function PowershellService(_electronService, zone) {
        this._electronService = _electronService;
        this.zone = zone;
    }
    PowershellService.prototype.stream = function (commandType, command, args) {
        var _this = this;
        return new rxjs__WEBPACK_IMPORTED_MODULE_2__["Observable"](function (observer) {
            var uuid = uuid_v4__WEBPACK_IMPORTED_MODULE_3__();
            var ipc = _this._electronService.ipcRenderer;
            console.log(uuid, commandType, command, args);
            ipc.send('powershell-invoke-console', { uuid: uuid, commandType: commandType, command: command, args: args });
            ipc.on("powershell-invoke-message-" + uuid, function (event, res) {
                _this.zone.run(function () { return observer.next(res); });
            });
            ipc.on("powershell-invoke-success-" + uuid, function (event, res) {
                _this.zone.run(function () { return observer.complete(); });
            });
            ipc.on("powershell-invoke-error-" + uuid, function (event, err) {
                _this.zone.run(function () { return observer.error(err); });
            });
            return {
                unsubscribe: function () {
                    ipc.removeAllListeners("powershell-invoke-message-" + uuid);
                    ipc.removeAllListeners("powershell-invoke-success-" + uuid);
                    ipc.removeAllListeners("powershell-invoke-error-" + uuid);
                }
            };
        });
    };
    PowershellService.prototype.invoke = function (commandType, command, args) {
        var _this = this;
        return new rxjs__WEBPACK_IMPORTED_MODULE_2__["Observable"](function (observer) {
            var uuid = uuid_v4__WEBPACK_IMPORTED_MODULE_3__();
            var ipc = _this._electronService.ipcRenderer;
            console.log(uuid, commandType, command, args);
            ipc.send('powershell-invoke-json', { uuid: uuid, commandType: commandType, command: command, args: args });
            ipc.on("powershell-invoke-success-" + uuid, function (event, res) {
                console.log(res);
                _this.zone.run(function () {
                    observer.next(res);
                    observer.complete();
                });
            });
            ipc.on("powershell-invoke-error-" + uuid, function (event, err) {
                _this.zone.run(function () { return observer.error(err); });
            });
            return {
                unsubscribe: function () {
                    ipc.removeAllListeners("powershell-invoke-success-" + uuid);
                    ipc.removeAllListeners("powershell-invoke-error-" + uuid);
                }
            };
        });
    };
    PowershellService.prototype.listScripts = function () {
        var _this = this;
        this._electronService.ipcRenderer.send('powershell-get-scripts');
        return new Promise(function (resolve, reject) {
            _this._electronService.ipcRenderer.once('powershell-get-scripts', function (event, result) { return resolve(event); });
        });
    };
    PowershellService = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Injectable"])(),
        __metadata("design:paramtypes", [ngx_electron__WEBPACK_IMPORTED_MODULE_1__["ElectronService"], _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgZone"]])
    ], PowershellService);
    return PowershellService;
}());



/***/ }),

/***/ "./src/environments/environment.ts":
/*!*****************************************!*\
  !*** ./src/environments/environment.ts ***!
  \*****************************************/
/*! exports provided: environment */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "environment", function() { return environment; });
// The file contents for the current environment will overwrite these during build.
// The build system defaults to the dev environment which uses `environment.ts`, but if you do
// `ng build --env=prod` then `environment.prod.ts` will be used instead.
// The list of which env maps to which file can be found in `.angular-cli.json`.
var environment = {
    production: false
};


/***/ }),

/***/ "./src/main.ts":
/*!*********************!*\
  !*** ./src/main.ts ***!
  \*********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_platform_browser_dynamic__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/platform-browser-dynamic */ "./node_modules/@angular/platform-browser-dynamic/fesm5/platform-browser-dynamic.js");
/* harmony import */ var _app_app_module__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./app/app.module */ "./src/app/app.module.ts");
/* harmony import */ var _environments_environment__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./environments/environment */ "./src/environments/environment.ts");




if (_environments_environment__WEBPACK_IMPORTED_MODULE_3__["environment"].production) {
    Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["enableProdMode"])();
}
Object(_angular_platform_browser_dynamic__WEBPACK_IMPORTED_MODULE_1__["platformBrowserDynamic"])().bootstrapModule(_app_app_module__WEBPACK_IMPORTED_MODULE_2__["AppModule"])
    .catch(function (err) { return console.log(err); });


/***/ }),

/***/ 0:
/*!***************************!*\
  !*** multi ./src/main.ts ***!
  \***************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(/*! C:\source\ElectronSetupApplication\src\main.ts */"./src/main.ts");


/***/ })

},[[0,"runtime","vendor"]]]);
//# sourceMappingURL=main.js.map