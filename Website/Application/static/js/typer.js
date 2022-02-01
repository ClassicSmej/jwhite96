

var app = document.getElementById('app');

var typewriter = new Typewriter(app, {
    loop: true,
    delay: 100,
});

typewriter.typeString("<label id='writer1'>Hi I'm James White</label>")
    .pauseFor(2500)
    .deleteAll()
    .typeString("<label id='writer2'>AWS Cloud Specialist</label>")
    .pauseFor(2500)
    .deleteAll()
    .typeString("<label id='writer3'>Cloud Platforms</label>")
    .pauseFor(2500)
    .deleteAll()
    .typeString("<label id='writer4'>Cisco Networking</label>")
    .pauseFor(2500)
    .deleteAll()
    .typeString("<label id='writer5'>Django Web Framework</label>")
    .pauseFor(2500)
    .deleteAll()
    .start();

