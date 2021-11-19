

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
    .typeString("<label id='writer3'>I Build Cloud Services</label>")
    .pauseFor(2500)
    .deleteAll()
    .typeString("<label id='writer4'>I Build Websites</label>")
    .pauseFor(2500)
    .deleteAll()
    .typeString("<label id='writer5'>Go Explore</label>")
    .pauseFor(2500)
    .start();

