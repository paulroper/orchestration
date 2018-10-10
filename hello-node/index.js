const express = require('express');
const fetch = require('node-fetch');

const app = express();
const port = process.env.PORT || 8080;

app.get('/', async (req, res) => {
  console.log('Received a request!');
  console.log(req);
  console.log();

  let message = 'Hello world!';

  try {
    const fetchRes = await fetch('http://go-http:3000/uppercase', {
      body: JSON.stringify({ input: message }),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      method: 'POST',
    });

    const jsonRes = await fetchRes.json();
    console.log(jsonRes);

    message = jsonRes.output;
  } catch (e) {
    console.log();
    console.log('Error talking to go-http service');
    console.log(e);
    console.log();
  }

  return res.json({ message });
});

app.listen(port, () => console.log(`Listening at http://localhost:${port}`));
