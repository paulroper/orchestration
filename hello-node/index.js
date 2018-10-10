const express = require('express');
const app = express();
const port = process.env.PORT || 8080;

app.get('/', (req, res) => {
  console.log('Received a request!');
  console.log(req);
  console.log();

  return res.json({ message: 'Hello world!' });
});

app.listen(port, () => console.log(`Listening at http://localhost:${port}`));
