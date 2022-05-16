
var app = document.getElementById('app');

var typewriter = new Typewriter(app, {
    loop: true,
    delay: 100,
});

typewriter.typeString("Hi I'm James White<br>Cloud Specialist")
    .pauseFor(3500)
    .deleteAll()
    .start();

