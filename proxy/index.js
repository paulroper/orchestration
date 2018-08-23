const express = require('express');
const fetch = require('node-fetch');

var app = express();

app.get('/', (req, res) => {
  console.log();
  console.log('Fetching from hello-node...');

  fetch('http://hello-node:8080', { timeout: 5000 })
    .then(helloRes => {
      console.log('Got response from hello-node!');
      helloRes.json().then(json => res.json(json));
    })
    .catch(err => {
      console.log(err);
      res.status(500).send('Oh no!');
    });
});

console.log('Listening on port 5050');
app.listen(5050);
