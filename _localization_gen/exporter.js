var gulp = require('gulp'),
    fs = require('fs'),
    i18nJsonTools = require('gulp-i18n-json-tools');

function _merge() {
    return i18nJsonTools
        .jsonMerger(
            require('./merge/en.json'),     // base language to inherit missing keys
            require('./merge/es.json'),     // language to merge with base language
            'result-es.json')               // output file name
        .pipe(gulp.dest('./merge'));        // destination folder
}

function _export() {
    return i18nJsonTools
        .jsonToCsv(
            require('./en.json'),    // json to export to CSV
            'result-en.csv')                // output file name
        .pipe(gulp.dest('./export'));       // destination folder
}

function _import() {
    return i18nJsonTools
        .updateJsonFromCsv(
            require('./import/to-fill.json'),               // target json to try to fill with csv keys
            fs.readFileSync('./import/en.csv', 'utf8'),     // csv to import
            'result-en.json')                               // output file updated with csv matched content
        .pipe(gulp.dest('./import'));                       // destination folder
}

// _export();