'use strict';

require('./index.html');

var Elm = require('./Main');
var elm = Elm.Main.fullscreen();


elm.ports.alert.subscribe(function(message) {
  alert(message);
  // elm.ports.log.send('Alert called: ' + message);
});

elm.ports.formFix.subscribe(function() {
  Materialize.updateTextFields();
  // elm.ports.log.send('formFix has run');
});


setTimeout(() => {
    $(".button-collapse").sideNav();

    // $('.modal-trigger').leanModal();

    // $('.dropdown-button').dropdown({
    //     inDuration: 300,
    //     outDuration: 225,
    //     constrain_width: false, // Does not change width of dropdown to that of the activator
    //     gutter: 0,              // Spacing from edge
    //     belowOrigin: false,     // Displays dropdown below the button
    //     alignment: 'left'
    //     // hover: true,
    // });

}, 500);
