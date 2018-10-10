const express = require('express');
const fetch = require('node-fetch');

var app = express();

app.get('/', async (req, res) => {
  console.log();
  console.log('Fetching from hello-node...');

  try {
    const fetchRes = await fetch('http://hello-node:8080');
    const jsonRes = await fetchRes.json();

    console.log(jsonRes);

    return res.status(200).json(jsonRes);
  } catch (err) {
    console.log(err);

    if (err.response) {
      console.log();
      console.log(`Error text: ${err.response.text()}`);
      console.log();
    }

    return res.status(500).json({ message: 'Error talking to hello-node service' });
  }
});

console.log('Listening on port 5050');
app.listen(5050);
