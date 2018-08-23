const express = require('express');
const app = express();
const port = process.env.PORT || 8080;

app.get('/', (req, res) => res.json({ message: 'Hello world!' }));

app.listen(port, () => console.log(`Listening at http://localhost:${port}`));
