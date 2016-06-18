'use strict';

require('./index.html');
var Elm = require('./Main');

var elm = Elm.Main.fullscreen();

//interop
// elm.ports.alert.subscribe(function(message) {
//   alert(message);
//   elm.ports.log.send('Alert called: ' + message);
// });

setTimeout(() => {
    // $('.modal-trigger').leanModal();
    //
    // $('.dropdown-button').dropdown({
    //     inDuration: 300,
    //     outDuration: 225,
    //     constrain_width: false, // Does not change width of dropdown to that of the activator
    //     // hover: true, // Activate on hover
    //     gutter: 0, // Spacing from edge
    //     belowOrigin: false, // Displays dropdown below the button
    //     alignment: 'left' // Displays dropdown with edge aligned to the left of button
    // });

    $(".button-collapse").sideNav();

}, 500);
