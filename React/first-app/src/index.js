import React from 'react';
import ReactDOM from 'react-dom/client';

import './index.css';

function App() {
  const jsx =
    <div>
      <main className="section">
        <h2>go deploy labs</h2>
        <p>React App</p>
        <p>I am a Docker Container!</p>
      </main>
    </div>

  return(jsx);
}

class SiteComponents extends React.Component {
  render() {
    return (
      <div>
        <App/>
      </div>
    );
  }
}


const root = ReactDOM.createRoot(
  document.getElementById('root')
);

root.render(<SiteComponents/>)