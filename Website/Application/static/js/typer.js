
var app = document.getElementById('app');

var typewriter = new Typewriter(app, {
    loop: true
});

typewriter.typeString("<label style='color: #fc1d33'>Hi I'm James White</label>")
    .pauseFor(2500)
    .deleteAll()
    .typeString("<label style='color: #99C6E5'>I'm a Cloud Specialist</label>")
    .pauseFor(2500)
    .deleteAll()
    .typeString("<label style='color: #9CE6AF'>I Love Cloud</label>")
    .pauseFor(2500)
    .deleteAll()
    .typeString("<label style='color: #d7e61a'>I Love Code</label>")
    .pauseFor(2500)
    .deleteAll()
    .typeString("<label style='color: #B299E6'>Go Explore</label>")
    .pauseFor(2500)
    .start();