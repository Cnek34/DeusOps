// src/index.ts
import express from 'express';

const app = express();
// Используем переменную окружения PORT или 3000 по умолчанию
const PORT = process.env.PORT || 3000;
const MESSAGE = process.env.MESSAGE || "Hello from Docker!";

app.get('/', (req, res) => {
  res.send({
    status: "ok",
    message: MESSAGE,
    user: process.env.USER || "non-root-user"
  });
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
